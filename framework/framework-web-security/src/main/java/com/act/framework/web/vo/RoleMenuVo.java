
package com.act.framework.web.vo;

import java.util.List;

/**
 * ClassName: RoleMenuVo <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月15日 上午10:35:36 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class RoleMenuVo {
	private Long roleId;
	private List<Long> checkedMenuIds;

	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public List<Long> getCheckedMenuIds() {
		return checkedMenuIds;
	}
	public void setCheckedMenuIds(List<Long> checkedMenuIds) {
		this.checkedMenuIds = checkedMenuIds;
	}
}

