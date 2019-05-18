package com.act.common.net.utils;


import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLException;
import javax.net.ssl.SSLHandshakeException;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.NameValuePair;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.config.FastJsonConfig;

public final class HttpUtils {
	private static Logger logger = LoggerFactory.getLogger(HttpUtils.class);
	private HttpUtils() {
	}

	private static final int MAX_TOTAL = 400;
	private static final int MAX_PER_ROUTE = 200;
	private static final int MAX_CONNECTION = 4;

	private static final int CONNECT_TIMEOUT = 10000;
	private static final int SOCKE_TTIMEOUT = 10000;
	private static final int CONNECTION_REQUEST_TIMEOUT = 10000;

	private static CloseableHttpClient defaultHttpClient = createHttpClient(MAX_TOTAL, MAX_PER_ROUTE);


	private static final RequestConfig requestConfig = RequestConfig.custom()
			.setSocketTimeout(SOCKE_TTIMEOUT)	//指客户端从服务器读取数据的timeout，超出后会抛出SocketTimeOutException
            .setConnectTimeout(CONNECT_TIMEOUT)	//指客户端和服务器建立连接的timeout
            .setConnectionRequestTimeout(CONNECTION_REQUEST_TIMEOUT)	//指从连接池获取连接的timeout
            .build();

