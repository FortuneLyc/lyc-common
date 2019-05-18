package com.act.common.spring.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

import com.act.common.orm.type.EnumUtils;
import com.act.common.orm.type.StringEnum;

/**
 *
 * ClassName: StringToStringEnumConverterFactory <br/>
 * Function: <br/>
 * date: 2016年10月20日 上午11:35:47 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 */
public class StringToStringEnumConverterFactory implements ConverterFactory<String, StringEnum> {

	private Map<Class<? extends StringEnum>, Converter<String, ? extends StringEnum>> converterMap = new HashMap<>();
	@SuppressWarnings("unchecked")
	@Override
	public <T extends StringEnum> Converter<String, T> getConverter(Class<T> targetType) {
		Converter<String, ? extends StringEnum> result = converterMap.get(targetType);
		if (null == result) {
			result = new StringToEnum<>(targetType);
			converterMap.put(targetType, result);
		}
		return (Converter<String, T>) result;
	}

	private class StringToEnum<T extends StringEnum> implements Converter<String, T> {

		private final Class<T> enumType;
		public StringToEnum(Class<T> enumType) {
			this.enumType = enumType;
		}

		@Override
		public T convert(String source) {
			T instance = EnumUtils.getEnumFromStringType(enumType, source);
			if (null == instance) {
				throw new IllegalArgumentException(source + " 在枚举类: " + enumType.toString() + " 中未定义");
			}
			return instance;
		}

	}



}
