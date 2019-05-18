
package com.act.framework.workflow.model.enums;

import com.act.common.orm.type.LongEnum;
import com.act.common.other.type.DescribeType;

/**
 * ClassName: WfPageTypes <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年8月1日 下午2:28:13 <br/>
 * @author   lyc
 * @version

 * @see
 */
public enum WfPageTypes implements LongEnum, DescribeType {

	NORMAL(0, "普通"),
	IS_AUDIT(1, "信安审核"),
	IS_SMS(2, "短信核验")
	;
	private final long type;
	private final String desc;

	private WfPageTypes(long type, String desc){
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

