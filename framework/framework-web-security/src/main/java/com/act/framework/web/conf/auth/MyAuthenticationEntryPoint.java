
package com.act.framework.web.conf.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.UrlUtils;

/**
 * ClassName: MyAuthenticationEntryPoint <br/>
 * Function:  将没有权限的请求带上401返回<br/>
 * Reason:	  <br/>
 * Date:      2017年4月24日 下午4:53:59 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class MyAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	private boolean contextRelative = true;

	public MyAuthenticationEntryPoint(String loginFormUrl,boolean contextRelative) {
		super(loginFormUrl);
		this.contextRelative = contextRelative;
	}

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		String accept = request.getHeader("Accept");
		if (StringUtils.isBlank(accept) || !accept.contains("application/json")) {
			super.commence(request, response, authException);
			return;
		}
		String redirectUrl = buildRedirectUrlToLoginPage(request, response, authException);

		redirectUrl = calculateRedirectUrl(request.getContextPath(), redirectUrl);
		redirectUrl = response.encodeRedirectURL(redirectUrl);

		logger.debug("Redirecting to '{}'", redirectUrl);
		response.sendError(401, redirectUrl);
	}

	private String calculateRedirectUrl(String contextPath, String url) {
		if (!UrlUtils.isAbsoluteUrl(url)) {
			if (contextRelative) {
				return url;
			}
			else {
				return contextPath + url;
			}
		}

		// Full URL, including http(s)://

		if (!contextRelative) {
			return url;
		}

		// Calculate the relative URL from the fully qualified URL, minus the last
		// occurrence of the scheme and base context.
		url = url.substring(url.lastIndexOf("://") + 3); // strip off scheme
		url = url.substring(url.indexOf(contextPath) + contextPath.length());

		if (url.length() > 1 && url.charAt(0) == '/') {
			url = url.substring(1);
		}

		return url;
	}


}

