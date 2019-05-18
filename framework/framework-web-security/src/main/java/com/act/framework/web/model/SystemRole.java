/**
 * Project Name:web-framework-base
 * File Name:SystemRole.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月27日下午5:17:28
 *
*/

package com.act.framework.web.model;

import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.model.TreeModel;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName: SystemRole <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:17:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class SystemRole extends TreeModel<SystemRole> implements IBaseEntity, GrantedAuthority {

	private static final long serialVersionUID = -3459233767372311150L;

	private String rolename;
	private String remark;

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

	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@JSONField(serialize = false)
	@Override
	public String getAuthority() {
		return rolename;
	}
}

