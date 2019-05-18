package com.act.framework.web.ctrl;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.workflow.model.WfState;

@RestController
@RequestMapping
@ControllerLog(format="工作流详情模块")
public class WfStateCtrl extends BaseCtrl<WfState> {


}
























