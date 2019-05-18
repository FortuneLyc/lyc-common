
package com.act.framework.web.vo;

import java.util.List;

import com.act.framework.web.model.MenuElement;

/**
 * ClassName:MenuElementVo <br/>
 * Date:     2017年12月11日 下午4:28:39 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
public class MenuElementVo extends MenuElement {
	
	private Long roleId;

	private List<Long> checkedElIds;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public List<Long> getCheckedElIds() {
		return checkedElIds;
	}

	public void setCheckedElIds(List<Long> checkedElIds) {
		this.checkedElIds = checkedElIds;
	}
	
}

