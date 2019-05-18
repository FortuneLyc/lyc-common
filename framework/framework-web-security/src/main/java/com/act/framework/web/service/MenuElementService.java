
package com.act.framework.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.dao.MenuElementMapper;
import com.act.framework.web.model.MenuElement;
import com.act.framework.web.model.RoleMenuElementRelation;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.utils.SecurityUtils;
import com.act.framework.web.vo.MenuElementVo;

/**
 * ClassName:MenuElementService <br/>
 * Date:     2017年12月11日 下午3:56:42 <br/>
 * @author   feifan
 * @version
 * @since    JDK 1.8
 * @see
 */
@Service
public class MenuElementService extends SingleTableService<MenuElement> {

	@Autowired
	private MenuElementMapper menuElementMapper;
	@Autowired
	private RoleMenuElementRelationService roleMenuElementRelatioinService;

	@Override
	public Class<MenuElement> getGenericClazz() {
		return MenuElement.class;
	}

	public List<MenuElement> getMenuElementByUser(HttpServletRequest request){
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		List<MenuElement> list = menuElementMapper.getMenuElementByUser(user);
		return list;
	}

	@Transactional
	public Boolean updateRoleElRelation(MenuElementVo menuElementVo) {
		RoleMenuElementRelation relatioin = new RoleMenuElementRelation();
		relatioin.setMenuId(menuElementVo.getMenuId());
		relatioin.setRoleId(menuElementVo.getRoleId());
		roleMenuElementRelatioinService.delete(relatioin);

		if(menuElementVo.getCheckedElIds() != null && menuElementVo.getCheckedElIds().size() > 0){
			for (Long elementId : menuElementVo.getCheckedElIds()) {
				RoleMenuElementRelation r = new RoleMenuElementRelation();
				r.setMenuId(menuElementVo.getMenuId());
				r.setRoleId(menuElementVo.getRoleId());
				r.setElementId(elementId);
				roleMenuElementRelatioinService.insert(r);
			}
		}
		return true;
	}

	public List<Long> getCheckedMenuIds(Long roleId,Long menuId) {
		return menuElementMapper.getCheckedMenuIds(roleId, menuId);
	}

	@Transactional
	public synchronized SimpleReturn<Boolean> addActSecurity(@RequestBody MenuElement entity) {
		List<MenuElement> menuElements = selectAll(entity);
		if(menuElements !=null && menuElements.size() > 0){
			return new SimpleReturn<Boolean>(true,"该元素已入库");
		}
		insert(entity);
		return new SimpleReturn<Boolean>(true);
	}

	public SimpleReturn<Boolean> clearElementItem(Long menuId) {
		MenuElement entity = new MenuElement();
		entity.setMenuId(menuId);
		super.delete(entity);

		RoleMenuElementRelation relatioin = new RoleMenuElementRelation();
		relatioin.setMenuId(menuId);
		roleMenuElementRelatioinService.delete(relatioin);

		return new SimpleReturn<Boolean>(true);
	}
}

