
package com.act.framework.basic.model;

/**
 * ClassName: SimpleReturn <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月26日 下午8:05:51 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class SimpleReturn<R> {
	private Object msg;
	private R state;
	public SimpleReturn(R state) {
		this.msg = state;
		this.state = state;
	}
	public SimpleReturn(R state, Object msg) {
		this.msg = msg;
		this.state = state;
	}
	public static <R> SimpleReturn<R> instance(R state){
		return new SimpleReturn<R>(state);
	}
	public Object getMsg() {
		return msg;
	}
	public R getState() {
		return state;
	}
	public SimpleReturn<R> setMsg(Object msg) {
		this.msg = msg;
		return this;
	}
	public SimpleReturn<R> setState(R state) {
		this.state = state;
		return this;
	}
}
