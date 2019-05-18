/**
 * Project Name:web-framework-base
 * File Name:User.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月21日下午7:53:18
 *
*/

package com.act.framework.web.model;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.alibaba.fastjson.annotation.JSONField;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.model.TreeModel;
import com.act.framework.web.model.enums.SystemUserType;

/**
 * ClassName:User <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月21日 下午7:53:18 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class SystemUser implements IBaseEntity,UserDetails {
	private static final long serialVersionUID = 670737325549408756L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String username;
	private String displayName;
	@JSONField(serialize = false)
	private String password;

	private String phone;
	private String email;
	private String addr;
	private String remark;
	private String layout;
	private String theme;
	private Boolean enable;

	@JSONField(serialize = false)
	@Transient
	private SystemUserType systemUserType = SystemUserType.common;
	@Transient
	private UserDepartment userDepartment;
	@JSONField(serialize = false)
	@Transient
	private List<SystemRole> roleList;
	@Transient
	private List<Long> roleIdList;
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

	/****************** 以下代码实现springSecurity 的UserDetails接口 ******************/
	@JSONField(serialize = false)
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		if (roleList==null){
			return Collections.emptyList();
		}
		return roleList;
	}
	@Override
	public String getUsername() {
		return this.username;
	}
	@JSONField(serialize = false)
	@Override
	public boolean isAccountNonExpired() {
		return this.enable;
	}
	@JSONField(serialize = false)
	@Override
	public boolean isAccountNonLocked() {
		return this.enable;
	}
	@JSONField(serialize = false)
	@Override
	public boolean isCredentialsNonExpired() {
		return this.enable;
	}
	@JSONField(serialize = false)
	@Override
	public boolean isEnabled() {
		return this.enable;
	}

	@Override
	public String getPassword() {
		return password;
	}
	public SystemUser setPassword(String password) {
		this.password = password;
		return this;
	}

	/****************** 以上代码实现springSecurity 的UserDetails接口 ******************/



	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public SystemUserType getSystemUserType() {
		return systemUserType;
	}
	public void setSystemUserType(SystemUserType systemUserType) {
		this.systemUserType = systemUserType;
	}
	public UserDepartment getUserDepartment() {
		return userDepartment;
	}
	public void setUserDepartment(UserDepartment userDepartment) {
		this.userDepartment = userDepartment;
	}
	public List<SystemRole> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<SystemRole> roleList) {
		this.roleList = roleList;
		if (roleList!=null) {
			this.roleIdList = roleList.stream().map(TreeModel::getId).collect(Collectors.toList());
		}
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public List<Long> getRoleIdList() {
		return roleIdList;
	}
	public void setRoleIdList(List<Long> roleIdList) {
		this.roleIdList = roleIdList;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}
}

