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
import com.act.framework.web.model.RoleMenu;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.RoleMenuService;
import com.act.framework.web.vo.RoleMenuVo;

@RestController
@RequestMapping
@ControllerLog(format="角色菜单")
public class RoleMenuCtrl extends BaseCtrl<RoleMenu> {

	@Autowired
	private RoleMenuService roleMenuService;

	@ControllerLog(format="更新角色菜单关系", type=LogType.Update)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> updateRoleMenuRelation(@RequestBody RoleMenuVo roleMenuVo, HttpServletRequest request, HttpServletResponse response) {
		return new SimpleReturn<Boolean>(roleMenuService.updateRoleMenuRelation(roleMenuVo));
	}

}
