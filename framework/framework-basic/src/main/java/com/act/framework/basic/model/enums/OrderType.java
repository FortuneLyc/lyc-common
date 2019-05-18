package com.act.framework.basic.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName: OrderType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年10月29日 下午7:01:47 <br/>
 * @author   lyc
 * @version

 * @see
 */
public enum OrderType implements LongEnum {
	ASC(0),
	DESC(1),
	;
	private final long type;

	private OrderType(int type){
		this.type = type;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

}