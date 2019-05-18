package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 *
 * ClassName: AreaType <br/>
 * Function: <br/>
 * date: 2016年10月30日 下午8:39:02 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 */
public enum AreaType implements LongEnum {
	Province(1),
	City(2),
	District(3),
	;
	private final long type;

	private AreaType(long type){
		this.type = type;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

}