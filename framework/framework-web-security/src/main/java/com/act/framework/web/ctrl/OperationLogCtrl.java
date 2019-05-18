package com.act.framework.web.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.OperationLog;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.DataDictionaryService;
import com.act.framework.web.service.OperationLogService;

@RestController
@RequestMapping
@ControllerLog(format="操作日志")
public class OperationLogCtrl extends BaseCtrl<OperationLog> {
	
	@Autowired
	private DataDictionaryService dataDictionaryService;
	@Autowired
	private OperationLogService operationLogService;
	
	@RequestMapping
	@ControllerLog(format="操作日志导出全部",type=LogType.Other)
	public List<OperationLog> exportAll(@RequestBody OperationLog entity) throws Exception{
		Integer pageSize = dataDictionaryService.getDicValueByType("ACT_FRAMEWORK_SYSTEM_INFO_EXPORT_ALL_SIZE", Integer.class);
		entity.getBaseEntity().setCurrent(1).setPageSize(pageSize);
		return operationLogService.selectPage(entity).getRows();
	}
}
