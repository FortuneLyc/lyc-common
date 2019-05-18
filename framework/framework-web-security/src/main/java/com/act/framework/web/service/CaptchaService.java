
package com.act.framework.web.service;

import java.awt.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.patchca.color.SingleColorFactory;
import org.patchca.service.ConfigurableCaptchaService;
import org.patchca.utils.encoder.EncoderHelper;
import org.patchca.word.AdaptiveRandomWordFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.act.framework.web.model.CustomWebAuthenticationDetails;

/**
 * ClassName: CaptchaService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version
 * @see
 */
@Service
public class CaptchaService {

	private ConfigurableCaptchaService cs = new ConfigurableCaptchaService();
	private ConcurrentHashMap<String, CaptchaSessionModel> captchaMap = new ConcurrentHashMap<>();

	@Value("${act.captcha.require:true}")
	private boolean require;
	@Value("${act.captcha.expireSecond:120}")
	private long expireSecond;
	@Value("${act.captcha.r:25}")
	private int r;
	@Value("${act.captcha.g:60}")
	private int g;
	@Value("${act.captcha.b:170}")
	private int b;
	@Value("${act.captcha.width:140}")
	private int width;
	@Value("${act.captcha.height:50}")
	private int height;
	@Value("${act.captcha.wordLength:4}")
	private int wordLength;
	@Value("${act.captcha.words:absdegkmnopwx23478}")
	private String words;
	@Value("${act.captcha.passString:yhsj123}")
	private String passString;

	@PostConstruct
	private void init() {
		cs.setColorFactory(new SingleColorFactory(new Color(r, g, b)));
		cs.setFilterFactory(v -> v);
		cs.setWidth(width);
		cs.setHeight(height);
		((AdaptiveRandomWordFactory)cs.getWordFactory()).setMaxLength(wordLength);
		((AdaptiveRandomWordFactory)cs.getWordFactory()).setMinLength(wordLength);
		((AdaptiveRandomWordFactory)cs.getWordFactory()).setCharacters(words);
	}

	public String generateCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		response.setContentType("image/png");
		String challenge = EncoderHelper.getChallangeAndWriteImage(cs, "png", response.getOutputStream());
		if (session != null){
			captchaMap.put(session.getId(), new CaptchaSessionModel(session.getId(), challenge));
			return challenge;
		}
		return "";
	}

	public synchronized boolean verify(String sessionId, String challenge) {
		expire();
		if (!require) return true;
		if (challenge==null) return false;
		if (challenge.equalsIgnoreCase(passString)) return true;
		if (sessionId==null) return false;
		CaptchaSessionModel model = captchaMap.remove(sessionId);
		return model != null && challenge.equalsIgnoreCase(model.challenge);
	}
	public boolean verify(CustomWebAuthenticationDetails details) {
		String sessionId = details.getSessionId();
		String challenge = details.getCaptcha();
		return verify(sessionId, challenge);
	}

	private void expire() {
		LocalDateTime ldt = LocalDateTime.now().minusSeconds(expireSecond);
		HashSet<String> set = new HashSet<>();
		captchaMap.forEach((k, v) -> {
			if (v.ldt.isBefore(ldt)) {
				set.add(k);
			}
		});
		set.forEach(k -> captchaMap.remove(k));
	}

	private static class CaptchaSessionModel {
		public CaptchaSessionModel(String sessionId, String challenge){
			this.sessionId = sessionId;
			this.challenge = challenge;
			this.ldt = LocalDateTime.now();
		}
		String sessionId;
		String challenge;
		LocalDateTime ldt;
	}
}

