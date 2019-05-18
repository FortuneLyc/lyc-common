package com.act.framework.web.service;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.act.common.orm.type.LongEnum;
import com.act.common.orm.type.StringEnum;
import com.act.common.other.type.DescribeType;
import com.act.framework.basic.model.enums.TreeNodeType;
import com.act.framework.basic.service.SingleTreeTableService;
import com.act.framework.web.model.DataDictionary;

/**
 * ClassName: DataDictionaryService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:27:15 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Service
public class DataDictionaryService extends SingleTreeTableService<DataDictionary> {

	@Override
	public Class<DataDictionary> getGenericClazz() {
		return DataDictionary.class;
	}

	@Autowired
	private Map<String, Class<?>> enumDictMap;

	public DataDictionary getDicByType(String type) throws Exception {

		DataDictionary dd = new DataDictionary();
		dd.setType(type);
		dd = super.selectOne(dd);
		if (dd!=null) {
			this.fillChildren(dd);
			return dd;

		}
		return fromEnum(type);
	}

	private DataDictionary fromEnum(String type) {
		Class<?> enumType = enumDictMap.get(type);
		if (enumType == null) {
			throw new IllegalArgumentException(type+"找不到对应表");
		}
		if (!DescribeType.class.isAssignableFrom(enumType)) {
			throw new IllegalArgumentException("找到的"+enumType+"枚举应该实现接口 com.act.common.other.type.DescribeType");
		}

		DataDictionary dd = new DataDictionary();
		dd.setType(type);
		dd.setLabel(enumType.getName());
		dd.setTreeNodeType(TreeNodeType.Root);
		dd.setEnable(true);

		DescribeType[] enums = (DescribeType[]) enumType.getEnumConstants();
		for (DescribeType e : enums) {
			DataDictionary c = new DataDictionary();
			c.setEnable(true);
			c.setLabel(e.getDescribe());
			c.setTreeNodeType(TreeNodeType.Leaf);
			c.setType(((Enum<?>)e).name());

			if (LongEnum.class.isAssignableFrom(enumType)) {
				c.setValue(((LongEnum)e).getLongType().toString());
				c.setOrginValue(((LongEnum)e).getLongType());
			} else if (StringEnum.class.isAssignableFrom(enumType)) {
				c.setValue(((StringEnum)e).getStringType());
			} else {
				c.setValue(e.toString());
			}
			dd.addChild(c);
		}
		return dd;
	}

	public boolean updateByType(String type, String value) {
		if (StringUtils.isEmpty(value)) {
			throw new IllegalArgumentException("字典值不支持 null 和 空");
		}
		DataDictionary dd = new DataDictionary();
		dd.setType(type);
		dd = super.selectOne(dd);
		DataDictionary ddo = new DataDictionary();
		ddo.setId(dd.getId());
		ddo.setValue(value);
		return super.updateById(ddo)>0;
	}

	public <T> T getDicValueByType(String type,Class<T> clazz) throws Exception {
		DataDictionary dd = new DataDictionary();
		dd.setType(type);
		dd = super.selectOne(dd);
		if (dd==null) {
			throw new IllegalArgumentException(type+"找不到对应表");
		}
		if (clazz.equals(String.class)) {
			return clazz.cast(dd.getValue());
		}
		if (clazz.equals(Integer.class)) {
			return clazz.cast(Integer.valueOf(dd.getValue()));
		}
		if (clazz.equals(Long.class)) {
			return clazz.cast(Long.valueOf(dd.getValue()));
		}
		if (clazz.equals(Boolean.class)) {
			return clazz.cast(Boolean.valueOf(dd.getValue()));
		}
		throw new IllegalArgumentException("获取字典参数错误:dictionaryType="+type+" clazz="+clazz);
	}

	public String getDicValueByType(String type) throws Exception {
		return getDicValueByType(type,String.class);
	}

	public void deleteAll(Long id) {
		DataDictionary dataDictionary = new DataDictionary();
		dataDictionary.setId(id);
		dataDictionary = super.selectOne(dataDictionary);
		this.fillChildren(dataDictionary);
		deleteAll(dataDictionary);
	}

	private void deleteAll(DataDictionary dataDictionary) {
		if(dataDictionary.getChildren()!=null && dataDictionary.getChildren().size()>0){
			for(DataDictionary sub:dataDictionary.getChildren()){
				deleteAll(sub);
			}
			super.deleteById(dataDictionary.getId());
		}else{
			super.deleteById(dataDictionary.getId());
		}
	}

}

