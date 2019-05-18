package com.act.framework.web.conf.web;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.act.framework.basic.conf.json.FastJsonConfiguration;
import com.act.framework.web.conf.web.util.MyFastJsonHttpMessageConverter4;

/**
 * ClassName: HttpMessageConvertersConfig <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月19日 下午11:26:45 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Configuration
public class HttpMessageConvertersConfig {

	@Value("${spring.security.debug:false}")
	private Boolean debug;

	@Bean
	public HttpMessageConverters fastJsonHttpMessageConverters() throws ClassNotFoundException, IOException{
		MyFastJsonHttpMessageConverter4 fastConverter = new MyFastJsonHttpMessageConverter4();//2
		fastConverter.setDebug(debug);
		fastConverter.setFastJsonConfig(FastJsonConfiguration.getDefaultFastJsonConfig());
		return new HttpMessageConverters(fastConverter);
	}
}

