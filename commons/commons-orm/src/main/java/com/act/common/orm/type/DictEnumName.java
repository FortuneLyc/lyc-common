package com.act.common.orm.type;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

/**
 * ClassName: DictEnumName <br/>
 * Function:  此注解只应该出现在枚举类型上<br/>
 * Reason:	  <br/>
 * Date:     2016年9月21日 下午2:38:11 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Target({ElementType.TYPE})
@Retention(RUNTIME)
@Documented
public @interface DictEnumName{
	String value();
}

