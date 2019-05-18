
package com.act.framework.web.service;

import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.UserRoleRelation;

/**
 * ClassName: UserRoleRelationService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
@Service
public class UserRoleRelationService extends SingleTableService<UserRoleRelation> {

	@Override
	public Class<UserRoleRelation> getGenericClazz() {
		return UserRoleRelation.class;
	}

}

