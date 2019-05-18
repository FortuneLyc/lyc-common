
package com.act.common.net.utils;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.whois.WhoisClient;

import com.act.common.net.enums.DomainDoubleSuffix;
import com.act.common.other.param.Args;

/**
 * ClassName: DomainUtils <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月12日 下午7:23:29 <br/>
 * @author   zhangpeng
 * @version

 * @see
 */
public class DomainUtils {
	public static String getTopDomain(String url){
		url = url.trim();
		if (StringUtils.isBlank(url)) {
			return url;
		}
		String domain = cutPort(url);
		int firstChar = domain.charAt(0);
		if (firstChar>47 && firstChar <58 && IPUtils.verifyIpStandard(domain)) {
			return domain;
		}
		String topDomain = "";
		for (DomainDoubleSuffix suffix : DomainDoubleSuffix.values()) {
			if (domain.endsWith(suffix.getDescribe())) {
				topDomain = StringUtils.removeEnd(domain, suffix.getDescribe()).replaceFirst("^.*\\.", "") + suffix.getDescribe();
				break;
			}
		}
		if (topDomain.equals("")) {
			String suffix = StringUtils.substringAfterLast(domain, ".");
			if (StringUtils.isNotBlank(suffix)) {
				suffix = "."+suffix;
			}
			topDomain = StringUtils.removeEnd(domain, suffix).replaceFirst("^.*\\.", "") + suffix;
		}
		return topDomain;
	}
	public static String cutScheme(String url){
		Args.notBlank(url, "url");
		return StringUtils.removePattern(url.toLowerCase(), "https?://");
	}
	private static String cutLocation(String url){
		return StringUtils.removePattern(cutScheme(url), "/.*$");
	}
	private static String cutPort(String url){
		return StringUtils.removePattern(cutLocation(url), ":.*$");
	}

	/**
	 * getDomainRegistrar: 根据域名信息获取域名注册商名称. <br/>
	 *
	 * @author Tuyan
	 * @param domain
	 *            域名信息
	 * @return 域名注册商名称
	 * @since JDK 1.6
	 */
	public static String getRegistrarByDomain(String domain) {

		String registrar = null;
		WhoisClient whois = new WhoisClient();
		try {
			whois.connect(WhoisClient.DEFAULT_HOST);

			String result = whois.query(domain);
			registrar = StringUtils.isBlank(result) ? null : findRegistrarFromResult(result);
		} catch (UnknownHostException e) {
			return null;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				whois.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return registrar;
	}
	private static String findRegistrarFromResult(String str) {
		Pattern p = Pattern.compile("Registrar:(.*)$", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE);
		Matcher m = p.matcher(str);
		if (m.find()) {
			return m.group(1).trim();
		}
		return "";
	}
}

