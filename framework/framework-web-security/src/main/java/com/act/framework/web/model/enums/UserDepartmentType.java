package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName:UserDepartmentType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:13:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public enum UserDepartmentType implements LongEnum {
	First(1),
	Second(2),
	Third(3),
	;
	private final long type;

	private UserDepartmentType(long type){
		this.type = type;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

}

