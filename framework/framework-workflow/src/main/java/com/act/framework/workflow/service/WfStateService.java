
package com.act.framework.workflow.service;

import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.workflow.model.WfState;

/**
 * ClassName: UserRoleRelationService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Service
public class WfStateService extends SingleTableService<WfState> {

	@Override
	public Class<WfState> getGenericClazz() {
		return WfState.class;
	}

}

