
package com.act.common.orm.type;

import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;

import com.act.common.other.param.Args;

/**
 * ClassName: EnumUtils <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月10日 下午8:43:49 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class EnumUtils {

	public static <E extends LongEnum> E getEnumFromLongType(Class<E> enumClass, Long type){
		if (null == type) {
			return null;
		}
		E[] enums = enumClass.getEnumConstants();
		for (E t : enums) {
			if (t.getLongType().equals(type)) {
				return t;
			}
		}
		return null;
	}
	public static <E extends StringEnum> E getEnumFromStringType(Class<E> enumClass, String type){
		if (null == type) {
			return null;
		}
		E[] enums = enumClass.getEnumConstants();
		for (E t : enums) {
			if (t.getStringType().equals(type)) {
				return t;
			}
		}
		return null;
	}

	public static long toBitVectors(BitVectorEnum... vectors){
		Args.notNull(vectors, "参数:BitVector");
		long bit = 0;
		for (BitVectorEnum vector : vectors) {
			if (vector==null) {
				continue;
			}
			bit|=vector.getBitVector();
		}
		return bit;
	}
	public static <E extends Enum<E> & BitVectorEnum> Set<E> toEnumSet(Class<E> OriginalType,Long bitVectors){
		E[] enums = OriginalType.getEnumConstants();
		Args.notNull(enums, "OriginalType必须是枚举类型");
		if (bitVectors==null) {
			return Collections.emptySet();
		}
		EnumSet<E> set = EnumSet.noneOf(OriginalType);
		for (E e : enums) {
			if ((e.getBitVector()&bitVectors)!=0) {
				set.add(e);
			}
		}
		return set;
	}

}

