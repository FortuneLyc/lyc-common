/**
 * Project Name:web-framework-base
 * File Name:MyUrlMethodNameResolver.java
 * Package Name:com.act.framework.web.base.conf.web.util
 * Date:2016年10月22日下午3:47:17
 *
*/

package com.act.framework.web.conf.web.util;

import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotatedElementUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.condition.RequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

/**
 * ClassName:MyUrlMethodNameResolver <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月22日 下午3:47:17 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class MyRequestMappingHandlerMapping extends RequestMappingHandlerMapping {
	private final Logger log = LoggerFactory.getLogger(getClass());
	/**
	 * Uses method and type-level @{@link RequestMapping} annotations to create
	 * the RequestMappingInfo.
	 * @return the created RequestMappingInfo, or {@code null} if the method
	 * does not have a {@code @RequestMapping} annotation.
	 * @see #getCustomMethodCondition(Method)
	 * @see #getCustomTypeCondition(Class)
	 */
	@Override
	protected RequestMappingInfo getMappingForMethod(Method method, Class<?> handlerType) {
		if (isNotMyType(handlerType)) {
			return super.getMappingForMethod(method, handlerType);
		}

		RequestMappingInfo info = createRequestMappingInfo(method,new String[]{method.getName()});
		if (info != null) {
			RequestMappingInfo typeInfo = createRequestMappingInfo(handlerType,getPackageBasedMapping(handlerType));
			if (typeInfo != null) {
				info = typeInfo.combine(info);
			}
		}
		return info;
	}

	private boolean isNotMyType(Class<?> handlerType) {
		return !StringUtils.startsWithAny(handlerType.getPackage().getName(), frameworkPackagePrefixs);
	}

	private String[] getPackageBasedMapping(Class<?> handlerType) {

		String[] beanNames = getWebApplicationContext().getBeanNamesForType(handlerType);
		List<String> mappings = new ArrayList<String>();
		for (String beanName : beanNames) {
			mappings.add(buildUrlForHandler(beanName,handlerType));
		}
		return mappings.toArray(new String[]{});
	}


	private String[] illegalBusinessName = {"com","act","ctrl","Controller"};
	private String[] frameworkPackagePrefixs = {"com.act."};
	private String[] frameworkPackageSuffixs = {".ctrl"};
	private String[] beanNameSuffixs = {"Ctrl","Controller"};

	private String buildUrlForHandler(String beanName, Class<?> beanClass){
		if (!isEligibleForMapping(beanName, beanClass)) {
			return "";
		}
		String beanPackage = beanClass.getPackage().getName();
		String businessName = StringUtils.substringAfter(StringUtils.substringAfter(StringUtils.substringBeforeLast(beanPackage, "."), "."), ".");
		businessName = businessName.replaceAll("\\.", "\\/");
		if (StringUtils.isBlank(businessName) || StringUtils.containsAny(businessName, illegalBusinessName)) {
			log.warn("{} 的业务名: {} 不符合要求，不应该为空也不应该为:{}",beanName,businessName,StringUtils.join(illegalBusinessName, ";"));
			return null;
		}
		String modelName = beanName;
		for (String beanNameSuffix : beanNameSuffixs) {
			modelName = StringUtils.substringBeforeLast(modelName, beanNameSuffix);
		}

		return "/" + businessName + "/" + StringUtils.uncapitalize(modelName);

	}

	private boolean isEligibleForMapping(String beanName, Class<?> beanClass) {
		if (beanClass == null) {
			return false;
		}
		if (!StringUtils.endsWithAny(beanName, beanNameSuffixs)) {
			log.warn("{} 不以 {} 结尾，被排除",beanName,StringUtils.join(beanNameSuffixs, ";"));
			return false;
		}
		if (StringUtils.indexOfAny(beanName, beanNameSuffixs)==0) {
			log.warn("{} 不应该以 {} 开头，被排除",beanName,StringUtils.join(beanNameSuffixs, ";"));
			return false;
		}
		String packageName = beanClass.getPackage().getName();
		if (!StringUtils.startsWithAny(packageName, frameworkPackagePrefixs)) {
			log.warn("{} 包路径不以 {} 开头，被排除",beanName,StringUtils.join(frameworkPackagePrefixs, ";"));
			return false;
		}
		if (!StringUtils.endsWithAny(packageName, frameworkPackageSuffixs)) {
			log.warn("{} 包路径不以 {} 结尾. 被排除.",beanName,StringUtils.join(frameworkPackageSuffixs, ";"));
			return false;
		}
		return true;
	}

	/**
	 * Delegates to {@link #createRequestMappingInfo(RequestMapping, RequestCondition)},
	 * supplying the appropriate custom {@link RequestCondition} depending on whether
	 * the supplied {@code annotatedElement} is a class or method.
	 * @param string
	 * @see #getCustomTypeCondition(Class)
	 * @see #getCustomMethodCondition(Method)
	 */
	private RequestMappingInfo createRequestMappingInfo(AnnotatedElement element, String[] defaultNames) {
		RequestMapping requestMapping = AnnotatedElementUtils.findMergedAnnotation(element, RequestMapping.class);
		RequestCondition<?> condition = (element instanceof Class<?> ?
				getCustomTypeCondition((Class<?>) element) : getCustomMethodCondition((Method) element));

		if (requestMapping==null) {
			log.debug("{} 没有注解RequestMapping,不被加入Mapping", element);
			return null;
		}
		if (requestMapping.path()==null||requestMapping.path().length==0) {
			return createRequestMappingInfo(requestMapping, condition, defaultNames);
		}
		return createRequestMappingInfo(requestMapping, condition);
	}


	private RequestMappingInfo createRequestMappingInfo(RequestMapping requestMapping, RequestCondition<?> customCondition,
			String[] defaultNames) {

		return RequestMappingInfo
				.paths(resolveEmbeddedValuesInPatterns(defaultNames))
				.methods(requestMapping.method())
				.params(requestMapping.params())
				.headers(requestMapping.headers())
				.consumes(requestMapping.consumes())
				.produces(requestMapping.produces())
				.mappingName(requestMapping.name())
				.customCondition(customCondition)
				.options(this.config)
				.build();

	}


	private RequestMappingInfo.BuilderConfiguration config = new RequestMappingInfo.BuilderConfiguration();
	@Override
	public void afterPropertiesSet() {
		this.config = new RequestMappingInfo.BuilderConfiguration();
		this.config.setUrlPathHelper(getUrlPathHelper());
		this.config.setPathMatcher(getPathMatcher());
		this.config.setSuffixPatternMatch(useSuffixPatternMatch());
		this.config.setTrailingSlashMatch(useTrailingSlashMatch());
		this.config.setRegisteredSuffixPatternMatch(useRegisteredSuffixPatternMatch());
		this.config.setContentNegotiationManager(getContentNegotiationManager());

		super.afterPropertiesSet();
	}

}

