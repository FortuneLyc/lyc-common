/**
 * Project Name:web-framework-base
 * File Name:SystemRole.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月27日下午5:17:28
 *
*/

package com.act.framework.web.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * ClassName: RoleMenu <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:17:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class RoleMenu {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Long roleId;
	private Long menuId;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}


}

