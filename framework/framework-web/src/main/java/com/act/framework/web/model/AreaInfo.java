package com.act.framework.web.model;

import java.util.List;

import javax.persistence.*;

import com.alibaba.fastjson.annotation.JSONField;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.web.model.enums.AreaType;

/**
 * ClassName: DataDictionary <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年10月29日 下午6:56:37 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class AreaInfo implements IBaseEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String areaCode;
	private String areaName;
	private AreaType areaType;
	private String parentCode;
	private String remark;
	private Boolean enable;

	@Transient
	private List<AreaInfo> children;
	@JSONField(serialize = false)
	@Transient
	private BaseEntity baseEntity;
	@Override
	public BaseEntity getBaseEntity() {
		if (this.baseEntity==null) {
			this.baseEntity = new BaseEntity().setNoPageNoSort();
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
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public AreaType getAreaType() {
		return areaType;
	}
	public void setAreaType(AreaType areaType) {
		this.areaType = areaType;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	public List<AreaInfo> getChildren() {
		return children;
	}
	public void setChildren(List<AreaInfo> children) {
		this.children = children;
	}

}

