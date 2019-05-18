
package com.act.framework.web.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.async.DeferredResult;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.Message;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.utils.SecurityUtils;

/**
 * ClassName:MessageService <br/>
 * Date:     2017年11月15日 上午11:03:44 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@Service
public class MessageService extends SingleTableService<Message> {

	@Value("${message.refreshTime:30}")
	private int refreshTime;
	@Value("${message.timeOut:60}")
	private int timeOut;
	private int refreshTimedet;
	private Set<UserMessage> userMessageSet = new HashSet<UserMessage>();
	
	@Override
	public Class<Message> getGenericClazz() {
		return Message.class;
	}

	public DeferredResult<List<Message>> getUnReadMsg(HttpServletRequest request){
		DeferredResult<List<Message>> deferredResult = new DeferredResult<List<Message>>(timeOut*1000L,new ArrayList<List<Message>>());
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		UserMessage userMessage = new UserMessage(user.getId(),deferredResult);
		userMessageSet.add(userMessage);
		
		return deferredResult;
	}
	
	@Scheduled(fixedDelay = 1000)
	public void refreshMsg(){
		if(refreshTimedet-- > 0){
			return;
		}
		refreshTimedet = refreshTime;
		Iterator<UserMessage> iterator = userMessageSet.iterator();
		while(iterator.hasNext()){
			UserMessage userMessage = iterator.next();
			if(userMessage.getDeferredResult().isSetOrExpired()){
				iterator.remove();
				continue;
			}
			Message message = new Message();
			message.setUserId(userMessage.getUserId());
			message.setIsRead(false);
			List<Message> msgList = this.selectAll(message);
			if(msgList != null && msgList.size() > 0){
				userMessage.getDeferredResult().setResult(msgList);
				iterator.remove();
			}
		}
	}
	
	private class UserMessage {
		private Long userId;
		private DeferredResult<List<Message>> deferredResult;
		
		public UserMessage(Long userID, DeferredResult<List<Message>> deferredResult){
			this.userId = userID;
			this.deferredResult = deferredResult;
		}

		public Long getUserId() {
			return userId;
		}

		public DeferredResult<List<Message>> getDeferredResult() {
			return deferredResult;
		}
		
	}
}

