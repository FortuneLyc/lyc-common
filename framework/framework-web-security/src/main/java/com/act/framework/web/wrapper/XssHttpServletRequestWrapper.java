package com.act.framework.web.wrapper;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ClassName: XssHttpServletRequestWrapper <br/>
 * Function: <br/>
 * date: 2016年11月4日 下午3:53:24 <br/>
 *
 * @author zhangpeng
 * @since JDK 1.8
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {
    private static Logger logger = LoggerFactory.getLogger(XssHttpServletRequestWrapper.class);

    boolean isUpData = false;//判断是否是上传 上传忽略

    public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
        String contentType = servletRequest.getContentType();
        if (null != contentType)
            isUpData = contentType.startsWith("multipart");
    }

    @Override
    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if (values == null) {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for (int i = 0; i < count; i++) {
            encodedValues[i] = cleanXSS(values[i]);
        }
        return encodedValues;
    }

    @Override
    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return cleanXSS(value);
    }

    /**
     * 获取request的属性时，做xss过滤
     */
    @Override
    public Object getAttribute(String name) {
        Object value = super.getAttribute(name);
        if (null != value && value instanceof String) {
            value = cleanXSS((String) value);
        }
        return value;
    }

    @Override
    public String getHeader(String name) {

        String value = super.getHeader(name);
        if (value == null)
            return null;
        return cleanXSS(value);
    }

    private static String cleanXSS(String value) {
        if (value.matches(".*<[\\s/]*[A-Za-z0-9_]{1,15}\\s*>.*")) {
            logger.warn("XSS告警 原 {}", value);
            value = value.replaceAll("<","&lt;").replaceAll(">","&gt;");
            logger.warn("XSS告警 替换 {}", value);
        }
        return value;
    }

//    public static void main(String[] args) throws Throwable {
//        System.out.println(cleanXSS("asasas</aafffffffffffffffffffffffffffffa>aaas"));
//    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        if (isUpData) {
            return super.getInputStream();
        } else {

            final ByteArrayInputStream bais = new ByteArrayInputStream(inputHandlers(super.getInputStream()).getBytes());

            return new ServletInputStream() {

                @Override
                public int read() throws IOException {
                    return bais.read();
                }

                @Override
                public boolean isFinished() {
                    return false;
                }

                @Override
                public boolean isReady() {
                    return false;
                }

                @Override
                public void setReadListener(ReadListener readListener) {
                }
            };
        }

    }

    public String inputHandlers(ServletInputStream servletInputStream) {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(servletInputStream, Charset.forName("UTF-8")));
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (servletInputStream != null) {
                try {
                    servletInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return cleanXSS(sb.toString());
    }


}
