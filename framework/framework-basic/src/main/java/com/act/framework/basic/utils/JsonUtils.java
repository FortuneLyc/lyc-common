
package com.act.framework.basic.utils;

import java.lang.reflect.ParameterizedType;

import org.apache.commons.lang3.reflect.TypeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.act.framework.basic.conf.json.FastJsonConfiguration;
import com.act.framework.basic.model.BaseModel;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson.support.config.FastJsonConfig;

/**
 * ClassName: JsonUtils <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年3月7日 上午11:21:36 <br/>
 * @author   lyc
 * @version

 * @see
 */
public final class JsonUtils {
	private static Logger logger = LoggerFactory.getLogger(JsonUtils.class);

	public static String toJson(Object obj){
		FastJsonConfig fastJsonConfig = FastJsonConfiguration.getDefaultFastJsonConfig();
		return  JSON.toJSONString(obj,
				fastJsonConfig.getSerializeConfig(),
				fastJsonConfig.getSerializeFilters(),
				fastJsonConfig.getDateFormat(),
				JSON.DEFAULT_GENERATE_FEATURE,
				fastJsonConfig.getSerializerFeatures());
	}

	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {}
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param url
	 * @param json
	 * @param returnType
	 * @return
	 * @since JDK 1.7
	 */
	public static <T> T toObject(String json,TypeReference<T> returnType){
		return toObject(json, returnType, false);
	}
	/**
	 *
	 * <pre>
	 * returnType = new TypeReference&lt;List&lt;Model&gt;&gt;() {} 或者 null
	 * </pre>
	 * <br/>
	 * @author lyc
	 * @param url
	 * @param json
	 * @param returnType
	 * @return
	 * @since JDK 1.7
	 */
	public static <T> T toObject(String json,TypeReference<T> returnType,boolean isWraped){
		if (returnType == null) {
			return null;
		}
		FastJsonConfig fastJsonConfig = FastJsonConfiguration.getDefaultFastJsonConfig();
		if (isWraped) {
			ParameterizedType ptWithType = TypeUtils.parameterize(BaseModel.class, returnType.getType());
			BaseModel<T> bm = JSON.parseObject(json,
					ptWithType,
					fastJsonConfig.getParserConfig(),
					fastJsonConfig.getFeatures());
			if (bm == null || bm.getIsNormal()==null ||  Boolean.FALSE.equals(bm.getIsNormal())) {
				logger.warn("返回参数提示错误信息:{}",json);
				return null;
			}
			return bm.getReturnModel();
		}
		return JSON.parseObject(json,
				returnType.getType(),
				fastJsonConfig.getParserConfig(),
				fastJsonConfig.getFeatures());
	}

}

