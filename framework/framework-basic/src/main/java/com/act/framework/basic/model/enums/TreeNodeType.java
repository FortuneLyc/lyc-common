package com.act.framework.basic.model.enums;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName: TreeNodeType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年10月29日 下午7:01:47 <br/>
 * @author   lyc
 * @version

 * @see
 */
public enum TreeNodeType implements LongEnum {
	Root(0),
	Branch(1),
	Leaf(2),
	;
	private final long type;

	private TreeNodeType(int type){
		this.type = type;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

}