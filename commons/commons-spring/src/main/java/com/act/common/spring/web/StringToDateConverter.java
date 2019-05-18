/**
 * Project Name:web-framework-base
 * File Name:StringToDateConverter.java
 * Package Name:com.surfilter.framework.conf.web
 * Date:2016年10月19日下午4:39:29
 *
*/

package com.act.common.spring.web;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * ClassName:StringToDateConverter <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月19日 下午4:39:29 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class StringToDateConverter implements Converter<String, Date> {
    private final String[] INPUT_FORMATS;

    public StringToDateConverter(String[] formats) {
		this.INPUT_FORMATS = formats;
	}

    private String msgFormat = "时间转换失败:%s";

	/**
	 * {@inheritDoc}
	 *
	 * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
	 */
	@Override
	public Date convert(String source) {
		if (StringUtils.isBlank(source)) {
			return null;
		}
		try {
			source = source.trim();
			return DateUtils.parseDateStrictly(source, INPUT_FORMATS);
		} catch (ParseException e) {
			throw new IllegalArgumentException(String.format(msgFormat, source),e);
		}
	}

}
