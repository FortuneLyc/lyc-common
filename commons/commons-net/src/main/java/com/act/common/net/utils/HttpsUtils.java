package com.act.common.net.utils;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.config.FastJsonConfig;

public final class HttpsUtils {
	private static Logger logger = LoggerFactory.getLogger(HttpUtils.class);
	private HttpsUtils() {
	}

	private static final int MAX_TOTAL = 400;
	private static final int MAX_PER_ROUTE = 200;

	private static final int CONNECT_TIMEOUT = 10000;
	private static final int SOCKE_TTIMEOUT = 10000;
	private static final int CONNECTION_REQUEST_TIMEOUT = 10000;

	private static CloseableHttpClient defaultHttpClient = createHttpClient(MAX_TOTAL, MAX_PER_ROUTE);


	private static final RequestConfig requestConfig = RequestConfig.custom()
			.setSocketTimeout(SOCKE_TTIMEOUT)	//指客户端从服务器读取数据的timeout，超出后会抛出SocketTimeOutException
            .setConnectTimeout(CONNECT_TIMEOUT)	//指客户端和服务器建立连接的timeout
            .setConnectionRequestTimeout(CONNECTION_REQUEST_TIMEOUT)	//指从连接池获取连接的timeout
            .build();

    static class miTM implements TrustManager, X509TrustManager {
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }

        public boolean isServerTrusted(X509Certificate[] certs) {
            return true;
        }

        public boolean isClientTrusted(X509Certificate[] certs) {
            return true;
        }

        public void checkServerTrusted(X509Certificate[] certs, String authType)
                throws java.security.cert.CertificateException {
            return;
        }

        public void checkClientTrusted(X509Certificate[] certs, String authType)
                throws java.security.cert.CertificateException {
            return;
        }
    }

    private static void trustAllHttpsCertificates() throws Exception {
        TrustManager[] trustAllCerts = new TrustManager[1];
        TrustManager tm = new miTM();
        trustAllCerts[0] = tm;
        SSLContext sc = SSLContext.getInstance("SSL");
        sc.init(null, trustAllCerts, null);
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
    }

    public static String post(String url, Map<String, Object> form) throws Exception{
        trustAllHttpsCertificates();
        HostnameVerifier hv = new HostnameVerifier() {
            public boolean verify(String urlHostName, SSLSession session) {
                logger.info("Warning: URL Host: " + urlHostName + " vs. " + session.getPeerHost());
                return true;
            }
        };
        HttpsURLConnection.setDefaultHostnameVerifier(hv);

        HttpURLConnection conn = null;
        PrintWriter pw = null ;
        BufferedReader rd = null ;
        StringBuilder out = new StringBuilder();
        StringBuilder sb = new StringBuilder();
        String line = null ;
        String response = null;
        for (String key : form.keySet()) {
            if(out.length()!=0){
                out.append("&");
            }
            out.append(key).append("=").append(form.get(key));
        }
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setReadTimeout(20000);
            conn.setConnectTimeout(20000);
            conn.setUseCaches(false);
            conn.connect();
            pw = new PrintWriter(conn.getOutputStream());
            pw.print(out.toString());
            pw.flush();
            rd  = new BufferedReader( new InputStreamReader(conn.getInputStream(), "UTF-8"));
            while ((line = rd.readLine()) != null ) {
                sb.append(line);
            }
            response = sb.toString();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                if(pw != null){
                    pw.close();
                }
                if(rd != null){
                    rd.close();
                }
                if(conn != null){
                    conn.disconnect();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return response;
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
     * @param params
     * @param timeoutConfig @return
     * @throws IOException
    * @since JDK 1.7
    */
	public static String postMap(String url, Map<String, Object> params, int[] timeoutConfig) throws IOException{
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

    public static String postMap(String url, Map<String, Object> params) throws IOException{
        return postMap(url, params, null);
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

    @SuppressWarnings("deprecation")
	public static CloseableHttpClient createSSLClientDefault(){
        try {
            // 在JSSE中，证书信任管理器类就是实现了接口X509TrustManager的类。我们可以自己实现该接口，让它信任我们指定的证书。
            // 创建SSLContext对象，并使用我们指定的信任管理器初始化
            //信任所有
            X509TrustManager x509mgr = new X509TrustManager() {
                //　　该方法检查客户端的证书，若不信任该证书则抛出异常
                public void checkClientTrusted(X509Certificate[] xcs, String string) {
                }
                // 　　该方法检查服务端的证书，若不信任该证书则抛出异常
                public void checkServerTrusted(X509Certificate[] xcs, String string) {
                }
                // 　返回受信任的X509证书数组。
                public X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
            };
            SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
            sslContext.init(null, new TrustManager[] { x509mgr }, null);
            ////创建HttpsURLConnection对象，并设置其SSLSocketFactory对象
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            //  HttpsURLConnection对象就可以正常连接HTTPS了，无论其证书是否经权威机构的验证，只要实现了接口X509TrustManager的类MyX509TrustManager信任该证书。
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
        } catch (KeyManagementException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 创建默认的httpClient实例.
        return  HttpClients.createDefault();
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
        return createSSLClientDefault();
	}

	@SuppressWarnings("unused")
	private static HttpClientConnectionManager getHttpClientConnectionManager(int maxTotal, int maxPerRoute){
		PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        // 连接池最大连接数
        cm.setMaxTotal(maxTotal);
        // 单条链路最大连接数（一个ip+一个端口 是一个链路）
        cm.setDefaultMaxPerRoute(maxPerRoute);
        // 指定某条链路的最大连接数

        return cm;
	}

    public static void main(String[] args) {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", "name");
        map.put("versionNo", "version");
        map.put("versionContent", "content");
        map.put("generalNo", "generalNo");
        map.put("displayLabel", "displayLabel");
        map.put("publishDate", "publishDate");
        logger.info("{}",map);
        try {
            HttpsUtils.postMap("https://172.31.131.134:8080/framework/web/versionInfo/saveVersion", map);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("======无法连接到web======");
        }
    }

}
