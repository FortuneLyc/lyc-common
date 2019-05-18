package com.act.framework.web.ctrl;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.act.framework.web.service.CaptchaService;

/**
 * ClassName: AreaInfoCtrl <br/>
 * Function: <br/>
 * date: 2016年11月4日 下午3:53:24 <br/>
 *
 * @author congyajing
 * @version
 * @since JDK 1.8
 */
@Controller
@RequestMapping("/")
public class CaptchaCtrl {

	@Autowired
	private CaptchaService captchaService;
	@RequestMapping(path="/captcha")
	public String captcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
		captchaService.generateCaptcha(request, response);
		return "ok";
	}
}
