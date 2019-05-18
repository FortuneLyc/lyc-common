package com.act.framework.web.conf;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter;

import com.act.framework.web.conf.auth.*;
import com.act.framework.web.filter.MyFilterSecurityInterceptor;
import com.act.framework.web.filter.MySessionFilter;
import com.act.framework.web.security.MyFilterInvocationSecurityMetadataSource;
import com.act.framework.web.security.UnanimousDynamicAccessDecisionManager;
import com.act.framework.web.service.OperationLogService;

@Configuration
@EnableWebSecurity
@ConfigurationProperties(prefix="act.security")
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private OperationLogService operationLogService;
	@Autowired
	private UnanimousDynamicAccessDecisionManager unanimousDynamicAccessDecisionManager;
	public static final String username = "un";
	public static final String password = "pw";

	public WebSecurityConfig(){
		super(true);
	}

	@Value("${act.security.frameOptions:sameOrigin}")
	private String frameOptions;
	
	@Value("${act.security.logoutSuccessUrl:/login?logout}")
	private String logoutSuccessUrl;
	
	//授信白名单IP信息
	@Value("${act.security.filter.ipHost:}")
	private String ipHost;

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable()
        	.addFilter(new WebAsyncManagerIntegrationFilter())
        	.addFilterAt(myFilterSecurityInterceptor(), FilterSecurityInterceptor.class)
			.addFilterAfter(new MySessionFilter("/login"), FilterSecurityInterceptor.class)
            .formLogin()
            	.usernameParameter(username)
            	.passwordParameter(password)
            	.loginPage("/login")
    	        .loginProcessingUrl("/auth")
    	        .failureHandler(new MyAuthenticationFailureHandler("/login?failure",operationLogService,ipHost))
    	        .successHandler(MyAuthenticationSuccessHandler())
				.authenticationDetailsSource(new CustomAuthenticationDetailsSource())
        		.and()
            .logout()
            	.logoutUrl("/logout")
            	.logoutSuccessUrl(logoutSuccessUrl)
            	.addLogoutHandler(new MyLogoutHandler(operationLogService))
                .and()
            .exceptionHandling()
            	.authenticationEntryPoint(new MyAuthenticationEntryPoint("/login",true))
            	.and()
    		.headers().and()
    		.sessionManagement().invalidSessionUrl("/login").and()
    		.securityContext().and()
    		.requestCache().and()
    		.anonymous().and()
    		.servletApi().and()
            ;
        switch (frameOptions) {
			case "disable":
				http.headers().frameOptions().disable();
				break;
			case "deny":
				http.headers().frameOptions().deny();
				break;
			case "sameOrigin":
				http.headers().frameOptions().sameOrigin();
				break;
			default:
				http.headers().frameOptions().sameOrigin();
		}


    }

    @Override
	public void configure(WebSecurity web) throws Exception {
//    	web.ignoring()
//    		.antMatchers("/logout","/login","/auth","/img/**","/assets/**","/**.js","/**.png","/**.jpg","/favicon.ico")
//    		.and()
//    	;
	}

	@Value("${act.security.alwaysUseDefaultTargetUrl:true}")
	private boolean alwaysUseDefaultTargetUrl;

	private Map<String, String> targetUrlMap;

	@Bean
	public AuthenticationSuccessHandler MyAuthenticationSuccessHandler(){
    	MyAuthenticationSuccessHandler handler = new MyAuthenticationSuccessHandler(targetUrlMap);
		handler.setDefaultTargetUrl("/");
		handler.setTargetUrlParameter("welcomePage");
		handler.setAlwaysUseDefaultTargetUrl(alwaysUseDefaultTargetUrl);
		return handler;
    }

    @Bean
    public AuthenticationProvider myAuthenticationProvider(){
    	return new MyAuthenticationProvider();
    }

    @Bean
    public MyFilterInvocationSecurityMetadataSource myFilterInvocationSecurityMetadataSource(){
    	return new MyFilterInvocationSecurityMetadataSource();
    }

    @Bean
    public FilterSecurityInterceptor myFilterSecurityInterceptor() throws Exception{
    	MyFilterSecurityInterceptor filter = new MyFilterSecurityInterceptor();
    	filter.setAccessDecisionManager(unanimousDynamicAccessDecisionManager);
    	filter.setAuthenticationManager(new ProviderManager(Collections.singletonList(myAuthenticationProvider())));
    	filter.setSecurityMetadataSource(myFilterInvocationSecurityMetadataSource());
    	filter.setIpHost(ipHost);
    	filter.afterPropertiesSet();
    	return filter;
    }

	public Map<String, String> getTargetUrlMap() {
		return targetUrlMap;
	}

	public void setTargetUrlMap(Map<String, String> targetUrlMap) {
		this.targetUrlMap = targetUrlMap;
	}


}