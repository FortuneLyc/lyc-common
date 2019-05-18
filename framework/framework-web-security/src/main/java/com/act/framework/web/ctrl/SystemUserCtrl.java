package com.act.framework.web.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.model.enums.SystemUserType;
import com.act.framework.web.service.SystemUserService;
import com.act.framework.web.utils.SecurityUtils;

@RestController
@RequestMapping
@ControllerLog(format="系统用户管理")
public class SystemUserCtrl extends BaseCtrl<SystemUser> {

	@Autowired
	private SystemUserService systemUserService;

	@ControllerLog(format="获取用户信息", type=LogType.Select)
	@RequestMapping(method={RequestMethod.GET})
	public SystemUser get(HttpServletRequest request, HttpServletResponse response) {
		SystemUser sessionUser = SecurityUtils.getUserFromRequest(request);
		if (sessionUser.getId()!=null && sessionUser.getId()>0) {
//			return systemUserService.selectUserByUsername(sessionUser.getUsername());
			return systemUserService.selectById(sessionUser.getId());
		}
		return sessionUser;
	}
	@ControllerLog(format="验证当前用户密码", type=LogType.Select)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> verify(@RequestParam("password")String password, HttpServletRequest request, HttpServletResponse response) {
		SystemUser su = SecurityUtils.getUserFromRequest(request);
		if (!SystemUserType.super_admin.equals(su.getSystemUserType())) {
			su = super.selectById(su.getId(), request, response);
		}
		if (su.getPassword().equals(password)) {
			return new SimpleReturn<Boolean>(true);
		}else{
			return new SimpleReturn<Boolean>(false);
		}
	}
	@ControllerLog(format="验证用户参数", type=LogType.Select)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> check(@RequestBody SystemUser systemUser, HttpServletRequest request, HttpServletResponse response) {
		return systemUserService.check(systemUser);
	}
	@ControllerLog(format="删除用户", type=LogType.Delete)
	@Override
	public SimpleReturn<Boolean> deleteById(long id, HttpServletRequest request, HttpServletResponse response) {
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		if (user.getId().equals(id)) {
			return new SimpleReturn<Boolean>(false,"不允许删除自己");
		}
		return super.deleteById(id, request, response);
	}
	@ControllerLog(format="尝试不支持的删除操作", type=LogType.Other)
	@Override
	public SimpleReturn<Boolean> deleteByIds(long[] ids, HttpServletRequest request, HttpServletResponse response) {
		throw new UnsupportedOperationException("不支持的操作");
	}
	@ControllerLog(format="尝试不支持的删除操作", type=LogType.Other)
	@Override
	public SimpleReturn<Boolean> delete(SystemUser entity, HttpServletRequest request, HttpServletResponse response) {
		throw new UnsupportedOperationException("不支持的操作");
	}

	@ControllerLog(format="修改当前用户密码", type=LogType.Update)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> changePassword(@RequestParam("oldPassword")String oldPassword, @RequestParam("newPassword")String newPassword, HttpServletRequest request, HttpServletResponse response) {
		SystemUser su = SecurityUtils.getUserFromRequest(request);
		if (SystemUserType.super_admin.equals(su.getSystemUserType())) {
			return new SimpleReturn<Boolean>(false, "不允许在此修改超级用户密码");
		}
		su = systemUserService.selectById(su.getId());
		if (!su.getPassword().equals(oldPassword)) {
			return new SimpleReturn<Boolean>(false, "原密码不正确");
		}
		SystemUser temp = new SystemUser();
		temp.setId(su.getId());
		temp.setPassword(newPassword);
		systemUserService.updateById(temp);
		return new SimpleReturn<Boolean>(true);
	}

	@ControllerLog(format="修改当前用户布局", type=LogType.Update)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> changeLayout(@RequestParam("layout")String layout, HttpServletRequest request, HttpServletResponse response) {
		SystemUser su = SecurityUtils.getUserFromRequest(request);
		if (SystemUserType.super_admin.equals(su.getSystemUserType())) {
			return new SimpleReturn<Boolean>(false, "不允许修改超级用户");
		}
		SystemUser temp = new SystemUser();
		temp.setId(su.getId());
		temp.setLayout(layout);
		systemUserService.updateById(temp);
		return new SimpleReturn<Boolean>(true);
	}

	@ControllerLog(format="修改当前用户主题", type=LogType.Update)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> changeTheme(@RequestParam("theme")String theme, HttpServletRequest request, HttpServletResponse response) {
		SystemUser su = SecurityUtils.getUserFromRequest(request);
		if (SystemUserType.super_admin.equals(su.getSystemUserType())) {
			return new SimpleReturn<Boolean>(false, "不允许修改超级用户");
		}
		SystemUser temp = new SystemUser();
		temp.setId(su.getId());
		temp.setTheme(theme);
		systemUserService.updateById(temp);
		return new SimpleReturn<Boolean>(true);
	}

}
