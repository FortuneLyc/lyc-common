package com.act.framework.web.model;

import java.io.Serializable;
import java.util.List;

public class MenuInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 是否超级管理员
	 */
	private boolean admin;
	/**
	 * 转发的url
	 */
	private String platformUrl;
	/**
	 * 登入页面
	 */
	private String loginUrl;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 菜单
	 */
	private Menu menu;
	
	private List<Menu> menus ;
	
	
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public String getPlatformUrl() {
		return platformUrl;
	}
	public void setPlatformUrl(String platformUrl) {
		this.platformUrl = platformUrl;
	}
	public String getLoginUrl() {
		return loginUrl;
	}
	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
}
