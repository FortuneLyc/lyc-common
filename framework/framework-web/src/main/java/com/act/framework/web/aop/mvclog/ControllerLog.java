
package com.act.framework.web.aop.mvclog;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.act.framework.web.model.enums.LogType;

/**
 * ClassName: ControllerLog <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年11月17日 下午2:21:05 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ControllerLog {
	String format();
	LogType type() default LogType.Other;
}

