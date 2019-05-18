/**
 * Project Name:web-framework-base
 * File Name:MyFastJsonHttpMessageConverter4.java
 * Package Name:com.act.framework.web.base.conf.web
 * Date:2016年10月19日下午11:38:03
 *
*/

package com.act.framework.web.conf.web.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Map;

import org.apache.commons.lang3.reflect.TypeUtils;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter4;

import com.act.framework.basic.model.BaseModel;
import com.act.framework.basic.model.enums.BaseModelErrorType;

/**
 * ClassName:MyFastJsonHttpMessageConverter4 <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月19日 下午11:38:03 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class MyFastJsonHttpMessageConverter4 extends FastJsonHttpMessageConverter4 {
	
	private Boolean debug;

	@Override
	protected boolean supports(Class<?> paramClass) {
		return !String.class.equals(paramClass);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void writeInternal(Object obj, Type type, HttpOutputMessage outputMessage)
			throws IOException, HttpMessageNotWritableException {
		BaseModel<Object> baseModel = new BaseModel<Object>();
		if (obj instanceof BaseModel) {
			baseModel = (BaseModel<Object>) obj;
		}else if (obj instanceof Map) {
			Map<String, Object> map = (Map<String, Object>) obj;
			if (map.containsKey("status") && map.containsKey("exception") && map.containsKey("message")) {
				baseModel = BaseModel.getInstance(BaseModelErrorType.OTHER_EXCEPTION,"请求方法不支持或者URL未map",debug);
			}
			baseModel.setReturnModel(obj);
		}else {
			baseModel.setReturnModel(obj);
		}
		super.writeInternal(baseModel, type, outputMessage);
	}

    @Override
    public Object read(Type type, //
                       Class<?> contextClass, //
                       HttpInputMessage inputMessage //
    ) throws IOException, HttpMessageNotReadableException {
        InputStream in = inputMessage.getBody();
        if (TypeUtils.containsTypeVariables(type)) {
        	ParameterizedType pt = (ParameterizedType) contextClass.getGenericSuperclass();
        	Type actualType = pt.getActualTypeArguments()[0];//找到T
        	if (type instanceof TypeVariable<?>) {//直接就是T
        		return JSON.parseObject(in, getFastJsonConfig().getCharset(), actualType, getFastJsonConfig().getFeatures());
            }
        	if (type instanceof ParameterizedType) {//List<T>之类的
        		Class<?> raw = TypeUtils.getRawType(type, null);
        		ParameterizedType ptWithType = TypeUtils.parameterize(raw, actualType);
        		return JSON.parseObject(in, getFastJsonConfig().getCharset(), ptWithType, getFastJsonConfig().getFeatures());
        	}
        }
        return JSON.parseObject(in, getFastJsonConfig().getCharset(), type, getFastJsonConfig().getFeatures());
    }

    @Override
    protected Object readInternal(Class<?> clazz, //
								  HttpInputMessage inputMessage //
    ) throws IOException, HttpMessageNotReadableException {

        InputStream in = inputMessage.getBody();
        return JSON.parseObject(in, getFastJsonConfig().getCharset(), clazz, getFastJsonConfig().getFeatures());
    }

	public void setDebug(Boolean debug) {
		this.debug = debug;
	}
    
}

