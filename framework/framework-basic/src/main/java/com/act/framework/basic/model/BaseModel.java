/**
 * Project Name:web-framework-base
 * File Name:BaseModel.java
 * Package Name:com.act.framework.web.base.model
 * Date:2016年10月19日下午6:48:52
 *
*/

package com.act.framework.basic.model;

import com.act.framework.basic.model.enums.BaseModelErrorType;

/**
 * ClassName:BaseModel <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年10月19日 下午6:48:52 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
public class BaseModel<T> {

	public static <T> BaseModel<T> getInstance(BaseModelErrorType BaseModelErrorType) {
		BaseModel<T> b = new BaseModel<T>();
		b.setErrorType(BaseModelErrorType);
		return b;
	}
	public static <T> BaseModel<T> getInstance(BaseModelErrorType BaseModelErrorType,String msg,Boolean debug) {
		BaseModel<T> b = new BaseModel<T>();
		b.setErrorType(BaseModelErrorType);
		if (debug) {
			b.setMsg(msg);
		}
		return b;
	}

	private boolean isNormal = true;
	private BaseModelErrorType errorType = BaseModelErrorType.NO_ERROR;
	private String msg;
	private T returnModel = null;

	public Boolean getIsNormal() {
		return isNormal;
	}

	public BaseModelErrorType getErrorType() {
		return errorType;
	}

	public void setErrorType(BaseModelErrorType errorType) {
		this.errorType = errorType;
		this.isNormal = BaseModelErrorType.NO_ERROR.equals(errorType);
	}

	public T getReturnModel() {
		return returnModel;
	}

	public void setReturnModel(T returnModel) {
		this.returnModel = returnModel;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
