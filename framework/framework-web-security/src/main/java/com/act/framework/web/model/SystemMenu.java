/**
 * Project Name:web-framework-base
 * File Name:SystemRole.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月27日下午5:17:28
 *
*/

package com.act.framework.web.model;

import javax.persistence.Transient;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.model.TreeModel;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName: SystemMenu <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:17:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class SystemMenu extends TreeModel<SystemMenu> implements IBaseEntity {
	private static final long serialVersionUID = 4077884901612362639L;

	private String menuPath;
	private String menuName;
	private String menuCode;//同级菜单唯一
	private String menuIcon;
	private String remark;
	private Boolean isVisible;
	private Boolean isNewWindow;


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


	public String getMenuPath() {
		return menuPath;
	}
	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Boolean getIsVisible() {
		return isVisible;
	}
	public void setIsVisible(Boolean isVisible) {
		this.isVisible = isVisible;
	}
	public Boolean getIsNewWindow() {
		return isNewWindow;
	}
	public void setIsNewWindow(Boolean isNewWindow) {
		this.isNewWindow = isNewWindow;
	}

}

