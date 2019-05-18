
package com.act.framework.web.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.MenuElement;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.MenuElementService;
import com.act.framework.web.vo.MenuElementVo;

/**
 * ClassName:MenuElementCtrl <br/>
 * Date:     2017年12月11日 下午3:58:59 <br/>
 * @author   feifan
 * @version
 * @since    JDK 1.8
 * @see
 */
@RestController
@RequestMapping
@ControllerLog(format="前端页面HTML元素控制器")
public class MenuElementCtrl extends BaseCtrl<MenuElement> {

	@Autowired
	private MenuElementService menuElementService;

	@RequestMapping
	@ControllerLog(format="根据用户获取前端页面可控制的HTML元素",type = LogType.Select)
	public List<MenuElement> getMenuElementByUser(HttpServletRequest request){
		return menuElementService.getMenuElementByUser(request);
	}

	@ControllerLog(format="更新角色可控元素关系", type=LogType.Update)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> updateRoleElRelation(@RequestBody MenuElementVo menuElementVo) {
		return new SimpleReturn<Boolean>(menuElementService.updateRoleElRelation(menuElementVo));
	}

	@ControllerLog(format="获取菜单管理被选中的HTML元素", type=LogType.Select)
	@RequestMapping
	public List<Long> getCheckedMenuIds(Long roleId,Long menuId) {
		return menuElementService.getCheckedMenuIds(roleId, menuId);
	}

	@ControllerLog(format="新增自定义指令元素", type=LogType.Insert)
	@RequestMapping
	public SimpleReturn<Boolean> addActSecurity(@RequestBody MenuElement entity) {
		return menuElementService.addActSecurity(entity);
	}

	@ControllerLog(format="清空节点下的元素", type=LogType.Delete)
	@RequestMapping
	public SimpleReturn<Boolean> clearElementItem(Long menuId) {
		return menuElementService.clearElementItem(menuId);
	}
}

