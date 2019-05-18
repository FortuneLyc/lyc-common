/**
 * Project Name:web-framework-base
 * File Name:GreetingCtrl.java
 * Package Name:com.act.framework.web.base.ctrl
 * Date:2016年10月13日下午5:51:26
 *
*/

package com.act.framework.web.ctrl;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.converter.HttpMessageConversionException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.act.framework.basic.model.BaseModel;
import com.act.framework.basic.model.enums.BaseModelErrorType;
import com.act.framework.web.exception.ApiHandleException;

/**
 * ClassName:GreetingCtrl <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年10月13日 下午5:51:26 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
@ControllerAdvice
public class ExceptionHandlerAdviceCtrl {
	private final Logger logger = LoggerFactory.getLogger(ExceptionHandlerAdviceCtrl.class);
	public static final String DEFAULT_ERROR_VIEW = "404";
	@Value("${spring.security.debug:false}")
	private Boolean debug;
	
	@ExceptionHandler(value=Exception.class)
	@ResponseBody
	public BaseModel<?> exception(Exception e,WebRequest request) throws IOException{
		logger.warn("Api调用触发错误:",e);
		return BaseModel.getInstance(BaseModelErrorType.API_EXCEPTION,"Api调用触发错误:"+e,debug);
	}
	@ExceptionHandler(value=HttpMessageConversionException.class)
	@ResponseBody
	public BaseModel<?> conversionException(Exception e,WebRequest request) throws IOException{
		logger.warn("页面触发错误:",e);
		return BaseModel.getInstance(BaseModelErrorType.BINDDING_EXCEPTION,"参数绑定错误:"+e,debug);
	}
	@ExceptionHandler(value=ApiHandleException.class)
	@ResponseBody
	public BaseModel<?> apiHandleException(ApiHandleException e,WebRequest request) throws IOException{
		logger.warn("Api调用触发错误:",e);
		return BaseModel.getInstance(BaseModelErrorType.API_EXCEPTION,e.getMessage(),debug);
	}
	@ExceptionHandler(value=org.springframework.validation.BindException.class)
	@ResponseBody
	public BaseModel<?> bindException(BindException e,WebRequest request) throws IOException{
		logger.warn("页面传递参数绑定错误:",e);
		return BaseModel.getInstance(BaseModelErrorType.BINDDING_EXCEPTION,"参数绑定错误:"+e,debug);
	}

	@ExceptionHandler(value = NoHandlerFoundException.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        ModelAndView mav = new ModelAndView();
        if (debug) {
        	mav.addObject("exception", e);
        }
        mav.addObject("url", req.getRequestURL());
        mav.setViewName(DEFAULT_ERROR_VIEW);
        return mav;
    }
}
