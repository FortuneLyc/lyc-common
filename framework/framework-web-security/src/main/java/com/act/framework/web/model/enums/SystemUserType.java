package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;
import com.act.common.other.type.DescribeType;

/**
 * ClassName:SystemUserType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:04:18 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public enum SystemUserType implements LongEnum,DescribeType {
	super_admin(0,"超级管理员"),
	common(1,"系统用户"),
	anonymous(2,"匿名用户"),
	;
	private final long type;
	private final String name;

	private SystemUserType(long type,String name){
		this.type = type;
		this.name = name;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

	@Override
	public String getDescribe() {
		return name;
	}
}

