package com.act.framework.web.filter;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebFilter(urlPatterns = "/*", asyncSupported = true)
public class IpHostFilter implements Filter {

	private static Logger logger = LoggerFactory.getLogger(IpHostFilter.class);

	@Value("${act.security.filter.ipHost:}")
	private String ipHost;

	@Value("${act.security.filter.errorIpMsg:Request IP is not in the white list, please contact the administrator!}")
	private String errorIpMsg;

	// 过滤访问路径的host端口信息
	private final static String COLON = ":";

	// 过滤访问路径的host端口信息
	private final static String HOSTSTR = "host";

	// 过滤访问路径的host端口信息
	private final static String CHARSET = "text/html;charset=UTF-8";

	public void init(FilterConfig filterConfig) throws ServletException {}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		if(StringUtils.isBlank(ipHost)){ 
			filterChain.doFilter(request, response);
			return;
		}

		// 设置response字符集
		response.setContentType(CHARSET);

		// 获取head的host信息
		String host = request.getHeader(HOSTSTR);
		// 如果host为纯IP格式时，过滤host中的端口信息，只获取IP
		if(host.contains(COLON)){  host = host.substring(0, host.indexOf(COLON)); }

		if(ipHost.contains(host)){
			filterChain.doFilter(request, response);
		}else {
			// 错误状态码403
			response.setStatus(HttpStatus.SC_FORBIDDEN);
			logger.warn(errorIpMsg + host);
			response.getWriter().print(errorIpMsg);
			response.flushBuffer();
			return;
		}
	}

	public void destroy() {}
}
