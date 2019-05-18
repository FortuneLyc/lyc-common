/**
 * Project Name:web-framework-base
 * File Name:MyBatisConfig.java
 * Package Name:com.act.framework.basic.conf
 * Date:2016年10月19日下午12:06:18
 *
*/

package com.act.framework.basic.conf.db;

import java.util.Properties;

import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import com.act.framework.basic.conf.db.util.SequenceProvider;
import com.act.framework.basic.service.SingleTableMapper;

/**
 *
 * ClassName: MyBatisMapperScannerConfig <br/>
 * Function: <br/>
 * date: 2016年10月21日 上午11:26:50 <br/>
 * @author lyc
 * @version
 */
@Configuration
@AutoConfigureAfter(MyBatisConfig.class)
public class MyBatisMapperScannerConfig implements EnvironmentAware{

	private Environment environment;
    @Bean
    public tk.mybatis.spring.mapper.MapperScannerConfigurer mapperScannerConfigurer() throws Exception {
    	String identity = environment.getProperty("spring.datasource.identity");
    	tk.mybatis.spring.mapper.MapperScannerConfigurer mapperScannerConfigurer = new tk.mybatis.spring.mapper.MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
        mapperScannerConfigurer.setBasePackage("com.act.**.dao,com.surfilter.**.dao");
        Properties properties = new Properties();
        properties.setProperty("mappers", SingleTableMapper.class.getPackage().getName()+"."+SingleTableMapper.class.getSimpleName());
        properties.setProperty("notEmpty", "true"); // insert和update中，是否判断字符串类型!=''，少数方法会用到

        // https://git.oschina.net/free/Mapper/blob/master/wiki/mapper3/2.Integration.md
        // https://git.oschina.net/free/Mapper/blob/master/wiki/mapper3/10.Mapper-UUID.md
        if ("ORACLE".equalsIgnoreCase(identity)) {
        	properties.setProperty("IDENTITY", SequenceProvider.DEFAULT_SEQUENCE_SQL_TEMPLATE);
        	properties.setProperty("ORDER", "BEFORE");
		}else if ("MYSQL".equalsIgnoreCase(identity)){
			properties.setProperty("IDENTITY", "MYSQL");
		}else if ("POSTGRE".equalsIgnoreCase(identity)){
            properties.setProperty("IDENTITY", SequenceProvider.DEFAULT_SEQUENCE_SQL_TEMPLATE_PG);
            properties.setProperty("ORDER", "BEFORE");
        }else{
			properties.setProperty("IDENTITY", identity);
		}

        mapperScannerConfigurer.setProperties(properties);
//        mapperScannerConfigurer.setMarkerInterface(SingleTableMapper.class); // 这样会导致未继承SingleTableMapper的接口无法实例化
    	return mapperScannerConfigurer;
    }

    @Override
    public void setEnvironment(final Environment environment) {
        this.environment = environment;
    }

}

