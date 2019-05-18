package com.act.framework.web.model;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.authentication.WebAuthenticationDetails;

public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    private final String captcha;

    public CustomWebAuthenticationDetails(HttpServletRequest request) {
        super(request);
        captcha = request.getParameter("captcha");
    }

    public String getCaptcha() {
        return captcha;
    }

    @Override
    public String toString() {
        return super.toString() + "; captcha: " + this.getCaptcha();
    }
}