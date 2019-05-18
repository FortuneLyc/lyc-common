
package com.act.framework.web.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.service.SingleTreeTableService;
import com.act.framework.web.dao.SystemRoleMapper;
import com.act.framework.web.model.RoleMenu;
import com.act.framework.web.model.SystemRole;

/**
 * ClassName: SystemRoleService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
@Service
public class SystemRoleService extends SingleTreeTableService<SystemRole> {

	@Override
	public Class<SystemRole> getGenericClazz() {
		return SystemRole.class;
	}

	@Autowired
	private SystemRoleMapper systemRoleMapper;

	@Autowired
	private RoleMenuService roleMenuService;

	public List<SystemRole> selectByUserId(Long userId) {
		return systemRoleMapper.selectByUserId(userId);
	}

	@Override
	public SimpleReturn<Boolean> check(SystemRole systemRole) {
		if (StringUtils.isNotBlank(systemRole.getRolename())) {
			SystemRole entity = new SystemRole();
			entity.setRolename(systemRole.getRolename());
			if (systemRole.getId()!=null) {
				entity.setId(systemRole.getId());
				entity.getBaseEntity().addNot("id");
			}
			int count = count(entity);
			if (count>0) {
				return new SimpleReturn<Boolean>(false,"角色名重复");
			}
		}
		if (systemRole.getId()!=null) {
			SystemRole entity = this.selectById(systemRole.getId());
			if (entity==null) {
				String msg = "验证失败,id="+systemRole.getId()+"的角色不存在";
				return new SimpleReturn<Boolean>(false, msg);
			}
		}
		return new SimpleReturn<Boolean>(true);
	}

	@Override
	public int deleteById(Long id) {
		int i = super.deleteById(id);
		if (i>0) {
			RoleMenu entity = new RoleMenu();
			entity.setRoleId(id);
			roleMenuService.delete(entity);
		}
		return i;
	}

}

