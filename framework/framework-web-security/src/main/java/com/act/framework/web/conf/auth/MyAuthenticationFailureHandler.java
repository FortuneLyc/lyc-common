
package com.act.framework.web.conf.auth;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.act.common.net.utils.IPUtils;
import com.act.framework.web.model.OperationLog;
import com.act.framework.web.model.enums.BadCredentialsType;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.OperationLogService;
import com.act.framework.web.utils.SecurityUtils;

/**
 * ClassName: MyAuthenticationFailureHandler <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年11月17日 下午5:56:16 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class MyAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	private OperationLogService operationLogService;
	
	//授信白名单IP信息
	private String ipHost;
	
	public MyAuthenticationFailureHandler(String defaultFailureUrl, OperationLogService operationLogService, String ipHost) {
		super(defaultFailureUrl);
		this.operationLogService = operationLogService;
		this.ipHost = ipHost;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		OperationLog log = new OperationLog();
		String host = request.getHeader("host");
		//取请求头中的IP信息
		if(host.contains(":")){ host = host.substring(0, host.indexOf(":")); }
		////授信白名单IP信息，判断当前请求的host是否在白名单中，主要防止恶意串改重定向地址
		Boolean isMath = StringUtils.isBlank(ipHost) ? Boolean.TRUE : ipHost.contains(host);
		if(exception.getLocalizedMessage().equals(BadCredentialsType.CREDENTIALS_CAPTCHA_ERROR.getStringType())) {
			if(isMath) {super.setDefaultFailureUrl("/login?failure&c"); } 
			else { super.setDefaultFailureUrl(""); }
			log.setMessage(BadCredentialsType.CREDENTIALS_CAPTCHA_ERROR.getDescribe());
		} else if(exception.getLocalizedMessage().equals(BadCredentialsType.CREDENTIALS_PASSWORD_ERROR.getStringType())) {
			if(isMath) { super.setDefaultFailureUrl("/login?failure&p"); } 
			else { super.setDefaultFailureUrl(""); }
			log.setMessage(BadCredentialsType.CREDENTIALS_PASSWORD_ERROR.getDescribe());
		} else {
			if(isMath) { super.setDefaultFailureUrl("/login?failure&u"); } 
			else { super.setDefaultFailureUrl(""); }
			log.setMessage(BadCredentialsType.CREDENTIALS_USERNAME_ERROR.getDescribe());
		}
		
		super.onAuthenticationFailure(request, response, exception);
		
		log.setUsername(SecurityUtils.getUsernameFromRequest(request));
		log.setIp(IPUtils.getRemoteIp(request));
		log.setLogType(LogType.Logout);
		String api = request.getRequestURI();
		log.setApi(api);
		log.setMenuPath(SecurityUtils.getMenuCode(request));
		try {
			log.setRouterPath(api.substring(1,api.indexOf("/", 1)));
		} catch (Exception ignore){
		}
		log.setProceedTime(0L);
		log.setTime(new Date());
		operationLogService.addLog(log);
	}

}

