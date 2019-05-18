/**
 * Project Name:web-framework-base
 * File Name:GreetingCtrl.java
 * Package Name:com.act.framework.web.base.ctrl
 * Date:2016年10月13日下午5:51:26
 *
*/

package com.act.framework.web.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.exception.ApiHandleException;
import com.act.framework.web.model.DataDictionary;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.DataDictionaryService;

@ControllerLog(format="数据字典")
@RestController
@RequestMapping
public class DataDictionaryCtrl extends BaseTreeCtrl<DataDictionary> {
	@Autowired
	private DataDictionaryService dataDictionaryService;

	@ControllerLog(format="根据ID删除数据字典", type=LogType.Delete)
	@Transactional
	@RequestMapping(path="/deleteAll",method={RequestMethod.POST})
	public SimpleReturn<Boolean> deleteAll(long id){
		try {
			dataDictionaryService.deleteAll(id);
		}  catch (Exception e) {
			throw new ApiHandleException("删除字典节点"+id+"失败！ ",e);
		}
		return new SimpleReturn<Boolean>(true);
	}

	@ControllerLog(format="获取数据字典", type=LogType.Select)
	@RequestMapping(path="/selectByType")
	public DataDictionary selectByType(String type) {
		try {
			return dataDictionaryService.getDicByType(type);
		} catch (Exception e) {
			throw new ApiHandleException("获取字典码:["+type+"]失败",e);
		}
	}
	@ControllerLog(format="获取数据字典", type=LogType.Select)
	@RequestMapping(path="/getValueByType")
	public SimpleReturn<?> getValueByType(@RequestParam(name="type",required=true)String type,
			@RequestParam(name="valueType",required=false,defaultValue="String")String valueType) {
		try {
			if ("String".equalsIgnoreCase(valueType)) {
				return new SimpleReturn<String>(dataDictionaryService.getDicValueByType(type, String.class));
			}
			if ("Integer".equalsIgnoreCase(valueType)) {
				return new SimpleReturn<Integer>(dataDictionaryService.getDicValueByType(type, Integer.class));
			}
			if ("Long".equalsIgnoreCase(valueType)) {
				return new SimpleReturn<Long>(dataDictionaryService.getDicValueByType(type, Long.class));
			}
			if ("Boolean".equalsIgnoreCase(valueType)) {
				return new SimpleReturn<Boolean>(dataDictionaryService.getDicValueByType(type, Boolean.class));
			}
			throw new IllegalArgumentException("获取字典参数错误:dictionaryType="+type+" clazz="+valueType);
		} catch (Exception e) {
			throw new ApiHandleException("获取字典码:["+type+"]失败",e);
		}
	}
	@ControllerLog(format="修改数据字典", type=LogType.Update)
	@RequestMapping(path="/updateByType")
	public SimpleReturn<Boolean> updateByType(@RequestParam("type")String type,@RequestParam("value")String value) {
		try {
			return new SimpleReturn<Boolean>(dataDictionaryService.updateByType(type,value));
		} catch (Exception e) {
			throw new ApiHandleException("获取字典码:["+type+"]失败",e);
		}
	}


	@ControllerLog(format="检查字典Type冲突", type=LogType.Select)
	@RequestMapping(path="/checkDicType")
	public SimpleReturn<Boolean> checkDicType(@RequestParam("dicType")String dicType,@RequestParam(name="dicId",required=false)Long dicId) {
		try {
			DataDictionary dd = new DataDictionary();
			dd.setId(dicId);
			dd.setType(dicType);
			dd.getBaseEntity().addNot("id");
			return new SimpleReturn<Boolean>(dataDictionaryService.count(dd)==0);
		} catch (Exception e) {
			throw new ApiHandleException("检查字典Type冲突",e);
		}
	}


}
