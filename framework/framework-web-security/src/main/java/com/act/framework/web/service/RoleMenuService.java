package com.act.framework.web.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.RoleMenu;
import com.act.framework.web.vo.RoleMenuVo;

/**
 * ClassName: RoleMenuService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:27:15 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
@Service
public class RoleMenuService  extends SingleTableService<RoleMenu>  {

	@Override
	public Class<RoleMenu> getGenericClazz() {
		return RoleMenu.class;
	}

	@Autowired
	private SystemMenuService systemMenuService;

	public List<Long> checkedMenuIds(Long roleId) {
		if (roleId == null) {
			throw new IllegalArgumentException("roleId不允许为 null");
		}
		if (roleId.equals(1L)) {//root节点默认有所有权限
			return systemMenuService.selectAll(null).stream().map(r -> r.getId()).collect(Collectors.toList());
		}
		RoleMenu rm = new RoleMenu();
		rm.setRoleId(roleId);
		List<RoleMenu> rmList = selectAll(rm);
		return rmList.stream().map(r -> r.getMenuId()).collect(Collectors.toList());
	}

	@Transactional
	public Boolean updateRoleMenuRelation(RoleMenuVo roleMenuVo) {
		RoleMenu entity = new RoleMenu();
		entity.setRoleId(roleMenuVo.getRoleId());
		delete(entity);
		if(roleMenuVo.getCheckedMenuIds() != null && roleMenuVo.getCheckedMenuIds().size() > 0){			
			for (Long menuId : roleMenuVo.getCheckedMenuIds()) {
				RoleMenu rm = new RoleMenu();
				rm.setRoleId(roleMenuVo.getRoleId());
				rm.setMenuId(menuId);
				insert(rm);
			}
		}
		return true;
	}

}

