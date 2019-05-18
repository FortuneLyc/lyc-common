package com.act.framework.web.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.act.common.constant.workflow.BusinessType;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.exception.ApiHandleException;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.workflow.model.WfBusiness;
import com.act.framework.workflow.service.WfBusinessService;

@RestController
@RequestMapping
@ControllerLog(format="工作流模块")
public class WfBusinessCtrl extends BaseCtrl<WfBusiness> {

	@Autowired
	private WfBusinessService wfBusinessService;

	@ControllerLog(format="根据业务类型获取工作流详情数据", type=LogType.Select)
	@RequestMapping(path="/selectDetailByBusinessType")
	public WfBusiness selectDetailByBusinessType(@RequestParam("businessType")BusinessType businessType, HttpServletRequest request, HttpServletResponse response) {
		try {
			return wfBusinessService.selectDetailByBusinessType(businessType);
		} catch (Exception e) {
			throw new ApiHandleException("根据业务类型获取工作流详情数据失败",e);
		}
	}

}
























