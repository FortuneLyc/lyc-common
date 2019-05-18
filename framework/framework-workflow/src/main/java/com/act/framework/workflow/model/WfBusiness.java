
package com.act.framework.workflow.model;

import java.util.List;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.act.common.constant.workflow.BusinessType;
import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName: WfBusiness <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月30日 下午9:53:55 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class WfBusiness implements IBaseEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	/**
	 *业务类型
	 */
	private BusinessType businessType;
	/**
	 * 后台API地址
	 */
	@Transient
	private String api;
	/**
	 *业务描述
	 */
	private String businessName;
	/**
	 * 所有的单项状态
	 */
	@Transient
	private List<WfState> stateList;
	/**
	 * 状态Map
	 */
	@Transient
	private Map<String, List<WfState>> stateMap;

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
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public BusinessType getBusinessType() {
		return businessType;
	}
	public void setBusinessType(BusinessType businessType) {
		this.businessType = businessType;
	}
	public List<WfState> getStateList() {
		return stateList;
	}
	public void setStateList(List<WfState> stateList) {
		this.stateList = stateList;
	}
	public Map<String, List<WfState>> getStateMap() {
		return stateMap;
	}
	public void setStateMap(Map<String, List<WfState>> stateMap) {
		this.stateMap = stateMap;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getApi() {
		return api;
	}
	public void setApi(String api) {
		this.api = api;
	}
}

