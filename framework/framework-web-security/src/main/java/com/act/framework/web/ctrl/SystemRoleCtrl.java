package com.act.framework.web.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.SystemRole;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.SystemRoleService;

@RestController
@RequestMapping
@ControllerLog(format="系统角色")
public class SystemRoleCtrl extends BaseTreeCtrl<SystemRole> {

	@Autowired
	private SystemRoleService systemRoleService;

	@Override
	@ControllerLog(format="验证角色参数", type=LogType.Select)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> check(@RequestBody SystemRole systemRole, HttpServletRequest request, HttpServletResponse response) {
		return systemRoleService.check(systemRole);
	}

}
