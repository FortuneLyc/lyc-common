
package com.act.framework.web.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.MyFavorite;
import com.act.framework.web.model.SystemMenu;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.MyFavoriteService;
import com.act.framework.web.service.SystemMenuService;
import com.act.framework.web.utils.SecurityUtils;

/**
 * ClassName:MyFavoriteCtrl <br/>
 * Date:     2017年9月13日 下午12:03:48 <br/>
 * @author   feifan
 * @version
 * @since    JDK 1.8
 * @see
 */
@RequestMapping
@RestController
@ControllerLog(format="收藏夹,菜单点击量统计")
public class MyFavoriteCtrl extends BaseCtrl<MyFavorite> {

	@Autowired
	private MyFavoriteService myFavoriteService;
	@Autowired
	private SystemMenuService systemMenuService;

	@RequestMapping
	@ControllerLog(format="菜单点击量统计",type=LogType.Update)
	public SimpleReturn<Boolean> clickCount(HttpServletRequest request,@RequestBody MyFavorite entity){
		SystemUser sessionUser = SecurityUtils.getUserFromRequest(request);
		if (sessionUser.getId()!=null && sessionUser.getId()>0) { // 判断是否为超级用户(超级用户无ID)
			entity.setUserId(sessionUser.getId());
			myFavoriteService.clickCount(entity);
		}
		return SimpleReturn.instance(Boolean.TRUE);
	}

	@RequestMapping
	@ControllerLog(format="加入收藏夹",type=LogType.Update)
	public SimpleReturn<Boolean> addToFavorite(HttpServletRequest request,@RequestBody MyFavorite entity){
		SystemUser sessionUser = SecurityUtils.getUserFromRequest(request);
		if (sessionUser.getId()!=null && sessionUser.getId()>0) { // 判断是否为超级用户(超级用户无ID)
			entity.setUserId(sessionUser.getId());
			myFavoriteService.addToFavorite(entity);
		}
		return SimpleReturn.instance(Boolean.TRUE);
	}

	@RequestMapping
	@ControllerLog(format="根据用户查询常用快捷菜单",type=LogType.Select)
	public List<SystemMenu> getTopUseMenu(HttpServletRequest request){
		SystemUser sessionUser = SecurityUtils.getUserFromRequest(request);
		List<SystemMenu> list = null;
		if (sessionUser.getId()!=null && sessionUser.getId()>0) { // 判断是否为超级用户(超级用户无ID)
			list = systemMenuService.getTopUseMenu(sessionUser.getId());
		}
		return list;
	}

	@RequestMapping
	@ControllerLog(format="根据用户查询收藏夹",type=LogType.Select)
	public List<SystemMenu> getFavorites(HttpServletRequest request){
		SystemUser sessionUser = SecurityUtils.getUserFromRequest(request);
		List<SystemMenu> list = null;
		if (sessionUser.getId()!=null && sessionUser.getId()>0) { // 判断是否为超级用户(超级用户无ID)
			list = systemMenuService.selectFavorite(sessionUser.getId());
		}
		return list;
	}

	@RequestMapping
	@ControllerLog(format="删除收藏夹菜单",type=LogType.Update)
	public SimpleReturn<Boolean> deleteStore(@RequestParam Long id){
		MyFavorite entity = new MyFavorite();
		entity.setId(id);
		entity.setIsFavorite(false);
		myFavoriteService.updateById(entity);
		return SimpleReturn.instance(Boolean.TRUE);
	}
}

