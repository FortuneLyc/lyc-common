
package com.act.framework.web.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.model.enums.TreeNodeType;
import com.act.framework.basic.service.SingleTreeTableService;
import com.act.framework.web.dao.SystemMenuMapper;
import com.act.framework.web.model.Menu;
import com.act.framework.web.model.MenuInfo;
import com.act.framework.web.model.RoleMenu;
import com.act.framework.web.model.SystemMenu;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.SystemUserType;

/**
 * ClassName: SystemMenuService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
@Service
public class SystemMenuService extends SingleTreeTableService<SystemMenu> {

	@Override
	public Class<SystemMenu> getGenericClazz() {
		return SystemMenu.class;
	}

	@Autowired
	private RoleMenuService roleMenuService;
	@Autowired
	private SystemMenuMapper systemMenuMapper;

	@Override
	public int updateById(SystemMenu entity) {
		int i = super.updateById(entity);
		SystemMenu sm = selectById(entity.getId());
		boolean isNull = false;
		if ("null".equalsIgnoreCase(sm.getMenuPath())) {
			sm.setMenuPath(null);
			isNull = true;
		}
		if("null".equalsIgnoreCase(sm.getRemark())){
			sm.setRemark(null);
			isNull = true;
		}
		if (isNull) {
			super.updateFullById(sm);
		}

		return i;
	}

	@Override
	public int deleteById(Long id) {
		int i = super.deleteById(id);
		if (i>0) {
			RoleMenu entity = new RoleMenu();
			entity.setMenuId(id);
			roleMenuService.delete(entity);
		}
		return i;
	}

	public SystemMenu selectByUser(SystemUser user) {
		if (SystemUserType.super_admin.equals(user.getSystemUserType())) {
			return selectAllTree();
		}
		List<SystemMenu> menuList = systemMenuMapper.selectByUserId(user.getId());
		SystemMenu sm = new SystemMenu();
		sm.setTreeNodeType(TreeNodeType.Root);
		sm = selectOne(sm);
		for (SystemMenu systemMenu : menuList) {
			SingleTreeTableService.combineSingleNodeToSameNodeTree(sm, selectToRootTree(systemMenu));
		}
		return sm;
	}

	@Override
	public SimpleReturn<Boolean> check(SystemMenu systemMenu) {
//      因为反诈系统有菜单名重复但是菜单路径不同的情况，将这种验证去掉，由人工进行控制
//		if (StringUtils.isNotBlank(systemMenu.getMenuName())) {
//			SystemMenu entity = new SystemMenu();
//			entity.setMenuName(systemMenu.getMenuName());
//			if (systemMenu.getId()!=null) {
//				entity.setId(systemMenu.getId());
//				entity.setFatherId(systemMenu.getFatherId());
//				entity.getBaseEntity().addNot("id");
//			}
//			int count = count(entity);
//			if (count>0) {
//				return new SimpleReturn<Boolean>(false,"同级菜单名重复");
//			}
//		}
		if (systemMenu.getId()!=null) {
			SystemMenu old = this.selectById(systemMenu.getId());
			if (old==null) {
				String msg = "验证失败,id="+systemMenu.getId()+"的菜单不存在";
				return new SimpleReturn<Boolean>(false, msg);
			}
			if (!TreeNodeType.Root.equals(old.getTreeNodeType()) && StringUtils.isNotBlank(systemMenu.getMenuCode())){
				SystemMenu entity = new SystemMenu();
				entity.setId(systemMenu.getId());
				entity.setMenuCode(systemMenu.getMenuCode());
				entity.setTreeNodeType(TreeNodeType.Root);
				entity.getBaseEntity().addNot("id","treeNodeType");
				int count = count(entity);
				if (count>0) {
					return new SimpleReturn<Boolean>(false,"菜单编码重复");
				}
			}
		} else {
			if (StringUtils.isNotBlank(systemMenu.getMenuCode())){
				SystemMenu entity = new SystemMenu();
				entity.setMenuCode(systemMenu.getMenuCode());
				entity.setTreeNodeType(TreeNodeType.Root);
				entity.getBaseEntity().addNot("treeNodeType");
				int count = count(entity);
				if (count>0) {
					return new SimpleReturn<Boolean>(false,"菜单编码重复");
				}
			}
		}
		return new SimpleReturn<Boolean>(true);
	}

	public List<SystemMenu> getTopUseMenu(Long userId){
		return systemMenuMapper.getTopUseMenu(userId);
	}

	public List<SystemMenu> selectFavorite(Long userId){
		return systemMenuMapper.selectFavorite(userId);
	}



	public MenuInfo selectAllMenus(SystemUser user) {
		MenuInfo menuInfo = new MenuInfo();
		SystemMenu selectByUser = selectByUser(user);
		if(selectByUser != null){
			if("0".equals(String.valueOf(selectByUser.getTreeNodeType().getLongType()))){
				menuInfo.setAdmin(true);
			}else{
				menuInfo.setAdmin(true);
			}
			menuInfo.setPlatformUrl(selectByUser.getMenuPath());
			menuInfo.setUserName(user.getUsername());
			menuInfo.setUserId(String.valueOf(user.getId()));
			menuInfo.setLoginUrl("prospero://exywegdlv.gy/kyp");
			menuInfo.setMenus(list(selectByUser.getChildren()));
		}
		return menuInfo;
	}

	public List<Menu> list(List<SystemMenu> children) {
		List<Menu> lists  = new ArrayList<>();
		if(children != null && children.size() > 0){
			for (SystemMenu systemMenu : children) {
				Menu menu = new Menu();
				String menuPath = systemMenu.getMenuPath();
				menu.setComponent(menuPath);
				menu.setName(systemMenu.getMenuName());
				menu.setIcon(systemMenu.getMenuIcon());
				menu.setPath("/"+(systemMenu.getMenuCode()==null?"":systemMenu.getMenuCode()));
				menu.setHidden(false);
				List<SystemMenu> systemMenus = systemMenu.getChildren();
				if(systemMenus != null && systemMenus.size() > 0){
					menu.setChildren(list(systemMenus));
				}
				lists.add(menu);
			}
		}
		return lists;
	}

}

