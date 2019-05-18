/*
 * Copyright (C) 2011 Fhpt All Rights Reserved.
 * 
 * MyFilterSecurityInterceptor.java
 */
package com.act.framework.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;

/**
 * [文件名称]：MyFilterSecurityInterceptor
 * [内容描述]:
 * [修改记录]：
 * 2019年3月19日 version:1.0 创建 wucw
 * 
 * @author wucw
 * @version 1.0
 * JDK 1.8
 */
public class MyFilterSecurityInterceptor extends FilterSecurityInterceptor implements
	Filter {
	// ~ Static fields/initializers
	// =====================================================================================
	
	private static final String FILTER_APPLIED = "__spring_security_filterSecurityInterceptor_filterApplied";
	
	// ~ Instance fields
	// ================================================================================================
	
	private FilterInvocationSecurityMetadataSource securityMetadataSource;
	private boolean observeOncePerRequest = true;
	
	private String ipHost;
	
	private final static String errorIpMsg = "Request IP is not in the white list, please contact the administrator!";

	// 过滤访问路径的host端口信息
	private final static String COLON = ":";

	// 过滤访问路径的host端口信息
	private final static String HOSTSTR = "host";

	// 过滤访问路径的host端口信息
	private final static String CHARSET = "text/html;charset=UTF-8";
	
	// ~ Methods
	// ========================================================================================================
	
	/**
	* Not used (we rely on IoC container lifecycle services instead)
	*
	* @param arg0 ignored
	*
	* @throws ServletException never thrown
	*/
	public void init(FilterConfig arg0) throws ServletException {
	}
	
	/**
	* Not used (we rely on IoC container lifecycle services instead)
	*/
	public void destroy() {
	}
	
	/**
	* Method that is actually called by the filter chain. Simply delegates to the
	* {@link #invoke(FilterInvocation)} method.
	*
	* @param request the servlet request
	* @param response the servlet response
	* @param chain the filter chain
	*
	* @throws IOException if the filter chain fails
	* @throws ServletException if the filter chain fails
	*/
//	public void doFilter(ServletRequest request, ServletResponse response,
//		FilterChain chain) throws IOException, ServletException {
//		FilterInvocation fi = new FilterInvocation(request, response, chain);
//		invoke(fi);
//	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		if(StringUtils.isBlank(ipHost)){ 
			FilterInvocation fi = new FilterInvocation(request, response, chain);
			invoke(fi);
		} else {
			// 设置response字符集
			response.setContentType(CHARSET);

			// 获取head的host信息
			String host = request.getHeader(HOSTSTR);
			// 如果host为纯IP格式时，过滤host中的端口信息，只获取IP
			if(host.contains(COLON)){  host = host.substring(0, host.indexOf(COLON)); }

			if(ipHost.contains(host)){
				FilterInvocation fi = new FilterInvocation(request, response, chain);
				invoke(fi);
			}else {
				// 错误状态码403
				response.setStatus(HttpStatus.SC_FORBIDDEN);
				logger.warn(errorIpMsg + host);
				response.getWriter().print(errorIpMsg);
				response.flushBuffer();
				return;
			}
		}
	}
	
	public FilterInvocationSecurityMetadataSource getSecurityMetadataSource() {
		return this.securityMetadataSource;
	}
	
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}
	
	public void setSecurityMetadataSource(FilterInvocationSecurityMetadataSource newSource) {
		this.securityMetadataSource = newSource;
	}
	
	public Class<?> getSecureObjectClass() {
		return FilterInvocation.class;
	}
	
	public void invoke(FilterInvocation fi) throws IOException, ServletException {
		if ((fi.getRequest() != null)
				&& (fi.getRequest().getAttribute(FILTER_APPLIED) != null)
				&& observeOncePerRequest) {
			// filter already applied to this request and user wants us to observe
			// once-per-request handling, so don't re-do security checking
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		}
		else {
			// first time this request being called, so perform security checking
			if (fi.getRequest() != null) {
				fi.getRequest().setAttribute(FILTER_APPLIED, Boolean.TRUE);
			}
		
			InterceptorStatusToken token = super.beforeInvocation(fi);
		
			try {
				fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
			}
			finally {
				super.finallyInvocation(token);
			}
		
			super.afterInvocation(token, null);
		}
	}
	
	/**
	* Indicates whether once-per-request handling will be observed. By default this is
	* <code>true</code>, meaning the <code>FilterSecurityInterceptor</code> will only
	* execute once-per-request. Sometimes users may wish it to execute more than once per
	* request, such as when JSP forwards are being used and filter security is desired on
	* each included fragment of the HTTP request.
	*
	* @return <code>true</code> (the default) if once-per-request is honoured, otherwise
	* <code>false</code> if <code>FilterSecurityInterceptor</code> will enforce
	* authorizations for each and every fragment of the HTTP request.
	*/
	public boolean isObserveOncePerRequest() {
		return observeOncePerRequest;
	}
	
	public void setObserveOncePerRequest(boolean observeOncePerRequest) {
		this.observeOncePerRequest = observeOncePerRequest;
	}
	
	public void setIpHost(String ipHost) {
		this.ipHost = ipHost;
	}
	
	public String getIpHost() {
		return this.ipHost;
	}
}