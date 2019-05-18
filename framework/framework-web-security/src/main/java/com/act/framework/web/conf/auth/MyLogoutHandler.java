
package com.act.framework.web.conf.auth;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import com.act.common.net.utils.IPUtils;
import com.act.framework.web.model.OperationLog;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.OperationLogService;
import com.act.framework.web.utils.SecurityUtils;

/**
 * ClassName: MyLogoutHandler <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年11月17日 下午6:03:35 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class MyLogoutHandler implements LogoutHandler {

	private OperationLogService operationLogService;
	public MyLogoutHandler(OperationLogService operationLogService) {
		super();
		this.operationLogService = operationLogService;
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {

		OperationLog log = new OperationLog();
		log.setMessage("用户退出登录");
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

}

