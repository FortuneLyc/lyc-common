
package com.act.framework.basic.utils;

import java.io.IOException;
import java.util.Map;

import com.act.framework.basic.conf.json.FastJsonConfiguration;
import com.alibaba.fastjson.TypeReference;

/**
 * ClassName: HttpClientUtils <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年3月7日 上午11:21:36 <br/>
 * @author   lyc
 * @version

 * @see
 */
public final class HttpUtils {

	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
	 *         SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
	 *         CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
	 *         CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static <T> T postJson(String url,String json,TypeReference<T> returnType,int... timeoutConfig) throws IOException{
		return postJson(url, json, returnType, false, timeoutConfig);
	}

	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 *
	 * <br/>
	 *
	 * @author lyc
	 * @param timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
	 *         SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
	 *         CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
	 *         CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static <T> T postJson(String url,String json,TypeReference<T> returnType,boolean isWraped,int... timeoutConfig) throws IOException{
		String returnJson = com.act.common.net.utils.HttpUtils.postJson(url, json, timeoutConfig);
		return JsonUtils.toObject(returnJson, returnType, isWraped);
	}
	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
	 *         SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
	 *         CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
	 *         CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static <T> T postJson(String url,Object object,TypeReference<T> returnType,int... timeoutConfig) throws IOException{
		return postJson(url, object, returnType, false, timeoutConfig);
	}
	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
	 *         SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
	 *         CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
	 *         CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static <T> T postJson(String url,Object object,TypeReference<T> returnType,boolean isWraped,int... timeoutConfig) throws IOException{
		String returnJson = com.act.common.net.utils.HttpUtils.postJson(url, object, FastJsonConfiguration.getDefaultFastJsonConfig(),timeoutConfig);
		return JsonUtils.toObject(returnJson, returnType, isWraped);
	}
	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
	 *         SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
	 *         CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
	 *         CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static <T> T postMap(String url,Map<String,Object> params,TypeReference<T> returnType,boolean isWraped,int... timeoutConfig) throws IOException{
		String returnJson = com.act.common.net.utils.HttpUtils.postMap(url, params, timeoutConfig);
		return JsonUtils.toObject(returnJson, returnType, isWraped);
	}
	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param timeoutConfig 接收最大三位的int值， -1 表示不限制，单位毫秒，依次为 <br/>
	 *         SOCKE_TTIMEOUT: 响应超时时间，超时就不再读取响应 会抛出SocketTimeOutException <br/>
	 *         CONNECT_TIMEOUT: 指客户端和服务器建立连接的timeout 超时说明建立连接失败 <br/>
	 *         CONNECTION_REQUEST_TIMEOUT: 指从连接池获取连接的timeout 取不到说明连接池空，无法建立连接 <br/>
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static <T> T postMap(String url,Map<String,Object> params,TypeReference<T> returnType,int... timeoutConfig) throws IOException{
		return postMap(url, params, returnType, false, timeoutConfig);
	}
}

