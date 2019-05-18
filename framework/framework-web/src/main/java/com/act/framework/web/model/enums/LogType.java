package com.act.framework.web.model.enums;

import com.act.common.orm.type.LongEnum;
import com.act.common.other.type.DescribeType;

/**
 * ClassName:UserDepartmentType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:13:28 <br/>
 * @author   lyc
 * @version

 * @see
 */
public enum LogType implements LongEnum,DescribeType {

	Insert(1,"插入"),
	Delete(2,"删除"),
	Update(3,"更新"),
	Select(4,"查找"),

	Loggin(5,"登录"),
	Logout(6,"退出"),

	None(98,"无"),//不记录日志
	Other(99,"其他"),
	;
	private final long type;
	private final String desc;

	private LogType(long type, String desc){
		this.type = type;
		this.desc = desc;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

	@Override
	public String getDescribe() {
		return desc;
	}

}

