package com.act.framework.web.ctrl;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.ResourceAccess;

@RestController
@RequestMapping
@ControllerLog(format="资源权限")
public class ResourceAccessCtrl extends BaseCtrl<ResourceAccess> {

}
