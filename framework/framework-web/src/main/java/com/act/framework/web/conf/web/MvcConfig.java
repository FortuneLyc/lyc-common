package com.act.framework.web.conf.web;

import com.act.common.spring.web.StringToDateConverter;
import com.act.common.spring.web.StringToLongEnumConverterFactory;
import com.act.common.spring.web.StringToStringEnumConverterFactory;
import com.act.framework.web.conf.web.util.MyRequestMappingHandlerMapping;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.boot.autoconfigure.condition.*;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.boot.autoconfigure.web.*;
import org.springframework.boot.autoconfigure.web.ResourceProperties.Strategy;
import org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.filter.OrderedHiddenHttpMethodFilter;
import org.springframework.boot.web.servlet.filter.OrderedRequestContextFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.core.Ordered;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.GenericConverter;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.validation.DefaultMessageCodesResolver;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.filter.HttpPutFormContentFilter;
import org.springframework.web.filter.RequestContextFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.handler.SimpleUrlHandlerMapping;
import org.springframework.web.servlet.i18n.FixedLocaleResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.resource.AppCacheManifestTransformer;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;
import org.springframework.web.servlet.resource.ResourceResolver;
import org.springframework.web.servlet.resource.VersionResourceResolver;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.Servlet;
import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.Map.Entry;

@Configuration
@ConditionalOnWebApplication
@ConditionalOnClass({ Servlet.class, DispatcherServlet.class, WebMvcConfigurerAdapter.class })
@ConditionalOnMissingBean(WebMvcConfigurationSupport.class)
@AutoConfigureOrder(Ordered.HIGHEST_PRECEDENCE + 10)
@AutoConfigureAfter(DispatcherServletAutoConfiguration.class)
public class MvcConfig {

	public static String DEFAULT_PREFIX = "";

	public static String DEFAULT_SUFFIX = "";

	@Bean
	@ConditionalOnMissingBean(HiddenHttpMethodFilter.class)
	public OrderedHiddenHttpMethodFilter hiddenHttpMethodFilter() {
		return new OrderedHiddenHttpMethodFilter();
	}

	// Defined as a nested config to ensure WebMvcConfigurerAdapter is not read when not
	// on the classpath
	@Configuration
	@Import(EnableWebMvcConfiguration.class)
	@EnableConfigurationProperties({ WebMvcProperties.class, ResourceProperties.class })
	public static class WebMvcAutoConfigurationAdapter implements WebMvcConfigurer  {

		private static final Log logger = LogFactory.getLog(WebMvcConfigurer .class);

		@Autowired
		private ResourceProperties resourceProperties = new ResourceProperties();

		@Autowired
		private WebMvcProperties mvcProperties = new WebMvcProperties();

		@Autowired
		private ListableBeanFactory beanFactory;

		@Autowired
		private HttpMessageConverters messageConverters;

		@Autowired(required = false)
		ResourceHandlerRegistrationCustomizer resourceHandlerRegistrationCustomizer;

		@Override
		public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
			converters.addAll(this.messageConverters.getConverters());
		}

		@Override
		public void configureAsyncSupport(AsyncSupportConfigurer configurer) {
			Duration timeout = this.mvcProperties.getAsync().getRequestTimeout();
			if (timeout != null) {
				configurer.setDefaultTimeout(timeout.toMillis());
			}
		}

//		@Override
//		public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
//			Map<String, MediaType> mediaTypes = this.mvcProperties.getMediaTypes();
//			for (Entry<String, MediaType> mediaType : mediaTypes.entrySet()) {
//				configurer.mediaType(mediaType.getKey(), mediaType.getValue());
//			}
//		}

		@Bean
		@ConditionalOnMissingBean
		public InternalResourceViewResolver defaultViewResolver() {
			InternalResourceViewResolver resolver = new InternalResourceViewResolver();
			resolver.setPrefix(this.mvcProperties.getView().getPrefix());
			resolver.setSuffix(this.mvcProperties.getView().getSuffix());
			return resolver;
		}

		@Bean
		@ConditionalOnMissingBean({ RequestContextListener.class,
				RequestContextFilter.class })
		public RequestContextFilter requestContextFilter() {
			return new OrderedRequestContextFilter();
		}

		@Bean
		@ConditionalOnBean(View.class)
		@ConditionalOnMissingBean
		public BeanNameViewResolver beanNameViewResolver() {
			BeanNameViewResolver resolver = new BeanNameViewResolver();
			resolver.setOrder(Ordered.LOWEST_PRECEDENCE - 10);
			return resolver;
		}

		@Bean
		@ConditionalOnBean(ViewResolver.class)
		@ConditionalOnMissingBean(name = "viewResolver", value = ContentNegotiatingViewResolver.class)
		public ContentNegotiatingViewResolver viewResolver(BeanFactory beanFactory) {
			ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
			resolver.setContentNegotiationManager(
					beanFactory.getBean(ContentNegotiationManager.class));
			// ContentNegotiatingViewResolver uses all the other view resolvers to locate
			// a view so it should have a high precedence
			resolver.setOrder(Ordered.HIGHEST_PRECEDENCE);
			return resolver;
		}

