package com.act.framework.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.session.InvalidSessionStrategy;
import org.springframework.security.web.session.SimpleRedirectInvalidSessionStrategy;
import org.springframework.web.filter.GenericFilterBean;

/**
 * ClassName: MySessionFilter <br/>
 * Function: <br/>
 * date: 2016年11月4日 下午3:53:24 <br/>
 *
 * @author zhangpeng
 * @since JDK 1.8
 */
public class MySessionFilter  extends GenericFilterBean {
    static final String FILTER_APPLIED = "__spring_security_my_session_mgmt_filter_applied";

    private final InvalidSessionStrategy invalidSessionStrategy;
    public MySessionFilter(String invalidUrl) {
        this.invalidSessionStrategy = new SimpleRedirectInvalidSessionStrategy(invalidUrl);
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        if (request.getAttribute(FILTER_APPLIED) != null) {
            chain.doFilter(request, response);
            return;
        }
        request.setAttribute(FILTER_APPLIED, Boolean.TRUE);

        if (request.getRequestedSessionId() != null) {
            String ip = request.getRemoteAddr();
            String ua = request.getHeader("User-Agent");
            if (ua == null){
                ua = "unknow";
            }
            HttpSession session = request.getSession();
            Object sip = session.getAttribute("ip");
            Object sua = session.getAttribute("ua");
            if (sip == null || sua == null || "".equals(sip.toString()) || "".equals(sua.toString())) {
                session.setAttribute("ip", ip);
                session.setAttribute("ua", ua);
                chain.doFilter(request, response);
                return;
            }
            if ((sip.equals("0:0:0:0:0:0:0:1") && ip.equals("127.0.0.1")) || (sip.equals("127.0.0.1") && ip.equals("0:0:0:0:0:0:0:1"))) {
                session.setAttribute("ip", ip);
                chain.doFilter(request, response);
                return;
            }
            if(!ip.equals(sip) || !ua.equals(sua)){
                logger.warn("相同session的用户的IP或者UA变化，可能是Session重放攻击");
                invalidSessionStrategy.onInvalidSessionDetected(request, response);
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
