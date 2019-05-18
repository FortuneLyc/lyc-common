
package com.act.framework.web.ctrl;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.UserRoleRelation;

/**
 * ClassName:UserRoleRelationCtrl <br/>
 * Date:     2017年11月3日 下午1:57:28 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@RestController
@RequestMapping
@ControllerLog(format="用户角色对应关系ctrl")
public class UserRoleRelationCtrl extends BaseCtrl<UserRoleRelation> {

}

