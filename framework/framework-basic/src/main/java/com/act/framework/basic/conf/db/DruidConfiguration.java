/**
 * Project Name:web-framework-base
 * File Name:MyBatisConfig.java
 * Package Name:com.act.framework.basic.conf
 * Date:2016年10月19日下午12:06:18
 *
*/

package com.act.framework.basic.conf.db;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.filter.logging.Log4jFilter;
import com.alibaba.druid.filter.logging.LogFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;

/**
 * ClassName:MyBatisConfig <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月19日 下午12:06:18 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Configuration
public class DruidConfiguration {

	@Bean
	public DataSource druidDataSource(@Value("${spring.datasource.driverClassName}") String driver,
			@Value("${spring.datasource.url}") String url,
			@Value("${spring.datasource.username}") String username,
			@Value("${spring.datasource.password}") String password,
			@Value("${spring.datasource.needSql}") Boolean needSql,
			@Value("${spring.datasource.removeAbandoned}") Boolean removeAbandoned,
			@Value("${spring.datasource.needWeb}") Boolean needWeb,
			@Value("${spring.datasource.filters}") String filters,
			@Value("${spring.datasource.validationQuery}") String validationQuery
			) throws SQLException {

		DruidDataSource druidDataSource = new DruidDataSource();
		druidDataSource.setDriverClassName(driver);
		druidDataSource.setUrl(url);
		druidDataSource.setUsername(username);
		druidDataSource.setPassword(password);
		druidDataSource.setValidationQuery(validationQuery);
		druidDataSource.setMaxActive(20);
		druidDataSource.setMinIdle(2);
		druidDataSource.setInitialSize(5);
		druidDataSource.setTimeBetweenEvictionRunsMillis(60000);
		druidDataSource.setMinEvictableIdleTimeMillis(300000);
		druidDataSource.setTestWhileIdle(true);
		if (needSql) {
			List<Filter> proxyFilters = new ArrayList<>();
			proxyFilters.add(logFilter());
			druidDataSource.setProxyFilters(proxyFilters);
		}
		if (needWeb) {
			druidDataSource.setFilters("stat");
		}
		if (StringUtils.isNotBlank(filters)) {
			druidDataSource.addFilters(filters);
		}
		return druidDataSource;
	}

	public LogFilter logFilter(){
		LogFilter logFilter = new Log4jFilter();
		logFilter.setStatementExecutableSqlLogEnable(true);
		logFilter.setStatementLogEnabled(false);
		logFilter.setResultSetLogEnabled(false);
		return logFilter;
	}


	@Bean
	@ConditionalOnExpression("${spring.datasource.needWeb}")
	public ServletRegistrationBean druidServlet() {
		return new ServletRegistrationBean(new StatViewServlet(), "/druidstatapp/*");
	}

    @Bean
    @ConditionalOnExpression("${spring.datasource.needWeb}")
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,*.html,/druidstatapp/*");
        return filterRegistrationBean;
    }
}
