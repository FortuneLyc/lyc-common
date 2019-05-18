package com.act.common.orm.zk;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.NodeCache;
import org.apache.curator.framework.recipes.cache.NodeCacheListener;
import org.apache.curator.retry.RetryNTimes;

import com.act.common.other.param.Args;

public class ZkConfigManager {
//    private static final Logger logger = LoggerFactory.getLogger(ZkConfigManager.class);
    private String connectString;
    private String configRootPath;
    private CuratorFramework client;
    private Map<String, NodeCache> nodeCacheMap = new ConcurrentHashMap<>();

    public ZkConfigManager(String connectString, String configRootPath) {
        this.connectString = connectString;
        this.configRootPath = handlePath(configRootPath);
        client = CuratorFrameworkFactory.newClient(
                connectString,
                new RetryNTimes(10, 5000)
        );
        client.start();
    }
    public void close(){
        client.close();
    }
    public void put(String path, String value, boolean isOverwrite, final ZkConfigListener listener) throws Exception {
        Args.notNull(path, "path");
        Args.notNull(value, "value");

        String finalPath = handlePath(configRootPath, path);
        if (client.checkExists().forPath(finalPath) == null) {
            client.create()
                    .creatingParentsIfNeeded()
                    .forPath(finalPath, value.getBytes());
        } else if (isOverwrite) {
            client.setData().forPath(finalPath, value.getBytes());
        }


        final NodeCache nc = new NodeCache(client, finalPath);
        if(listener != null){
            nc.getListenable().addListener(new NodeCacheListener() {
                @Override
                public void nodeChanged() throws Exception {
                    listener.valueChanged(new String(nc.getCurrentData().getData()));
                }
            });
        }
        nc.start(true);
        nodeCacheMap.put(finalPath, nc);
    }

    public String get(String path) throws Exception {
        Args.notNull(path, "path");
        String finalPath = handlePath(configRootPath, path);
        final NodeCache nodeCache = nodeCacheMap.get(finalPath);
        if (nodeCache == null){
            throw new Exception(path + "没有定义配置");
        }
        return new String(nodeCache.getCurrentData().getData());
    }

    public void addListener(String path, final ZkConfigListener listener) throws Exception {
        Args.notNull(path, "path");
        Args.notNull(listener, "listener");
        String finalPath = handlePath(configRootPath, path);

        final NodeCache nodeCache = nodeCacheMap.get(finalPath);
        if (nodeCache == null){
            throw new Exception(path + "没有定义配置");
        }
        nodeCache.getListenable().addListener(new NodeCacheListener() {
            @Override
            public void nodeChanged() throws Exception {
                listener.valueChanged(new String(nodeCache.getCurrentData().getData()));
            }
        });
    }

    private static String handlePath(String rootPath){
        String result = rootPath.trim();
        if (!result.startsWith("/")){
            result = "/" + result;
        }
        if (result.endsWith("/")){
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }
    private static String handlePath(String rootPath, String relative){
        String result = handlePath(rootPath);
        String result1 = handlePath(relative);
        return result + result1;
    }


    public String getConnectString() {
        return connectString;
    }

    public String getConfigRootPath() {
        return configRootPath;
    }
//
//    private static String ZK_PATH = "/zkTest/aaa";
//    public static void main(String[] args) throws Throwable {
//        String a = "  /aa/bb/";
//        String b = "/cc/dd/";
//        System.out.println(handlePath(a));
//        System.out.println(handlePath(a, b));
////        // 1.Connect to zk
////        CuratorFramework client = CuratorFrameworkFactory.newClient(
////                "127.0.0.1:2181",
////                new RetryNTimes(10, 5000)
////        );
////        client.start();
////        final NodeCache nc = new NodeCache(client, ZK_PATH);
////        nc.getListenable().addListener(new NodeCacheListener() {
////            @Override
////            public void nodeChanged() throws Exception {
////                System.out.println(nc.getCurrentData().toString());
////            }
////        });
////        nc.start(true);
////        System.out.println(nc.getCurrentData());
////        Thread.sleep(100000L);
////
////        System.out.println("zk client start successfully!");
////
////        // 2.Client API test
////        // 2.1 Create node
////        String data1 = "hello";
////        client.create().
////                creatingParentsIfNeeded().
////                forPath(ZK_PATH, data1.getBytes());
////
////        // 2.2 Get node and data
////        System.out.println(client.getChildren().forPath("/"));
////        System.out.println(new String(client.getData().forPath(ZK_PATH)));
////
////        // 2.3 Modify data
////        String data2 = "world";
////        client.setData().forPath(ZK_PATH, data2.getBytes());
////        System.out.println(new String(client.getData().forPath(ZK_PATH)));
////
////        // 2.4 Remove node
////        client.delete().forPath(ZK_PATH);
////        System.out.println(client.getChildren().forPath("/"));
//
//    }


}
