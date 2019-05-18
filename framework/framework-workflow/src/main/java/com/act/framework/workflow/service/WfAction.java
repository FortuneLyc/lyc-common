
package com.act.framework.workflow.service;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.workflow.model.WfExecutable;

/**
 * ClassName: WfAction <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月31日 下午2:02:56 <br/>
 * @author   lyc
 * @version

 * @see
 */
public interface WfAction {

	SimpleReturn<Boolean> execute(WfExecutable executable) throws Exception;
}

