
package com.act.framework.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.act.framework.basic.service.SingleTableMapper;
import com.act.framework.web.model.MenuElement;
import com.act.framework.web.model.SystemUser;

/**
 * ClassName:MenuElementMapper <br/>
 * Date:     2017年12月11日 下午3:57:18 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
public interface MenuElementMapper extends SingleTableMapper<MenuElement> {
	
	public List<MenuElement> getMenuElementByUser(SystemUser user);

	public List<Long> getCheckedMenuIds(@Param("roleId") Long roleId,@Param("menuId") Long menuId);
}

