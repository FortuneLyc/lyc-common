
package com.act.framework.web.conf.auth;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.util.StringUtils;

import com.act.common.net.utils.IPUtils;
import com.act.framework.web.conf.WebSecurityConfig;
import com.act.framework.web.model.OperationLog;
import com.act.framework.web.model.SystemRole;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.OperationLogService;
import com.act.framework.web.service.SystemUserService;
import com.act.framework.web.utils.SecurityUtils;

/**
 * ClassName: MyAuthenticationSuccessHandler <br/>
 * Function:
 *<pre>
 * act:
 *   security:
 *     targetUrlMap:
 *       admin: /
 *       user: /home
 * <pre/>
 * <br/>
 * Reason:	  <br/>
 * Date:      2016年11月17日 下午5:58:29 <br/>
 * @author   "zhangpeng"

 */
public class MyAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	private OperationLogService operationLogService;
	@Autowired
	private SystemUserService systemUserService;

	public MyAuthenticationSuccessHandler(Map<String, String> targetUrlMap) {
		this.targetUrlMap = targetUrlMap;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		super.onAuthenticationSuccess(request, response, authentication);

		OperationLog log = new OperationLog();
		log.setMessage("用户登录成功");
		log.setUsername(SecurityUtils.getUsernameFromRequest(request));
		log.setIp(IPUtils.getRemoteIp(request));
		log.setLogType(LogType.Loggin);
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

	private Map<String, String> targetUrlMap;

	@Override
	protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		if (isAlwaysUseDefaultTargetUrl()) {
			return getDefaultTargetUrl();
		}
		// Check for the parameter and use that if available
		String targetUrl;
		if ( targetUrlMap != null && targetUrlMap.size() > 0 ) {

			String userName = request.getParameter(WebSecurityConfig.username);
			final SystemUser systemUser = (SystemUser) systemUserService.loadUserByUsername(userName);
			List<SystemRole> roleList = systemUser.getRoleList();
			if (roleList != null) {
				for (SystemRole systemRole : roleList) {
					targetUrl = targetUrlMap.get(systemRole.getRolename());
					if (StringUtils.hasText(targetUrl)) {
						return targetUrl;
					}
				}
			}
		}

		String targetUrlParameter = getTargetUrlParameter();
		String frontTargetUrl = request.getParameter(targetUrlParameter);
		if (StringUtils.hasText(frontTargetUrl)) {
			logger.debug("Found targetUrlParameter in request: " + frontTargetUrl);
			return frontTargetUrl;
		}

		String defaultTarget =targetUrlMap.get("default-target");
		if (StringUtils.hasText(defaultTarget)) {
			return defaultTarget;
		}

		return "/login?failure";
	}

}

