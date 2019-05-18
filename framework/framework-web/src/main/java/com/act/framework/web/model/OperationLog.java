
package com.act.framework.web.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.web.model.enums.LogType;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName: OperationLog <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年11月16日 下午8:16:18 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
public class OperationLog implements IBaseEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	/**
	 * 用户账号
	 */
	private String username;
	/**
	 * IP
	 */
	private String ip;
	/**
	 * 操作类型
	 */
	private LogType logType;
	/**
	 * 操作
	 */
	private String message;
	/**
	 * API
	 */
	private String api;
	/**
	 * 页面菜单路径 从header获取
	 */
	private String menuPath;
	/**
	 * 页面路由 从header获取
	 */
	private String routerPath;
	/**
	 * 调用时间
	 */
	private Long proceedTime;
	/**
	 * 时间
	 */
	private Date time;
	/**
	 * 时间之后
	 */
	@Transient
	private Date timeAfter;
	/**
	 * 时间之前
	 */
	@Transient
	private Date timeBefore;

	@JSONField(serialize = false)
	@Transient
	private BaseEntity baseEntity;
	@Override
	public BaseEntity getBaseEntity() {
		if (this.baseEntity == null) {
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public LogType getLogType() {
		return logType;
	}
	public void setLogType(LogType logType) {
		this.logType = logType;
	}

	public String getApi() {
		return api;
	}

	public void setApi(String api) {
		this.api = api;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

	public String getRouterPath() {
		return routerPath;
	}

	public void setRouterPath(String routerPath) {
		this.routerPath = routerPath;
	}

	public Long getProceedTime() {
		return proceedTime;
	}

	public void setProceedTime(Long proceedTime) {
		this.proceedTime = proceedTime;
	}

	public Date getTimeAfter() {
		return timeAfter;
	}

	public void setTimeAfter(Date timeAfter) {
		this.timeAfter = timeAfter;
	}

	public Date getTimeBefore() {
		return timeBefore;
	}

	public void setTimeBefore(Date timeBefore) {
		this.timeBefore = timeBefore;
	}
}
