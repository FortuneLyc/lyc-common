package com.act.common.net.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

/**
 *
 * ClassName: IPUtils <br/>
 * Function: <br/>
 * date: 2016年9月21日 上午11:48:46 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 */
public class IPUtils {

	public static Long ip2long(String ipStr) {
		if (StringUtils.isBlank(ipStr)) {
			return null;
		}
		long[] ip = new long[4];
		int position1 = ipStr.indexOf(".");
		int position2 = ipStr.indexOf(".", position1 + 1);
		int position3 = ipStr.indexOf(".", position2 + 1);
		ip[0] = Long.parseLong(ipStr.substring(0, position1));
		ip[1] = Long.parseLong(ipStr.substring(position1 + 1, position2));
		ip[2] = Long.parseLong(ipStr.substring(position2 + 1, position3));
		ip[3] = Long.parseLong(ipStr.substring(position3 + 1));
		return (ip[0] << 24) + (ip[1] << 16) + (ip[2] << 8) + ip[3];
	}

	public static String long2ip(Long iplong) {
		if (iplong==null) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		sb.append(String.valueOf(iplong >>> 24));
		sb.append(".");
		sb.append(String.valueOf((iplong & 0x00FFFFFF) >>> 16));
		sb.append(".");
		sb.append(String.valueOf((iplong & 0x0000FFFF) >>> 8));
		sb.append(".");
		sb.append(String.valueOf(iplong & 0x000000FF));
		return sb.toString();
	}

	/**
	 * verifyIpStandard:判断是否是IP地址. <br/>
	 * @author Alex
	 * @param ip
	 * @return
	 * @since JDK 1.6
	 */
	public static boolean verifyIpStandard(String ip) {
		if (StringUtils.isBlank(ip)) {
			return false;
		}
		Pattern pattern = Pattern
				.compile("\\b((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\b");
		Matcher matcher = pattern.matcher(ip);
		return matcher.matches();
	}

	public static String getRemoteIp(HttpServletRequest request){
	    String ip = request.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}
	public static void main(String[] args) {
		System.out.println(ip2long("222.77.182.229"));
	}

}