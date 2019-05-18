package com.act.framework.web.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.OperationLog;

import tk.mybatis.mapper.entity.Example;

/**
 * ClassName: OperationLogService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:27:15 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
@Service
public class OperationLogService extends SingleTableService<OperationLog>  {

	@Override
	public Class<OperationLog> getGenericClazz() {
		return OperationLog.class;
	}

	private ConcurrentLinkedQueue<OperationLog> queue = new ConcurrentLinkedQueue<>();

	public void addLog(OperationLog log){
		queue.add(log);
	}

	@Scheduled(initialDelay=1000,fixedDelay=5000)
	private synchronized void saveToDb(){
		try {
			if (queue.isEmpty()) {
				return;
			}
			List<OperationLog> tempList = new ArrayList<>((int)(queue.size()*1.3));
			while (!queue.isEmpty()) {
				OperationLog log = queue.poll();
				if (log.getMessage() != null && log.getMessage().length()>1900) {
					log.setMessage(log.getMessage().substring(0, 1900));
				}
				tempList.add(log);
			}
			this.insertList(tempList);
		} catch (Exception e) {
			logger.error("操作日志入库错误！",e);
		}
	}

	@Value("${spring.operationLog.logRemainDay:30}")
	private int logRemainDay;

	@Scheduled(cron="0 0 3 * * ?")//每天凌晨3点
	@Transactional
	void deleteOldData(){
		LocalDateTime ldt = LocalDateTime.now().minusDays(logRemainDay);
		Example example = new Example(OperationLog.class);
		example.or().andLessThan("time", Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant()));
		super.mapper.deleteByExample(example);
	}

}

