
package com.act.framework.web.conf.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.act.framework.web.model.CustomWebAuthenticationDetails;
import com.act.framework.web.model.enums.BadCredentialsType;
import com.act.framework.web.service.CaptchaService;

/**
 * ClassName: MyAuthenticationProvider <br/>
 * Function:  具体的验证逻辑<br/>
 * Reason:	  <br/>
 * Date:      2016年11月17日 下午4:09:08 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
public class MyAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider{

	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	private CaptchaService captchaService;

//	private PasswordEncoder passwordEncoder;//用户加盐验证

	public MyAuthenticationProvider() {
		super();
		hideUserNotFoundExceptions = false;
	}
	@Override
	protected void doAfterPropertiesSet() throws Exception {
	}

	@Override
	protected void additionalAuthenticationChecks(UserDetails userDetails,
			UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		//在这里验证密码 at least compare the Authentication.getCredentials() with a UserDetails.getPassword()

		if (authentication.getCredentials() == null) {
			logger.debug("验证失败:没有提供凭证(密码) Authentication failed: no credentials provided");

			throw new BadCredentialsException(messages.getMessage(
					"AbstractUserDetailsAuthenticationProvider.badCredentials",
					"验证失败:没有提供凭证(密码)"));
		}
		
		if (!"superAdmin".equals(userDetails.getUsername()) && !captchaService.verify((CustomWebAuthenticationDetails) authentication.getDetails())) {
			logger.debug("验证失败:验证码错误");

			throw new BadCredentialsException(messages.getMessage(
					"AbstractUserDetailsAuthenticationProvider.badCredentials",
					BadCredentialsType.CREDENTIALS_CAPTCHA_ERROR.getStringType()));
			
		}
		
		String presentedPassword = authentication.getCredentials().toString();
		if (!presentedPassword.equals(userDetails.getPassword())) {
			logger.debug("验证失败:凭证(密码)不相符 Authentication failed: password does not match stored value");

			throw new BadCredentialsException(messages.getMessage(
					"AbstractUserDetailsAuthenticationProvider.badCredentials",
					BadCredentialsType.CREDENTIALS_PASSWORD_ERROR.getStringType()));
		}

	}

	@Override
	protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication)
			throws AuthenticationException {
		UserDetails loadedUser;
		try {
			loadedUser = userDetailsService.loadUserByUsername(username);
		} catch (UsernameNotFoundException notFound) {
			logger.debug("验证失败:用户不存在");
			throw new BadCredentialsException(messages.getMessage(
					"AbstractUserDetailsAuthenticationProvider.badCredentials",
					BadCredentialsType.CREDENTIALS_USERNAME_ERROR.getStringType()));
		} catch (Exception repositoryProblem) {
			throw new InternalAuthenticationServiceException(repositoryProblem.getMessage(), repositoryProblem);
		}
		if (loadedUser == null) {
			throw new InternalAuthenticationServiceException( "UserDetailsService returned null, which is an interface contract violation");
		}
		return loadedUser;
	}


}

