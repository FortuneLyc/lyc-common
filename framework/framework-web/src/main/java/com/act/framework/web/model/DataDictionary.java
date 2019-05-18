package com.act.framework.web.model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Transient;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.model.TreeModel;
import com.act.framework.basic.utils.JsonUtils;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName: DataDictionary <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年10月29日 下午6:56:37 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class DataDictionary extends TreeModel<DataDictionary> implements IBaseEntity {
	private static final long serialVersionUID = -7033053099332263061L;

	/**
	 * 和type不一样在这是一个可以重复的标识
	 */
	private String label;
	private String type;
	private String value;
	@Transient
	private Object orginValue;
	private String remark;
	private Boolean enable;
	private String attrJson;
	@Transient
	private Map<String, String> attr;

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
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
		this.orginValue = value;
	}
	public Object getOrginValue() {
		return orginValue;
	}
	public void setOrginValue(Object orginValue) {
		this.orginValue = orginValue;
	}
	public String getAttrJson() {
		return attrJson;
	}
	public void setAttrJson(String attrJson) {
		this.attrJson = attrJson;
		this.attr = JsonUtils.toObject(attrJson, new TypeReference<HashMap<String, String>>() {});
	}
	public Map<String, String> getAttr() {
		return attr;
	}
	public void setAttr(Map<String, String> attr) {
		this.attr = attr;
		this.attrJson = JsonUtils.toJson(attr);
	}
}

