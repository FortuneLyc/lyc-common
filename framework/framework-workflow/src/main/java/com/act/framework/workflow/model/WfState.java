
package com.act.framework.workflow.model;

import java.util.ArrayList;
import java.util.HashMap;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.act.common.constant.workflow.BusinessType;
import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.utils.JsonUtils;
import com.act.framework.workflow.model.enums.WfPageTypes;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName: WfState <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月30日 下午9:54:21 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class WfState implements IBaseEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	/**
	 *状态标识
	 */
	private String stateId;
	/**
	 *状态名称
	 */
	private String stateName;
	/**
	 *业务类型
	 */
	private BusinessType businessType;
	/**
	 *实现业务类别名
	 */
	private String classAliax;
	/**
	 *按钮图标样式
	 */
	private String iconClass;
	/**
	 *前端页面状态 可为空
	 */
	@JSONField(serialize = false)
	private String frontStateJson;
	@Transient
	private HashMap<String, Long> frontStateMap;


	/**
	 * 需要传递的业务状态参数 可为空
	 */
	@JSONField(serialize = false)
	private String busStateMapJson;
	@Transient
	private HashMap<String, String> businessStateMap;
	/**
	 *使用自动生成的页面
	 */
	private WfPageTypes wfPageTypes;
	/**
	 *分支状态 比如审核
	 */
	private Boolean isBranch;
	/**
	 *允许批量操作
	 */
	private Boolean isBatch;
	/**
	 *开头
	 */
	private Boolean isHead;
	/**
	 * 可选的下一步stateId
	 */
	@JSONField(serialize = false)
	private String nextStateIdStr;
	@Transient
	private ArrayList<String> nextStateIds;
	@Transient
	private ArrayList<String> roleIdList;
	@JSONField(serialize = false)
	private String roleIdListStr;
	

	@JSONField(serialize = false)
	@Transient
	private BaseEntity baseEntity;

	
	
	public ArrayList<String> getRoleIdList() {
		if (roleIdList==null) {
			this.roleIdList = new ArrayList<>();
		}
		return this.roleIdList;
	}
	public void setRoleIdList(ArrayList<String> roleIdList) {
		this.roleIdList = roleIdList;
		this.roleIdListStr = JsonUtils.toJson(roleIdList);
	}
	public String getRoleIdListStr() {
		return roleIdListStr;
	}
	public void setRoleIdListStr(String roleIdListStr) {
		this.roleIdListStr = roleIdListStr;
		this.roleIdList = JsonUtils.toObject(roleIdListStr, new TypeReference<ArrayList<String>>() {});
	}
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
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public BusinessType getBusinessType() {
		return businessType;
	}
	public void setBusinessType(BusinessType businessType) {
		this.businessType = businessType;
	}
	public String getClassAliax() {
		return classAliax;
	}
	public void setClassAliax(String classAliax) {
		this.classAliax = classAliax;
	}
	public String getIconClass() {
		return iconClass;
	}
	public void setIconClass(String iconClass) {
		this.iconClass = iconClass;
	}
	public String getFrontStateJson() {
		return frontStateJson;
	}
	public void setFrontStateJson(String frontStateJson) {
		this.frontStateJson = frontStateJson;
		this.frontStateMap = JsonUtils.toObject(frontStateJson, new TypeReference<HashMap<String, Long>>() {});
	}
	public HashMap<String, Long> getFrontStateMap() {
		return frontStateMap;
	}
	public void setFrontStateMap(HashMap<String, Long> frontStateMap) {
		this.frontStateMap = frontStateMap;
		this.frontStateJson = JsonUtils.toJson(frontStateMap);
	}
	public String getNextStateIdStr() {
		return nextStateIdStr;
	}
	public void setNextStateIdStr(String nextStateIdStr) {
		this.nextStateIdStr = nextStateIdStr;
		this.nextStateIds = JsonUtils.toObject(nextStateIdStr, new TypeReference<ArrayList<String>>() {});
	}
	public ArrayList<String> getNextStateIds() {
		if (nextStateIds==null) {
			this.nextStateIds = new ArrayList<>();
		}
		return this.nextStateIds;
	}
	public void setNextStateIds(ArrayList<String> nextStateIds) {
		this.nextStateIds = nextStateIds;
		this.nextStateIdStr = JsonUtils.toJson(nextStateIds);
	}
	public Boolean getIsBranch() {
		return isBranch;
	}
	public void setIsBranch(Boolean isBranch) {
		this.isBranch = isBranch;
	}
	public String getBusStateMapJson() {
		return busStateMapJson;
	}
	public void setBusStateMapJson(String busStateMapJson) {
		this.busStateMapJson = busStateMapJson;
		this.businessStateMap = JsonUtils.toObject(busStateMapJson, new TypeReference<HashMap<String, String>>() {});
	}
	public HashMap<String, String> getBusinessStateMap() {
		return businessStateMap;
	}
	public void setBusinessStateMap(HashMap<String, String> businessStateMap) {
		this.businessStateMap = businessStateMap;
		this.busStateMapJson = JsonUtils.toJson(businessStateMap);
	}
	public Boolean getIsBatch() {
		return isBatch;
	}
	public void setIsBatch(Boolean isBatch) {
		this.isBatch = isBatch;
	}
	public WfPageTypes getWfPageTypes() {
		return wfPageTypes;
	}
	public void setWfPageTypes(WfPageTypes wfPageTypes) {
		this.wfPageTypes = wfPageTypes;
	}
	public Boolean getIsHead() {
		return isHead;
	}
	public void setIsHead(Boolean isHead) {
		this.isHead = isHead;
	}
}

