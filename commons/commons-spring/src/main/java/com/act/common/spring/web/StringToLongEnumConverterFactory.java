package com.act.common.spring.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

import com.act.common.orm.type.EnumUtils;
import com.act.common.orm.type.LongEnum;

/**
 *
 * ClassName: StringToLongEnumConverterFactory <br/>
 * Function: <br/>
 * date: 2016年10月20日 上午11:35:47 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 */
public class StringToLongEnumConverterFactory implements ConverterFactory<String, LongEnum> {

	private Map<Class<? extends LongEnum>, Converter<String, ? extends LongEnum>> converterMap = new HashMap<>();
	@SuppressWarnings("unchecked")
	@Override
	public <T extends LongEnum> Converter<String, T> getConverter(Class<T> targetType) {
		Converter<String, ? extends LongEnum> result = converterMap.get(targetType);
		if (null == result) {
			result = new LongToEnum<>(targetType);
			converterMap.put(targetType, result);
		}
		return (Converter<String, T>) result;
	}

	private class LongToEnum<T extends LongEnum> implements Converter<String, T> {

		private final Class<T> enumType;
		public LongToEnum(Class<T> enumType) {
			this.enumType = enumType;
		}

		@Override
		public T convert(String source) {
			Long i;
			try {
				i = Long.valueOf(source);
			} catch (NumberFormatException e) {
				throw new IllegalArgumentException("实现LongEnum接口的枚举类只支持long类型转化，错误输入: "+source, e);
			}
			T instance = EnumUtils.getEnumFromLongType(enumType, i);
			if (null == instance) {
				throw new IllegalArgumentException(source + " 在枚举类: " + enumType.toString() + " 中未定义");
			}
			return instance;
		}

	}



}
