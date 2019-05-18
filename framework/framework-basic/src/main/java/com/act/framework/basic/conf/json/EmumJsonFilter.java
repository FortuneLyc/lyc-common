/**
 * Project Name:web-framework-base
 * File Name:EmumJsonFilter.java
 * Package Name:com.act.framework.web.base.conf.web
 * Date:2016年10月20日上午12:24:11
 *
*/

package com.act.framework.basic.conf.json;

import com.act.common.orm.type.LongEnum;
import com.act.common.orm.type.StringEnum;
import com.alibaba.fastjson.serializer.ValueFilter;

/**
 * ClassName:EmumJsonFilter <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月20日 上午12:24:11 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class EmumJsonFilter implements ValueFilter {

	@Override
	public Object process(Object object, String name, Object value) {
		if (value instanceof LongEnum) {
			LongEnum i = (LongEnum) value;
			return i.getLongType();
		}
		if (value instanceof StringEnum) {
			StringEnum i = (StringEnum) value;
			return i.getStringType();
		}
		return value;
	}

}

