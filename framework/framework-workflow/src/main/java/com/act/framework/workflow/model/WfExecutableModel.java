
package com.act.framework.workflow.model;

import com.act.common.constant.workflow.BusinessType;

/**
 * ClassName: WfExecutableModel <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月30日 下午9:54:21 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class WfExecutableModel {

	private BusinessType businessType;
	private String stateId;
	private String nextStateId;
	private Long systemUserId;
	private String username;
	private String displayName;

	public void setNull() {
		this.businessType = null;
		this.stateId = null;
		this.nextStateId = null;
		this.systemUserId = null;
		this.username = null;
		this.displayName = null;
	}
	public void setNew(WfExecutableModel wfExecutableModel) {
		if (wfExecutableModel == null) {
			setNull();
		} else {
			this.businessType = wfExecutableModel.getBusinessType();
			this.stateId = wfExecutableModel.getStateId();
			this.nextStateId = wfExecutableModel.getNextStateId();
			this.systemUserId = wfExecutableModel.getSystemUserId();
			this.username = wfExecutableModel.getUsername();
			this.displayName = wfExecutableModel.getDisplayName();
		}
	}

	public BusinessType getBusinessType() {
		return businessType;
	}
	public void setBusinessType(BusinessType businessType) {
		this.businessType = businessType;
	}
	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}
	public String getNextStateId() {
		return nextStateId;
	}
	public void setNextStateId(String nextStateId) {
		this.nextStateId = nextStateId;
	}
	public Long getSystemUserId() {
		return systemUserId;
	}
	public void setSystemUserId(Long systemUserId) {
		this.systemUserId = systemUserId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
}

