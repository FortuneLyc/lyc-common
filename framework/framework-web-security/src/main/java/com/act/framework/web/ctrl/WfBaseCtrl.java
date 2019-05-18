
package com.act.framework.web.ctrl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.reflect.FieldUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.act.common.constant.workflow.BusinessType;
import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.utils.SecurityUtils;
import com.act.framework.workflow.ctrl.WfApi;
import com.act.framework.workflow.model.WfBusiness;
import com.act.framework.workflow.model.WfExecutable;
import com.act.framework.workflow.model.WfExecutableModel;
import com.act.framework.workflow.service.WfBusinessService;

/**
 * ClassName: WfBaseCtrl <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年8月4日 下午4:44:26 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public abstract class WfBaseCtrl<T extends WfExecutable> {
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private WfBusinessService wfBusinessService;

	@ControllerLog(format="获取当前工作流信息",type=LogType.Select)
	@RequestMapping
	public WfBusiness getBusinessDetail(HttpServletRequest request) throws IllegalAccessException{
		Class<?> clazz = this.getClass();
		ParameterizedType pt = (ParameterizedType) clazz.getGenericSuperclass();
    	Type actualType = pt.getActualTypeArguments()[0];//找到T
    	Object businessType = FieldUtils.readStaticField((Class<?>) actualType, "BUSINESS_TYPE");
		WfBusiness wf = wfBusinessService.selectDetailByBusinessType((BusinessType) businessType);
		String api = request.getRequestURI();
		api = api.replace("getBusinessDetail", "wfExecute");
		wf.setApi(api.substring(1, api.length()));
		return wf;
	}

	@WfApi
	@ControllerLog(format="执行工作流程",type=LogType.Update)
	@RequestMapping(path="/wfExecute", method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Boolean> wfExecute(@RequestBody T entity, HttpServletRequest request){
		WfExecutableModel wfExecutableModel = entity.getWfExecutableModel();
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		wfExecutableModel.setSystemUserId(user.getId());
		wfExecutableModel.setUsername(user.getUsername());
		wfExecutableModel.setDisplayName(user.getDisplayName());

		entity.setWfExecutableModel(wfExecutableModel);
		return wfBusinessService.dispatch(entity);
	}
}

