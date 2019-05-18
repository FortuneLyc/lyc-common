
package com.act.framework.web.model;

import java.util.Collection;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.FilterInvocation;

import com.act.framework.web.model.enums.AccessDecisionType;

/**
 * ClassName: ApiAccess <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午6:00:10 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class ApiAccess implements AccessDecisionVoter<FilterInvocation> {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	/**
	 * 角色ID
	 */
	private Long roleId;
	/**
	 * API ID
	 */
	private Long apiId;
	/**
	 * 权限
	 */
	private AccessDecisionType decision;
	/**
	 * API地址
	 */
	@Transient
	private Api api;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getApiId() {
		return apiId;
	}
	public void setApiId(Long apiId) {
		this.apiId = apiId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public AccessDecisionType getDecision() {
		return decision;
	}
	public void setDecision(AccessDecisionType decision) {
		this.decision = decision;
	}
	public Api getApi() {
		return api;
	}
	public void setApi(Api api) {
		this.api = api;
	}


	@Override
	public boolean supports(ConfigAttribute attribute) {
		return true;
	}
	@Override
	public boolean supports(Class<?> clazz) {
//		return FilterInvocation.class.isAssignableFrom(clazz);
		return true;
	}
	@Override
	public int vote(Authentication authentication, FilterInvocation object, Collection<ConfigAttribute> attributes) {
		return decision.getLongType().intValue();
	}
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}
	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}


}

