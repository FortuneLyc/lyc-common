package com.act.framework.web.exception;
/**
 *
 * ClassName: ApiHandleException <br/>
 * Function: <br/>
 * date: 2016年12月1日 下午6:06:49 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 */
public class ApiHandleException extends RuntimeException {
	private static final long serialVersionUID = -7577502461964176941L;
	public ApiHandleException() {
        super();
    }
    public ApiHandleException(String s) {
        super(s);
    }
    public ApiHandleException(String message, Throwable cause) {
        super(message, cause);
    }
    public ApiHandleException(Throwable cause) {
        super(cause);
    }
}

