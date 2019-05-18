package com.act.framework.basic.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName:BaseModelErrorType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月19日 下午6:53:21 <br/>
 * @author   lyc
 * @version

 * @see
 */
public enum BaseModelErrorType implements LongEnum {
	/**
	 * 无错误
	 */
	NO_ERROR(0),
	/**
	 * API错误
	 */
	API_EXCEPTION(1),
	/**
	 * 参数缺失
	 */
	MISSING_PARAMETER(400),
	/**
	 * 无权限
	 */
	Unauthorized(401),
	/**
	 * 其他错误
	 */
	OTHER_EXCEPTION(500),
	/**
	 * 参数绑定错误
	 */
	BINDDING_EXCEPTION(500),

	;
	private final long type;

	private BaseModelErrorType(long type){
		this.type = type;
	}
	@Override
	public Long getLongType() {
		return this.type;
	}
}

