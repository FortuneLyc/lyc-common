
package com.act.framework.web.service;

import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.RoleMenuElementRelation;

/**
 * ClassName:RoleMenuElementRelatioinService <br/>
 * Date:     2017年12月11日 下午3:57:54 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@Service
public class RoleMenuElementRelationService extends SingleTableService<RoleMenuElementRelation>{

	@Override
	public Class<RoleMenuElementRelation> getGenericClazz() {
		return RoleMenuElementRelation.class;
	}

}

