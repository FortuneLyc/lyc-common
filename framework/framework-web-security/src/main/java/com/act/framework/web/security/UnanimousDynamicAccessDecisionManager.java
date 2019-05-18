
package com.act.framework.web.security;

import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Service;

import com.act.framework.web.model.ApiAccess;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.AuthorizationConfigurerType;
import com.act.framework.web.model.enums.SystemUserType;
import com.act.framework.web.service.ApiAccessService;

/**
 * ClassName: UnanimousDynamicAccessDecisionManager <br/>
 * Function:  一票否决制，全部持保留意见也等同否决<br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:27:06 <br/>
 * @author   "zhangpeng"

 */
@Service
public final class UnanimousDynamicAccessDecisionManager implements AccessDecisionManager {
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 全部保留意见时允不允许通过
	 */
	private boolean allowIfAllAbstainDecisions = true;

	@Autowired
	private ApiAccessService apiAccessService;

	@Override
	public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> singleAttributeList)
			throws AccessDeniedException {

		int grant = 0;
		@SuppressWarnings("unused")
		int abstain = 0;

		if (AuthorizationConfigurerType.permitAll.getDescribe().equals(singleAttributeList.stream().findAny().get().getAttribute())) {
			return;
		}
		if (AuthorizationConfigurerType.denyAll.getDescribe().equals(singleAttributeList.stream().findAny().get().getAttribute())) {
			logger.info("权限不足: 访问被拒绝 资源权限为 denyAll 请求:{}",object);
			throw new AccessDeniedException("权限不足: 资源拒绝所有访问请求");
		}

		if (!(authentication.getPrincipal() instanceof SystemUser)) {
			//匿名用户
			if (AuthorizationConfigurerType.anonymous.getDescribe().equals(singleAttributeList.stream().findAny().get().getAttribute())) {
				return;
			} else {
				logger.info("权限不足: 访问被拒绝 匿名用户对此资源无访问权限 请求:{}",object);
				throw new AccessDeniedException("权限不足: 匿名用户对此资源无访问权限");
			}
		}

		SystemUser user = (SystemUser)authentication.getPrincipal();
		if (SystemUserType.super_admin.equals(user.getSystemUserType())) {
			logger.warn("超级用户拥有无限权限，请不要使用");
			return;
		}

		FilterInvocation filterInvocation = (FilterInvocation) object;
		List<ApiAccess> voterList = apiAccessService.getDecisionVoters(user,filterInvocation.getRequest().getRequestURI());
		for (ApiAccess voter : voterList) {
			int result = voter.vote(authentication, filterInvocation, singleAttributeList);
			logger.debug("Voter: {}, returned: {}",voter,result);

			switch (result) {
			case AccessDecisionVoter.ACCESS_GRANTED:
				grant++;
				break;
			case AccessDecisionVoter.ACCESS_DENIED:
				logger.info("权限不足: 访问被拒绝 ApiAccessId: {}, result: {}",voter.getId(),"ACCESS_DENIED");
				throw new AccessDeniedException("权限不足: 访问被拒绝");
			default:
				abstain++;
				break;
			}
		}

		// 没有角色拒绝并且至少有一个角色同意
		if (grant > 0) {
			return;
		}

		//此用户的角色配置了API权限，但是没有权限支持这次访问，拒绝他的访问
		if (!apiAccessService.isDefautGrant(user)){
			logger.info("权限不足: 访问被拒绝 没有角色支持这个访问");
			throw new AccessDeniedException("权限不足: 访问被拒绝 没有角色支持这个访问");
		}

		// 此用户的角色没有配置了API权限，默认同意他的访问
		if (!allowIfAllAbstainDecisions) {
			logger.info("权限不足: 访问被拒绝 没有角色支持这个访问");
			throw new AccessDeniedException("权限不足: 访问被拒绝 没有角色支持这个访问");
		}
	}

	@Override
	public boolean supports(ConfigAttribute attribute) {
		return true;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
	}

//	private void logDenied(SystemUser user, String msg){
//		OperationLog log = new OperationLog();
//		log.setMessage(msg);
//		log.setUsername(user.getUsername());
//		log.setIp(IPUtils.getRemoteIp(request));
//		log.setLogType(LogType.Loggin);
//		String api = request.getRequestURI();
//		log.setApi(api);
//		log.setMenuPath(SecurityUtils.getMenuCode(request));
//		try {
//			log.setRouterPath(api.substring(1,api.indexOf("/", 1)));
//		} catch (Exception ignore){
//		}
//		log.setProceedTime(0L);
//		log.setTime(new Date());
//
//	}

}

