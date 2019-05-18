
package com.act.common.other.filter;
/**
 * ClassName: Filter <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月1日 下午5:01:13 <br/>
 * @author   lyc
 * @version

 * @see
 */
public interface Filter<T> {

	/**
	 *
	 * check: 当element满足条件就返回true. <br/>
	 * <br/>
	 * @author lyc
	 * @param element
	 * @return
	 * @since JDK 1.7
	 */
	public boolean accept(T element);
}

