package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName:RoleGrade <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:21:52 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public enum RoleGrade implements LongEnum {
	First(1),
	Second(2),
	;
	private final long type;

	private RoleGrade(long type){
		this.type = type;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}
}

