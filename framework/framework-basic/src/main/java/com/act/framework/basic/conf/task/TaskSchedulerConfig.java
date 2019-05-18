
package com.act.framework.basic.conf.task;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;

import org.apache.commons.lang3.ArrayUtils;
import org.quartz.CronTrigger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.*;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;


/**
 * ClassName: TaskSchedulerConfig <br/>
 * Function:  <br/>
 * Reason:配置示例
 * <pre>
 * task:
 *   autoQuartz:
 *     - beanName: myJobBeanName
 *       cron: 0/2 * * * * ? *
 *       desc: 这是一个示例配置
 * <pre/>
 * myJobBeanName必须是spring容器中的bean并且实现接口 {@link com.act.framework.basic.service.MyQuartzJob MyQuartzWork}
 * Date:      2016年11月8日 上午10:04:32 <br/>
 * @author   lyc
 * @version

 *
 */
@Configuration
@ComponentScan("com.act")
@EnableScheduling
@ConfigurationProperties(prefix="task")
public class TaskSchedulerConfig implements SchedulingConfigurer {
	private static Logger logger = LoggerFactory.getLogger(TaskSchedulerConfig.class);

	@Value("${spring.task.taskSchedulerPoolSize:8}")
	private int taskSchedulerPoolSize;
	@Value("${task.quartzPoolSize:8}")
	private int quartzPoolSize;

	@Autowired
	private ApplicationContext context;

	@Bean
	public SchedulerFactoryBean myScheduler(){
		SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
		Map<String, CronTriggerFactoryBean> map =context.getBeansOfType(CronTriggerFactoryBean.class, false, false);//
		CronTrigger[] triggers1 = map.values().stream().map(CronTriggerFactoryBean::getObject).toArray(CronTrigger[]::new);
		CronTrigger[] triggers2 = getAutoConfigTrigger();
		CronTrigger[] triggers = ArrayUtils.addAll(triggers1, triggers2);
		schedulerFactoryBean.setTriggers(triggers);
		schedulerFactoryBean.setTaskExecutor(Executors.newFixedThreadPool(quartzPoolSize));
		logger.info("====================== 定时任务信息 ======================");
		for (CronTrigger cronTrigger : triggers) {
			logger.info("描述:{}", cronTrigger.getDescription());
			logger.info("CRON:{}", cronTrigger.getCronExpression());
		}
		return schedulerFactoryBean;
	}

	private List<Map<String,String>> autoQuartz;

	private CronTrigger[] getAutoConfigTrigger() {
		List<CronTrigger> triggerList = new ArrayList<>();
		if (autoQuartz == null) return new CronTrigger[0];
		for (Map<String, String> map : autoQuartz) {
			MethodInvokingJobDetailFactoryBean jobDetailFactoryBean = context.getBean(MethodInvokingJobDetailFactoryBean.class, map);
			CronTriggerFactoryBean cronTriggerFactoryBean = context.getBean(CronTriggerFactoryBean.class, jobDetailFactoryBean, map);
			triggerList.add(cronTriggerFactoryBean.getObject());
		}
		return triggerList.toArray(new CronTrigger[0]);
	}

	@Bean
	@Lazy
	@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public MethodInvokingJobDetailFactoryBean myMethodInvokingJobDetailFactoryBean(Map<String, String> map){
		MethodInvokingJobDetailFactoryBean bean = new MethodInvokingJobDetailFactoryBean ();
		bean.setConcurrent (false);
		bean.setTargetMethod("doMyJob");
		bean.setTargetBeanName(map.get("beanName"));
		bean.setName(map.get("beanName"));
		return bean;
	}

	@Bean
	@Lazy
	@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public CronTriggerFactoryBean myCronTriggerFactoryBean(MethodInvokingJobDetailFactoryBean jobDetailFactoryBean, Map<String, String> map){
		CronTriggerFactoryBean triggerFactory = new CronTriggerFactoryBean();
		triggerFactory.setJobDetail(jobDetailFactoryBean.getObject());
		triggerFactory.setCronExpression(map.get("cron"));
		triggerFactory.setDescription(map.getOrDefault("desc","缺少描述"));
		triggerFactory.setName(map.get("beanName"));
		return triggerFactory;
	}

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        taskRegistrar.setScheduler(Executors.newScheduledThreadPool(taskSchedulerPoolSize));
    }

	public int getTaskSchedulerPoolSize() {
		return taskSchedulerPoolSize;
	}

	public void setTaskSchedulerPoolSize(int taskSchedulerPoolSize) {
		this.taskSchedulerPoolSize = taskSchedulerPoolSize;
	}

	public List<Map<String, String>> getAutoQuartz() {
		return autoQuartz;
	}

	public void setAutoQuartz(List<Map<String, String>> autoQuartz) {
		this.autoQuartz = autoQuartz;
	}

}