/**
 * Project Name:web-framework-base
 * File Name:MyBatisConfig.java
 * Package Name:com.act.framework.basic.conf
 * Date:2016年10月19日下午12:06:18
 *
*/

package com.act.framework.basic.conf.db;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import com.act.common.orm.db.LongEnumTypeHandler;
import com.act.common.orm.db.StringEnumTypeHandler;
import com.act.common.orm.type.LongEnum;
import com.act.common.orm.type.StringEnum;
import com.act.common.other.filter.Filter;
import com.act.common.spring.lang.ClassUtils;
import com.github.pagehelper.PageHelper;


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
@EnableTransactionManagement
public class MyBatisConfig implements TransactionManagementConfigurer {
	private static Logger logger = LoggerFactory.getLogger(MyBatisConfig.class);

	@Autowired
    private DataSource dataSource;

	@Value("${spring.datasource.identity}")
	private String identity;

	@Bean("sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        //添加XML目录
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

        if (StringUtils.isBlank(identity)) {
        	throw new IllegalArgumentException("spring.datasource.identity 不应该为空");
		}
        String mapperLocations = "classpath*:mapper/"+identity.toLowerCase()+"/**/*.xml";
    	bean.setMapperLocations(resolver.getResources(mapperLocations));
    	logger.info("Mapper文件位置:"+mapperLocations);

        //添加插件
        bean.setPlugins(new Interceptor[]{pageHelper()});
        //添加枚举类型对应功能
        Map<Class<?>, Class<?>> typeHandlers = getTypeHandlers();
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        if (null != typeHandlers) {
			for (Entry<Class<?>, Class<?>> entry : typeHandlers.entrySet()) {
				configuration.getTypeHandlerRegistry().register(entry.getKey(), entry.getValue());
			}
		}
        if (identity.equalsIgnoreCase("oracle")) {
        	configuration.setJdbcTypeForNull(JdbcType.NULL);
		}
        bean.setConfiguration(configuration);
        return bean.getObject();
    }

	//分页插件 https://git.oschina.net/free/Mybatis_PageHelper/blob/master/wikis/HowToUse.markdown
	@Bean
	public PageHelper pageHelper(){
		PageHelper pageHelper = new PageHelper();
        Properties properties = new Properties();
        properties.setProperty("reasonable", "true");//分页参数合理化
        properties.setProperty("rowBoundsWithCount", "true");//使用RowBounds分页会进行count查询
        properties.setProperty("supportMethodsArguments", "true");//支持通过Mapper接口参数来传递分页参数
        properties.setProperty("returnPageInfo", "check");//always总是返回PageInfo类型,check检查返回类型是否为PageInfo,none返回Page
        pageHelper.setProperties(properties);
        return pageHelper;
	}

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return new DataSourceTransactionManager(dataSource);
    }

    private Map<Class<?>, Class<?>> getTypeHandlers() throws Exception {
    	Map<Class<?>, Class<?>> javaTypeHandlersMap = new HashMap<Class<?>, Class<?>>();
    	Set<Class<?>> typeSet = ClassUtils.findClass("com.act", new Filter<Class<?>>() {
			@Override
			public boolean accept(Class<?> element) {
				if (LongEnum.class.isAssignableFrom(element)&&element.isEnum()) {
					return true;
				}
				if (StringEnum.class.isAssignableFrom(element)&&element.isEnum()) {
					return true;
				}
				return false;
			}
		});
    	typeSet.addAll(ClassUtils.findClass("com.surfilter", new Filter<Class<?>>() {
			@Override
			public boolean accept(Class<?> element) {
				if (LongEnum.class.isAssignableFrom(element)&&element.isEnum()) {
					return true;
				}
				if (StringEnum.class.isAssignableFrom(element)&&element.isEnum()) {
					return true;
				}
				return false;
			}
		}));
    	for (Class<?> type : typeSet) {
    		if (LongEnum.class.isAssignableFrom(type)) {
    			javaTypeHandlersMap.put(type, LongEnumTypeHandler.class);
			}
			if (StringEnum.class.isAssignableFrom(type)) {
				javaTypeHandlersMap.put(type, StringEnumTypeHandler.class);
			}
		}
		return javaTypeHandlersMap;
    }

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

}

