
package com.act.framework.basic.conf.json;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.act.common.orm.type.DictEnumName;
import com.act.common.orm.type.LongEnum;
import com.act.common.orm.type.StringEnum;
import com.act.common.other.filter.Filter;
import com.act.common.spring.lang.ClassUtils;
import com.act.framework.basic.conf.json.codec.LongEnumCodec;
import com.act.framework.basic.conf.json.codec.MyStringCodec;
import com.act.framework.basic.conf.json.codec.StringEnumCodec;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.parser.ParserConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;

/**
 * ClassName: FastJsonConfig <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月27日 下午3:33:33 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Configuration
public class FastJsonConfiguration {

	private static Object lockObj = new Object();
	private static volatile  FastJsonConfig fastJsonConfig = getDefaultFastJsonConfig();

	public static FastJsonConfig getDefaultFastJsonConfig(){
		if (fastJsonConfig == null) {
			synchronized (lockObj) {
				if (fastJsonConfig == null) {
					try {
						fastJsonConfig = defaultFastJsonConfig();
					} catch (Exception e) {
						throw new IllegalStateException("");
					}
					return fastJsonConfig;
				}else{
					return fastJsonConfig;
				}
			}
		}else{
			return fastJsonConfig;
		}
	}

	private static FastJsonConfig defaultFastJsonConfig() throws IOException, ClassNotFoundException{
		FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setCharset(Charset.forName("UTF-8"));
        fastJsonConfig.setDateFormat("yyyy-MM-dd HH:mm:ss");
        fastJsonConfig.setSerializerFeatures(
//                SerializerFeature.PrettyFormat,
//                SerializerFeature.BrowserCompatible,
				SerializerFeature.DisableCircularReferenceDetect
        );
        ParserConfig parserConfig = ParserConfig.getGlobalInstance();
        parserConfig.putDeserializer(String.class, MyStringCodec.instance);

        Map<String, Class<?>> enumDictMap = enumDictMap();
    	for (Class<?> enumDict : enumDictMap.values()) {
    		if (LongEnum.class.isAssignableFrom(enumDict)) {
    			parserConfig.putDeserializer(enumDict, LongEnumCodec.instance);
			}else if (StringEnum.class.isAssignableFrom(enumDict)) {
				parserConfig.putDeserializer(enumDict, StringEnumCodec.instance);
			}
    	}
    	parserConfig.setAsmEnable(false);

    	fastJsonConfig.setFeatures(Feature.SupportArrayToBean,Feature.AllowUnQuotedFieldNames,Feature.DisableASM);
        fastJsonConfig.setParserConfig(parserConfig);
        fastJsonConfig.setSerializeFilters(new EmumJsonFilter());
        return fastJsonConfig;
	}

	@Bean
    public static Map<String, Class<?>> enumDictMap() throws ClassNotFoundException, IOException {
		Set<Class<?>> enumSet = ClassUtils.findClass("com.act", new Filter<Class<?>>() {
			@Override
			public boolean accept(Class<?> element) {
				if (LongEnum.class.isAssignableFrom(element)) {
					return true;
				}
				if (StringEnum.class.isAssignableFrom(element)) {
					return true;
				}
				return false;
			}
		});
		enumSet.addAll( ClassUtils.findClass("com.surfilter", new Filter<Class<?>>() {
    		@Override
    		public boolean accept(Class<?> element) {
    			if (LongEnum.class.isAssignableFrom(element)) {
    				return true;
    			}
    			if (StringEnum.class.isAssignableFrom(element)) {
					return true;
				}
    			return false;
    		}
    	}));
    	Map<String, Class<?>> map = new HashMap<>();
    	for (Class<?> myEnum : enumSet) {
    		if (myEnum.getAnnotation(DictEnumName.class) != null) {
    			DictEnumName name = myEnum.getAnnotation(DictEnumName.class);
    			map.put(name.value(), myEnum);
			}else{
				map.put(StringUtils.uncapitalize(myEnum.getSimpleName()), myEnum);
			}
		}
    	return Collections.unmodifiableMap(map);
    }
}

