/**
 * Project Name:web-framework-base
 * File Name:User.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月21日下午7:53:18
 *
*/

package com.act.framework.web.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * ClassName: UserRoleRelation <br/>
 * Function: <br/>
 * date: 2017年6月10日 下午6:41:54 <br/>
 *
 * @author "zhangpeng"
 * @version
 * @since JDK 1.7
 */
public class UserRoleRelation {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Long userId;
	private Long roleId;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
}

