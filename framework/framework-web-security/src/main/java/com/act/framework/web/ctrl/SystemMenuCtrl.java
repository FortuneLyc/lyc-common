package com.act.framework.web.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.MenuInfo;
import com.act.framework.web.model.SystemMenu;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.RoleMenuService;
import com.act.framework.web.service.SystemMenuService;
import com.act.framework.web.utils.SecurityUtils;

@RestController
@RequestMapping
@ControllerLog(format="系统菜单")
public class SystemMenuCtrl extends BaseTreeCtrl<SystemMenu> {

	@Autowired
	private RoleMenuService roleMenuService;
	@Autowired
	private SystemMenuService systemMenuService;
	

	@ControllerLog(format="获取菜单信息", type=LogType.Select)
	@RequestMapping(method={RequestMethod.GET})
	public SystemMenu get(HttpServletRequest request, HttpServletResponse response) {
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		return systemMenuService.selectByUser(user);
	}

	@ControllerLog(format="获取角色能使用的菜单列表", type=LogType.Select)
	@RequestMapping()
	public List<Long> availableMenu(@RequestParam("roleFatherId") Long roleFatherId, HttpServletRequest request, HttpServletResponse response) {
		return roleMenuService.checkedMenuIds(roleFatherId);
	}

	@ControllerLog(format="获取角色已分配的菜单列表", type=LogType.Select)
	@RequestMapping()
	public List<Long> checkedMenu(@RequestParam("roleId") Long roleId, HttpServletRequest request, HttpServletResponse response) {
		return roleMenuService.checkedMenuIds(roleId);
	}

	@Override
	@ControllerLog(format="验证参数", type=LogType.Select)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> check(@RequestBody SystemMenu systemMenu, HttpServletRequest request, HttpServletResponse response) {
		return systemMenuService.check(systemMenu);
	}

	@ControllerLog(format="获取角色已分配的所有菜单", type=LogType.Select)
	@RequestMapping(method={RequestMethod.POST})
	public MenuInfo selectAllMenus(HttpServletRequest request, HttpServletResponse response) {
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		return systemMenuService.selectAllMenus(user);
	}
}
