package com.act.framework.web.ctrl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
public class LoginCtrl {

	@Value("${act.login: login.html}")
	private String login;

	@RequestMapping(path="/login")
	public String login() {
		return login;
	}
}
