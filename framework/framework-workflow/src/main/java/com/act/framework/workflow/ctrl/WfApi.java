
package com.act.framework.workflow.ctrl;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ClassName: WfApi <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年8月7日 下午12:07:48 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WfApi {

}

