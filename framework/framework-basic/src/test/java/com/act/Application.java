package com.act;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;

/**
 * ClassName:Application <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月10日 下午2:11:46 <br/>
 * @author   lyc
 * @version
 * @see
 */
@SpringBootApplication(scanBasePackages={"com.act"},exclude={JacksonAutoConfiguration.class})
@EnableCaching
public class Application {
	public static void main(String[] args) throws Throwable {
        SpringApplication.run(Application.class, args);
    }
}

