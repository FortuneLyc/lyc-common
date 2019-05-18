
package com.act.framework.web.utils;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;

import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.SystemUserType;

/**
 * ClassName: SecurityUtils <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年11月18日 上午9:02:31 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class SecurityUtils {
	private static final Logger logger = LoggerFactory.getLogger(SecurityUtils.class);
	public static String getUsernameFromRequest(HttpServletRequest request){
		SecurityContextImpl securityContext = (SecurityContextImpl)request.getSession().getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
		if (null == securityContext) {
			return "anonymous";
		}
		return securityContext.getAuthentication().getName();
	}

	public static SystemUser getUserFromRequest(HttpServletRequest request){
		SecurityContextImpl securityContext = (SecurityContextImpl)request.getSession().getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
		if (null == securityContext) {
			SystemUser user = new SystemUser();
			String username = request.getParameter("username");
			if (StringUtils.isBlank(username)) {
				username = "anonymous";
			}
			user.setId(-1L);
			user.setDisplayName("匿名用户");
			user.setUsername(username);
			user.setSystemUserType(SystemUserType.anonymous);
			user.setRoleList(Collections.emptyList());
			return user;
		}
		return (SystemUser) securityContext.getAuthentication().getPrincipal();
	}

	public static String getMenuCode(HttpServletRequest request) {
		String menuCode = request.getHeader("Act-Menu-Code");
		if (StringUtils.isBlank(menuCode)) {
			return "";
		}
		return menuCode;
	}

}

