package com.act.common.orm.type;

/**
 * ClassName: BitVectorEnum <br/>
 * Function:  此接口只应该出现在枚举类上，注意不要超过64位，64位会超过long的范围<br/>
 * Reason:	  <br/>
 * Date:     2016年9月21日 下午2:38:11 <br/>
 * @author   lyc
 * @version

 * @see
 */
public interface BitVectorEnum {
	public long getBitVector();
}

