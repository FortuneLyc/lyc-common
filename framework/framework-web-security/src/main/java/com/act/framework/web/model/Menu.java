package com.act.framework.web.model;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 大菜单的路径
	 */
	private String path;
	/**
	 * 重定向
	 */
	private String redirect;
	/**
	 * 菜单名称
	 */
	private String name;
	/**
	 * 菜单的样式
	 */
	private String icon;
	/**
	 * 菜单的路径
	 */
	private String component;
	/**
	 * 是否隐藏
	 */
	private boolean hidden;

	private List<Menu> children ;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getComponent() {
		return component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	public boolean isHidden() {
		return hidden;
	}

	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}


}
