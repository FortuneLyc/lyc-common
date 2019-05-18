package com.act.framework.web.model.enums;

import com.act.common.orm.type.StringEnum;
import com.act.common.other.type.DescribeType;

/**
 * ClassName: BadCredentialsType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:13:28 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public enum BadCredentialsType implements StringEnum, DescribeType {

	//denyAll > permitAll > fullyAuthenticated > rememberMe > authenticated > anonymous

	CREDENTIALS_USERNAME_ERROR("001","没有提供凭证(密码)"),
	CREDENTIALS_PASSWORD_ERROR("002","凭证(密码)不相符"),
	CREDENTIALS_CAPTCHA_ERROR("003","验证失败:验证码错误"),
	;
	private final String type;
	private final String desc;

	private BadCredentialsType(String type, String desc){
		this.type = type;
		this.desc = desc;
	}

	public String getStringType() {
		return this.type;
	}

	@Override
	public String getDescribe() {
		return this.desc;
	}

}

