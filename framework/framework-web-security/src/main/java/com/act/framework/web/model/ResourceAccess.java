
package com.act.framework.web.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.springframework.security.access.ConfigAttribute;

import com.alibaba.fastjson.annotation.JSONField;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.web.model.enums.AuthorizationConfigurerType;

/**
 * ClassName: ResourceAccess <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午6:00:10 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class ResourceAccess implements IBaseEntity,ConfigAttribute {
	private static final long serialVersionUID = 717879816959970080L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	/**
	 * 资源
	 */
	private String antResource;
	/**
	 * 权限
	 */
	private AuthorizationConfigurerType authorizationType;


	@JSONField(serialize = false)
	@Transient
	private BaseEntity baseEntity;
	@Override
	public BaseEntity getBaseEntity() {
		if (this.baseEntity==null) {
			this.baseEntity = new BaseEntity();
		}
		return baseEntity;
	}
	@Override
	public void setBaseEntity(BaseEntity baseEntity) {
		this.baseEntity = baseEntity;
	}
	public Long getId() {
		return id;
	}
	public ResourceAccess setId(Long id) {
		this.id = id;
		return this;
	}

	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}
	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}
	@Override
	public String getAttribute() {
		return authorizationType.getDescribe();
	}
	public String getAntResource() {
		return antResource;
	}
	public void setAntResource(String antResource) {
		this.antResource = antResource;
	}
	public AuthorizationConfigurerType getAuthorizationType() {
		return authorizationType;
	}
	public ResourceAccess setAuthorizationType(AuthorizationConfigurerType authorizationType) {
		this.authorizationType = authorizationType;
		return this;
	}
}

