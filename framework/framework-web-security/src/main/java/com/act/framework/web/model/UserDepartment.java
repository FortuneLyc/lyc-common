/**
 * Project Name:web-framework-base
 * File Name:UserDepartment.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月27日下午5:07:33
 *
*/

package com.act.framework.web.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.web.model.enums.UserDepartmentType;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName:UserDepartment <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:07:33 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class UserDepartment implements IBaseEntity{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	/**
	 * 单位名称
	 */
	private String name;
	/**
	 * 单位标识
	 */
	private String departmentId;
	/**
	 * 单位级别
	 */
	private UserDepartmentType userDepartmentType;
	/**
	 * 父级单位ID
	 */
	private Long parentId;

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
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public UserDepartmentType getUserDepartmentType() {
		return userDepartmentType;
	}
	public void setUserDepartmentType(UserDepartmentType userDepartmentType) {
		this.userDepartmentType = userDepartmentType;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
}

