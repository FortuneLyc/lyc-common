
package com.act.framework.web.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.DeferredResult;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.Message;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.MessageService;
import com.act.framework.web.utils.SecurityUtils;

/**
 * ClassName:MessageCtrl <br/>
 * Date:     2017年11月15日 上午10:54:41 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@RequestMapping
@RestController
@ControllerLog(format="用户消息ctrl")
public class MessageCtrl extends BaseCtrl<Message> {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping
	@ControllerLog(format="服务端定时推送用户未读msg",type=LogType.Select)
	public DeferredResult<List<Message>> getUnReadMsg(HttpServletRequest request){
		return messageService.getUnReadMsg(request);
	}
	
	@RequestMapping
	@ControllerLog(format="查询用户未读消息",type=LogType.Select)
	public List<Message> selectMsgByUserId(HttpServletRequest request){
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		Message message = new Message();
		message.setUserId(user.getId());
		message.setIsRead(false);
		List<Message> list = messageService.selectAll(message);
		return list;
	}
}