		@Bean
		@ConditionalOnMissingBean
		@ConditionalOnProperty(prefix = "spring.mvc", name = "locale")
		public LocaleResolver localeResolver() {
			return new FixedLocaleResolver(this.mvcProperties.getLocale());
		}

		@Bean
		@ConditionalOnProperty(prefix = "spring.mvc", name = "date-format")
		public Formatter<Date> dateFormatter() {
			return new DateFormatter(this.mvcProperties.getDateFormat());
		}

		@Override
		public MessageCodesResolver getMessageCodesResolver() {
			if (this.mvcProperties.getMessageCodesResolverFormat() != null) {
				DefaultMessageCodesResolver resolver = new DefaultMessageCodesResolver();
				resolver.setMessageCodeFormatter(
						this.mvcProperties.getMessageCodesResolverFormat());
				return resolver;
			}
			return null;
		}

		@Override
		public void addFormatters(FormatterRegistry registry) {
			for (Converter<?, ?> converter : getBeansOfType(Converter.class)) {
				registry.addConverter(converter);
			}
			for (GenericConverter converter : getBeansOfType(GenericConverter.class)) {
				registry.addConverter(converter);
			}
			for (Formatter<?> formatter : getBeansOfType(Formatter.class)) {
				registry.addFormatter(formatter);
			}
		}

		private <T> Collection<T> getBeansOfType(Class<T> type) {
			return this.beanFactory.getBeansOfType(type).values();
		}

		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			if (!this.resourceProperties.isAddMappings()) {
				logger.debug("Default resource handling disabled");
				return;
			}
			Duration cachePeriod = this.resourceProperties.getCache().getPeriod();
			if (!registry.hasMappingForPattern("/webjars/**")) {
				customizeResourceHandlerRegistration(
						registry.addResourceHandler("/webjars/**")
								.addResourceLocations(
										"classpath:/META-INF/resources/webjars/")
						.setCachePeriod(Integer.parseInt(cachePeriod.getSeconds() + "")));
			}
			String staticPathPattern = this.mvcProperties.getStaticPathPattern();
			if (!registry.hasMappingForPattern(staticPathPattern)) {
				customizeResourceHandlerRegistration(
						registry.addResourceHandler(staticPathPattern)
								.addResourceLocations(
										this.resourceProperties.getStaticLocations())
						.setCachePeriod(Integer.parseInt(cachePeriod.getSeconds() + "")));
			}
		}

		private void customizeResourceHandlerRegistration(
				ResourceHandlerRegistration registration) {
			if (this.resourceHandlerRegistrationCustomizer != null) {
				this.resourceHandlerRegistrationCustomizer.customize(registration);
			}

		}

//		@Override
//		public void addViewControllers(ViewControllerRegistry registry) {
//			Resource page = this.resourceProperties.getWelcomePage();
//			if (page != null) {
//				logger.info("Adding welcome page: " + page);
//				registry.addViewController("/").setViewName("forward:index.html");
//			}
//		}

		@Configuration
		@ConditionalOnProperty(value = "spring.mvc.favicon.enabled", matchIfMissing = false)
		public static class FaviconConfiguration {

//			@Autowired
//			private ResourceProperties resourceProperties = new ResourceProperties();

			@Bean
			public SimpleUrlHandlerMapping faviconHandlerMapping() {
				SimpleUrlHandlerMapping mapping = new SimpleUrlHandlerMapping();
				mapping.setOrder(Ordered.HIGHEST_PRECEDENCE + 1);
				mapping.setUrlMap(Collections.singletonMap("**/favicon.ico",
						faviconRequestHandler()));
				return mapping;
			}

			@Bean
			public ResourceHttpRequestHandler faviconRequestHandler() {
				ResourceHttpRequestHandler requestHandler = new ResourceHttpRequestHandler();

				List<Resource> locations = new ArrayList<Resource>();
				locations.add(new ClassPathResource("/"));
				requestHandler.setLocations(Collections.unmodifiableList(locations));
//				requestHandler.setLocations(this.resourceProperties.getFaviconLocations());
				return requestHandler;
			}

		}

	}

	/**
	 * Configuration equivalent to {@code @EnableWebMvc}.
	 */
	@Configuration
	public static class EnableWebMvcConfiguration extends DelegatingWebMvcConfiguration {

		@Autowired(required = false)
		private WebMvcProperties mvcProperties;

		@Autowired
		private ListableBeanFactory beanFactory;
//====================================================================================
		// TAG 用于eclipse定位
		/**
		 * 我加上去的
		 *
		 * @return
		 * @see org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport#createRequestMappingHandlerMapping()
		 */
		@Override
		protected RequestMappingHandlerMapping createRequestMappingHandlerMapping() {
			return new MyRequestMappingHandlerMapping();
		}

		@Override
		public void configurePathMatch(PathMatchConfigurer configurer) {
			configurer.setUseSuffixPatternMatch(false);
			super.configurePathMatch(configurer);
		}

		@Value("${act.isCors:false}")
		private Boolean isCors;
		@Value("${act.allowedOrigins:*}")
		private String allowedOrigins;
		/**
		 * 跨域支持
		 *
		 * @param registry
		 * @see org.springframework.web.servlet.config.annotation.DelegatingWebMvcConfiguration#addCorsMappings(org.springframework.web.servlet.config.annotation.CorsRegistry)
		 */
		@Override
		public void addCorsMappings(CorsRegistry registry) {
			if(isCors){
				String[] origins = allowedOrigins.split("\\|");
				registry.addMapping("/**").allowedOrigins(origins);
			}

			super.addCorsMappings(registry);
		}

		@Override
	    public void addViewControllers(ViewControllerRegistry registry) {
	        registry.addViewController("/").setViewName("index");
	        super.addViewControllers(registry);
	    }

		@Value("${spring.resources.staticLocations:classpath:/webapp/}")
		private String resourceLocations;

		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
		    registry.addResourceHandler("/**").addResourceLocations(resourceLocations);
//			registry.addResourceHandler("/css/**")
//		            .addResourceLocations("classpath:/webapp/css/");
//		    registry.addResourceHandler("/img/**")
//		    .addResourceLocations("classpath:/templates/img/");
//		    registry.addResourceHandler("/js/**")
//		    .addResourceLocations("classpath:/templates/js/");
		}

		/**
		 * {@inheritDoc}
		 */
		@Override
		public void addFormatters(FormatterRegistry registry) {
			String[] INPUT_FORMATS = { "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd" };
			registry.addConverter(new StringToDateConverter(INPUT_FORMATS));
			registry.addConverterFactory(new StringToLongEnumConverterFactory());
			registry.addConverterFactory(new StringToStringEnumConverterFactory());
			super.addFormatters(registry);
		}

		@Override
		protected void addInterceptors(InterceptorRegistry registry) {
			super.addInterceptors(registry);
		}
		@Override
		protected void configureMessageConverters(List<HttpMessageConverter<?>> converters) {

			super.configureMessageConverters(converters);
		}
