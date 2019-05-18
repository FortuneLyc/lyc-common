
package com.act.framework.web.aop.mvclog;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.*;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.act.common.net.utils.IPUtils;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.utils.JsonUtils;
import com.act.framework.web.model.OperationLog;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.model.enums.SystemUserType;
import com.act.framework.web.service.OperationLogService;
import com.act.framework.web.utils.SecurityUtils;
import com.act.framework.workflow.ctrl.WfApi;

/**
 * ClassName: ControllerLogAspect <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年11月17日 下午2:22:50 <br/>
 * @author   "zhangpeng"
 * @since    JDK 1.8
 */
@Aspect
@Component
public class ControllerLogAspect {
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private OperationLogService operationLogService;

	@Value("${spring.operationLog.logTypes:Select,Insert,Delete,Update,Loggin,Logout,Other}")
	private String logTypes;

	private Set<LogType> logTypeSet = EnumSet.of(LogType.Select, LogType.Insert, LogType.Delete, LogType.Update, LogType.Loggin, LogType.Logout, LogType.Other);

	@PostConstruct
	private void init(){
		String[] logTypesArr = logTypes.split(",");
		Set<LogType> s = new HashSet<>();
		for (String logTypes : logTypesArr) {
			s.add(LogType.valueOf(logTypes));
		}
		logTypeSet = EnumSet.copyOf(s);
	}

	/**
	 *
	 * controllerAspect: Controller层切点. <br/>
	 * <br/>
	 * @author "zhangpeng"
	 * @since JDK 1.8
	 */
    @Pointcut("@annotation(com.act.framework.web.aop.mvclog.ControllerLog)")
	public void controllerAspect() {}

	@Around("controllerAspect()")
	public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
		long begin = System.currentTimeMillis();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		SystemUser user = SecurityUtils.getUserFromRequest(request);
		OperationLog log = new OperationLog();
		Object o = null;
		try {
			MethodSignature signature = (MethodSignature) joinPoint.getSignature();

			Class<?> targetClazz = joinPoint.getTarget().getClass();
			Method targetMethod = signature.getMethod();
			ControllerLog clazzAnno = targetClazz.getAnnotation(ControllerLog.class);
			ControllerLog methodAnno = targetMethod.getAnnotation(ControllerLog.class);

			String module; // 模块
			String action; // 动作
			LogType logType; // 动作类型
			if (clazzAnno != null) {
				module = clazzAnno.format();
			} else {
				module = targetClazz.getSimpleName();
			}
			if (methodAnno != null) {
				action = methodAnno.format();
				logType = methodAnno.type();
			} else {
				action = targetMethod.getName();
				logType = LogType.Other;
			}
			log.setLogType(logType);

			if (!logTypeSet.contains(logType) || LogType.None.equals(logType) || SystemUserType.super_admin.equals(user.getSystemUserType())) { // 只记录需要记录的日志
				o = joinPoint.proceed();
				return o;
			}

			StringBuilder sb = new StringBuilder("使用【");
			sb.append(module).append("】模块，执行【").append(action).append("】操作");
			List<String> parameterDescList = getParameterDescList(targetMethod, joinPoint);
			if (parameterDescList.size() == 0) {
				sb.append("，无参数");
			} else {
				sb.append("，使用");
				for (String paraStr : parameterDescList) {
					sb.append("【").append(paraStr).append("】");
				}
			}

			log.setMessage(sb.toString());


		} finally {
			try {
				if (o == null){
					o = joinPoint.proceed();
				}
			} finally {
				if (!SystemUserType.super_admin.equals(user.getSystemUserType())){
					long end = System.currentTimeMillis();
					log.setUsername(user.getUsername());
					log.setIp(IPUtils.getRemoteIp(request));
					String api = request.getRequestURI();
					log.setApi(api);
					log.setMenuPath(SecurityUtils.getMenuCode(request));
					try {
						log.setRouterPath(api.substring(1,api.indexOf("/", 1)));
					} catch (Exception ignore){
					}
					log.setProceedTime(end - begin);
					log.setTime(new Date());
					operationLogService.addLog(log);
				}
			}
		}
		return o;
	}


	private List<String> getParameterDescList(Method targetMethod, JoinPoint joinPoint) {
		WfApi wfApi = targetMethod.getAnnotation(WfApi.class);
		if (wfApi == null) {
			return getNormalParameterDescList(targetMethod, joinPoint);
		} else {
//			return getWfParameterDescList(targetMethod, joinPoint); //TODO
			return getNormalParameterDescList(targetMethod, joinPoint);
		}
	}

	/**
	 *
	 * getWfParameterDescList: 处理工作流的日志 TODO. <br/>
	 * <br/>
	 * @author "zhangpeng"
	 * @since JDK 1.7
	 */
	/*private List<String> getWfParameterDescList(Method targetMethod, JoinPoint joinPoint) {
		Parameter[] pArr = targetMethod.getParameters();
		Object[] args = joinPoint.getArgs();
		List<String> result = new ArrayList<>();
		for (int i = 0; i < pArr.length; i++) {
			Parameter p = pArr[i];
			if (p.isAnnotationPresent(RequestParam.class)) {
				String param = "表单参数" + p.getAnnotation(RequestParam.class).name();
				if (args[i]!=null && args[i].getClass().isArray()) {
					result.add(param + ":" + ArrayUtils.toString(args[i], "null"));
				} else {
					result.add(param + ":" + args[i]);
				}
			}
			if (p.isAnnotationPresent(RequestBody.class)) {
				String search = JsonUtils.toJson(args[i]);
				result.add("JSON查询参数 " + (search.equals("null") || search.equals("{}") ? "空" : search));
				if (args[i] instanceof IBaseEntity) {
					String page = JsonUtils.toJson(((IBaseEntity)args[i]).getBaseEntity());
					result.add("JSON分页参数 " + (page.equals("null") || page.equals("{}") ? "空" : page));
				}
			}
		}
		return result;
	}*/

	private List<String> getNormalParameterDescList(Method targetMethod, JoinPoint joinPoint) {
		Parameter[] pArr = targetMethod.getParameters();
		Object[] args = joinPoint.getArgs();
		List<String> result = new ArrayList<>();
		for (int i = 0; i < pArr.length; i++) {
			Parameter p = pArr[i];
			if (p.isAnnotationPresent(RequestParam.class)) {
				String param = "表单参数" + p.getAnnotation(RequestParam.class).name();
				if (args[i]!=null && args[i].getClass().isArray()) {
					result.add(param + ":" + ArrayUtils.toString(args[i], "null"));
				} else {
					result.add(param + ":" + args[i]);
				}
			}
			if (p.isAnnotationPresent(RequestBody.class)) {
				String search = JsonUtils.toJson(args[i]);
				result.add("JSON查询参数 " + (search.equals("null") || search.equals("{}") ? "空" : search));
				if (args[i] instanceof IBaseEntity) {
					String page = JsonUtils.toJson(((IBaseEntity)args[i]).getBaseEntity());
					result.add("JSON分页参数 " + (page.equals("null") || page.equals("{}") ? "空" : page));
				}
			}
		}
		return result;
	}


}

