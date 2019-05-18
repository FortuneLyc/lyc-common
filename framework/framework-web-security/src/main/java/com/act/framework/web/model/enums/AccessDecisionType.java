package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName: AccessDecisionType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:13:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public enum AccessDecisionType implements LongEnum {
	/**
	 * 同意
	 */
	GRANTED(1),
	/**
	 * 保留
	 */
	ABSTAIN(0),
	/**
	 * 拒绝
	 */
	DENIED(-1),
	;
	private final long type;

	private AccessDecisionType(long type){
		this.type = type;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

}

