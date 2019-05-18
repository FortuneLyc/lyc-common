
package com.act.framework.web.security;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import com.act.framework.web.model.ResourceAccess;
import com.act.framework.web.model.enums.AuthorizationConfigurerType;
import com.act.framework.web.service.ResourceAccessService;

/**
 * ClassName: MyFilterInvocationSecurityMetadataSource <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月9日 下午4:08:04 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class MyFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

	@Autowired
	private ResourceAccessService resourceAccessService;

	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {

		List<ResourceAccess> resourceAccessList = resourceAccessService.selectAll(null);
		//只返回最先匹配的权限
		return Collections.singleton(
					resourceAccessList.stream()
					.filter(r -> this.getMacher(r.getAntResource()).matches(((FilterInvocation)object).getRequest()))
					.min(Comparator.comparing(ResourceAccess::getId))
					.orElse(new ResourceAccess().setAuthorizationType(AuthorizationConfigurerType.authenticated))
				);
	}

	private final Object locker = new Object();
	private static Map<String, RequestMatcher> macherMap = new ConcurrentHashMap<>();
	private RequestMatcher getMacher(String resource) {
		RequestMatcher rm = macherMap.get(resource);
		if (rm == null) {
			synchronized (locker) {
				rm = macherMap.get(resource);
				if (rm == null) {
					rm = new AntPathRequestMatcher(resource);
					macherMap.put(resource, rm);
				}
			}
		}
		return rm;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		List<? extends ConfigAttribute> resourceAccessList = resourceAccessService.selectAll(null);
		return (Collection<ConfigAttribute>) resourceAccessList;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
//		return true;
	}



}