    /**
    *
    * postJson: . <br/>
    * <br/>
    * @author lyc
    * @param
    * timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
    * SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
    * CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
    * CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
    * @return
     * @throws IOException
     * @throws ClientProtocolException
    * @since JDK 1.7
    */
	public static String postJson(String url,String json,int... timeoutConfig) throws IOException{
		logger.info("连接URL: {}",url);
		HttpPost httpPost = new HttpPost(url);
		if (StringUtils.isNotBlank(json)) {
			StringEntity httpEntity = new StringEntity(json, "UTF-8");
			httpEntity.setContentType("application/json");
			httpPost.setEntity(httpEntity);
		}
		return connect(httpPost, timeoutConfig);
	}
	/**
    *
    * postJson: . <br/>
    * <br/>
    * @author lyc
    * @param
    * timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
    * SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
    * CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
    * CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
    * @return
	 * @throws IOException
    * @since JDK 1.7
    */
	public static String postJson(String url,Object object,FastJsonConfig fastJsonConfig, int... timeoutConfig) throws IOException{
		String json = JSON.toJSONString(object,
				fastJsonConfig.getSerializeConfig(),
				fastJsonConfig.getSerializeFilters(),
				fastJsonConfig.getDateFormat(),
				JSON.DEFAULT_GENERATE_FEATURE,
				fastJsonConfig.getSerializerFeatures());
		return postJson(url, json, timeoutConfig);
	}
	private static String connect(final HttpRequestBase request, int[] timeoutConfig) throws IOException{

		CloseableHttpResponse response = null;
		String result = "";
		try {
			configDefaultHttpRequest(request, timeoutConfig);
			response = defaultHttpClient.execute(request);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				result = EntityUtils.toString(response.getEntity(), "UTF-8");
			}else{
				return null;
			}
			if (StringUtils.isBlank(result)) {
				return null;
			}

			return result;
		} finally {
			HttpClientUtils.closeQuietly(response);
		}
	}
	/**
    *
    * postMap: . <br/>
    * <br/>
    * @author lyc
    * @param
    * timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
    * SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
    * CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
    * CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
    * @return
	 * @throws IOException
    * @since JDK 1.7
    */
	public static String postMap(String url,Map<String,Object> params, int... timeoutConfig) throws IOException{
		logger.info("连接URL: {}",url);
		HttpPost httpPost = new HttpPost(url);
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();

		if(params!=null && !params.isEmpty()){
			for(Map.Entry<String, Object> map:params.entrySet()){
				if(!StringUtils.isEmpty(map.getKey())){
					formparams.add(new BasicNameValuePair(map.getKey(), map.getValue().toString()));
				}
			}
			if(formparams.size()>0){
				UrlEncodedFormEntity uefEntity;
				try {
					uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");
					httpPost.setEntity(uefEntity);
				} catch (UnsupportedEncodingException e) {
					logger.warn("运行环境不支持UTF-8编码字符集");
					return "";
				}
			}
		}
		return connect(httpPost, timeoutConfig);
	}

    private static void configDefaultHttpRequest(HttpRequestBase httpRequestBase, int[] timeoutConfig) {
        // 设置Header等
        // httpRequestBase.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36");

        httpRequestBase.setHeader("Accept", "text/html, application/json, text/javascript, */*; q=0.01");
        httpRequestBase.setHeader("Accept-Language", "zh-CN,zh;q=0.8");
        httpRequestBase.setHeader("Accept-Charset", "utf-8;");
        httpRequestBase.setHeader("Connection", "close");//不保持连接

        if (timeoutConfig == null) {
        	httpRequestBase.setConfig(requestConfig);
		}else if (timeoutConfig.length==1) {
			httpRequestBase.setConfig(
					RequestConfig.custom()
						.setSocketTimeout(timeoutConfig[0])	//指客户端从服务器读取数据的timeout，超出后会抛出SocketTimeOutException
			            .setConnectTimeout(CONNECT_TIMEOUT)	//指客户端和服务器建立连接的timeout
			            .setConnectionRequestTimeout(CONNECTION_REQUEST_TIMEOUT)	//指从连接池获取连接的timeout
			            .build()
		            );
		}else if (timeoutConfig.length==2) {
			httpRequestBase.setConfig(
					RequestConfig.custom()
						.setSocketTimeout(timeoutConfig[0])	//指客户端从服务器读取数据的timeout，超出后会抛出SocketTimeOutException
			            .setConnectTimeout(timeoutConfig[1])	//指客户端和服务器建立连接的timeout
			            .setConnectionRequestTimeout(CONNECTION_REQUEST_TIMEOUT)	//指从连接池获取连接的timeout
			            .build()
		            );
		}else if (timeoutConfig.length==3) {
			httpRequestBase.setConfig(
					RequestConfig.custom()
						.setSocketTimeout(timeoutConfig[0])	//指客户端从服务器读取数据的timeout，超出后会抛出SocketTimeOutException
			            .setConnectTimeout(timeoutConfig[1])	//指客户端和服务器建立连接的timeout
			            .setConnectionRequestTimeout(timeoutConfig[2])	//指从连接池获取连接的timeout
			            .build()
		            );
		}

    }

    /**
     *
     * createHttpClient: . <br/>
     * <br/>
     * @author lyc
     * @param maxTotal
     * @param maxPerRoute
     * @return
     * @since JDK 1.7
     */
	public static CloseableHttpClient createHttpClient(int maxTotal, int maxPerRoute) {

		HttpClientConnectionManager cm = getHttpClientConnectionManager(maxTotal, maxPerRoute);

		// 请求重试处理
        HttpRequestRetryHandler httpRequestRetryHandler = new HttpRequestRetryHandler() {
            @Override
			public boolean retryRequest(IOException exception,
                    int executionCount, HttpContext context) {

                if (executionCount >= MAX_CONNECTION) {
                	logger.warn("如果已经重试了 {} 次，放弃",MAX_CONNECTION);
                    return false;
                }
                if (exception instanceof NoHttpResponseException) {
                	logger.warn("如果服务器丢掉了连接 重试第 {} 次",executionCount);
                    return true;
                }
                if (exception instanceof InterruptedIOException) {
                	logger.warn("超时 重试第 {} 次",executionCount);
                    return true;
                }
                if (exception instanceof SSLHandshakeException) {
                	logger.warn("SSL握手异常 重试第 {} 次，放弃",executionCount);
                    return false;
                }
                if (exception instanceof SSLException) {
                	logger.warn("SSL握手异常 重试第 {} 次，放弃",executionCount);
                    return false;
                }
                if (exception instanceof UnknownHostException) {
                	logger.warn("目标服务器不可达 重试第 {} 次，放弃",executionCount);
                    return false;
                }
                if (exception instanceof ConnectTimeoutException) {
                	logger.warn("连接被拒绝 重试第 {} 次，放弃",executionCount);
                    return false;
                }
                HttpClientContext clientContext = HttpClientContext
                        .adapt(context);
                HttpRequest request = clientContext.getRequest();
                if (!(request instanceof HttpEntityEnclosingRequest)) {
                	logger.warn("幂等请求 重试第 {} 次",executionCount);
                    return true;
                }
                logger.warn("未知连接失败，重试次数:{}，结束重试连接",executionCount);
                return false;
            }
        };

        return HttpClients.custom().setConnectionManager(cm).setRetryHandler(httpRequestRetryHandler).build();
	}

	private static HttpClientConnectionManager getHttpClientConnectionManager(int maxTotal, int maxPerRoute){
		PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        // 连接池最大连接数
        cm.setMaxTotal(maxTotal);
        // 单条链路最大连接数（一个ip+一个端口 是一个链路）
        cm.setDefaultMaxPerRoute(maxPerRoute);
        // 指定某条链路的最大连接数

        return cm;
	}

}
