package com.act.framework.web.ctrl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ClassName: IndexCtrl <br/>
 * Function: <br/>
 * date: 2016年11月4日 下午3:53:24 <br/>
 *
 * @author congyajing
 * @version
 * @since JDK 1.8
 */
@Controller
@RequestMapping("/")
public class IndexCtrl {

	@Value("${act.index: index.html}")
	private String index;

	@RequestMapping(path="/index")
	public String index() {
		return index;
	}
	@RequestMapping(path="/*.index")
	public String otherIndex() {
		return index;
	}
	@RequestMapping(path="/")
	public String defaultIndex() {
		return index;
	}

	@Value("${act.nav: /nav.html}")
	private String nav;

	@RequestMapping(path="/nav")
	public String nav() {
		return nav;
	}
	@RequestMapping(path="/*.nav")
	public String otherNav() {
		return nav;
	}
}
