package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;
import com.act.common.other.type.DescribeType;

/**
 * ClassName:UserDepartmentType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:13:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public enum AuthorizationConfigurerType implements LongEnum, DescribeType {

	//denyAll > permitAll > fullyAuthenticated > rememberMe > authenticated > anonymous

	denyAll(1,"denyAll"),
	permitAll(2,"permitAll"),
	fullyAuthenticated(3,"fullyAuthenticated"),
	rememberMe(4,"rememberMe"),
	authenticated(5,"authenticated"),
	anonymous(6,"anonymous"),
	;
	private final long type;
	private final String desc;

	private AuthorizationConfigurerType(long type, String desc){
		this.type = type;
		this.desc = desc;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

	@Override
	public String getDescribe() {
		return this.desc;
	}

}