//====================================================================================

		@Bean
		@Override
		public RequestMappingHandlerAdapter requestMappingHandlerAdapter() {
			RequestMappingHandlerAdapter adapter = super.requestMappingHandlerAdapter();
			adapter.setIgnoreDefaultModelOnRedirect(this.mvcProperties == null ? true
					: this.mvcProperties.isIgnoreDefaultModelOnRedirect());
			return adapter;
		}

		@Bean
		@Primary
		@Override
		public RequestMappingHandlerMapping requestMappingHandlerMapping() {
			// Must be @Primary for MvcUriComponentsBuilder to work
			return super.requestMappingHandlerMapping();
		}

		@Override
		protected ConfigurableWebBindingInitializer getConfigurableWebBindingInitializer() {
			try {
				return this.beanFactory.getBean(ConfigurableWebBindingInitializer.class);
			}
			catch (NoSuchBeanDefinitionException ex) {
				return super.getConfigurableWebBindingInitializer();
			}
		}

	}

	@Configuration
	@ConditionalOnEnabledResourceChain
	static class ResourceChainCustomizerConfiguration {

		@Bean
		public ResourceChainResourceHandlerRegistrationCustomizer resourceHandlerRegistrationCustomizer() {
			return new ResourceChainResourceHandlerRegistrationCustomizer();
		}

	}

	interface ResourceHandlerRegistrationCustomizer {

		void customize(ResourceHandlerRegistration registration);

	}

	private static class ResourceChainResourceHandlerRegistrationCustomizer
			implements ResourceHandlerRegistrationCustomizer {

		@Autowired
		private ResourceProperties resourceProperties = new ResourceProperties();

		@Override
		public void customize(ResourceHandlerRegistration registration) {
			ResourceProperties.Chain properties = this.resourceProperties.getChain();
			configureResourceChain(properties,
					registration.resourceChain(properties.isCache()));
		}

		private void configureResourceChain(ResourceProperties.Chain properties,
				ResourceChainRegistration chain) {
			Strategy strategy = properties.getStrategy();
			if (strategy.getFixed().isEnabled() || strategy.getContent().isEnabled()) {
				chain.addResolver(getVersionResourceResolver(strategy));
			}
			if (properties.isHtmlApplicationCache()) {
				chain.addTransformer(new AppCacheManifestTransformer());
			}
		}

		private ResourceResolver getVersionResourceResolver(
				ResourceProperties.Strategy properties) {
			VersionResourceResolver resolver = new VersionResourceResolver();
			if (properties.getFixed().isEnabled()) {
				String version = properties.getFixed().getVersion();
				String[] paths = properties.getFixed().getPaths();
				resolver.addFixedVersionStrategy(version, paths);
			}
			if (properties.getContent().isEnabled()) {
				String[] paths = properties.getContent().getPaths();
				resolver.addContentVersionStrategy(paths);
			}
			return resolver;
		}

	}

}