package com.act.framework.web.conf;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.function.Predicate;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.Api;
import com.act.framework.web.service.ApiService;

@Configuration
public class ApiInitConfig {

	@Autowired
	private RequestMappingHandlerMapping myRequestMappingHandlerMapping;
	@Autowired
	private ApiService apiService;

	@PostConstruct
	private void init(){
		Map<RequestMappingInfo, HandlerMethod>  map = myRequestMappingHandlerMapping.getHandlerMethods();
		Set<String> allPatterns = new HashSet<>();
		for (Entry<RequestMappingInfo, HandlerMethod> entry : map.entrySet()) {
			Set<String> patterns = entry.getKey().getPatternsCondition().getPatterns();
			patterns.forEach(apiStr -> {
				Api entity = new Api();
				entity.setUrl(apiStr);
				Api api = apiService.selectOne(entity);
				if (api!=null && Boolean.FALSE.equals(api.getIsEnable())) {
					api.setIsEnable(true);
					apiService.updateById(api);
					return;
				}
				if (api == null) {
					entity.setIsEnable(true);
					ControllerLog controllerLog = entry.getValue().getMethodAnnotation(ControllerLog.class);
					if (controllerLog==null || StringUtils.isBlank(controllerLog.format())) {
						entity.setRemark(apiStr);
					}else{
						entity.setRemark(controllerLog.format());
					}
					apiService.insert(entity);
				}
			});
			allPatterns.addAll(patterns);
		}
//		map.keySet().forEach(mappingInfo -> {
//
//		});

		List<Api> apiList = apiService.selectAll(null);
		apiList.removeIf(new Predicate<Api>() {
			@Override
			public boolean test(Api a) {
				if (allPatterns.contains(a.getUrl())) {
					return true;
				}
				return false;
			}
		});
		for (Api api : apiList) {
			api.setIsEnable(false);
			apiService.updateById(api);
		}
	}

}