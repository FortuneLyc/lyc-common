
package com.act.common.net.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ClassName:ReportVersionInfo <br/>
 * Date:     2017年9月30日 上午11:27:03 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
public class ReportVersionInfo {
	
	private static Logger logger = LoggerFactory.getLogger(ReportVersionInfo.class);

	public static void report(String url) {
		final String webUrl = url;
		logger.info("======1分钟后上报版本信息======");
		Executors.newSingleThreadScheduledExecutor().scheduleWithFixedDelay(new Runnable() {
			@Override
			public void run() {
				try {
					logger.info("======开始上报版本信息======");
					ReportVersionInfo.uploadVersion(webUrl);
					logger.info("======版本信息上报结束======");
				} catch (Exception e) {
					logger.error("版本信息上报错误", e);
				}

			}
		}, 1 ,30 , TimeUnit.MINUTES);
	}
	
	public static Boolean uploadVersion(String url){
		if(StringUtils.isBlank(url)){
			logger.error("======接口地址为空======");
			return false;
		}
		//读取文件
		ReportVersionInfo model = new ReportVersionInfo();
		Properties pro = model.readFile("/version.properties");
		if(pro == null){
			return false;
		}
		
		if(StringUtils.isBlank(pro.getProperty("displayLabel"))){
			logger.error("======页面展示的label为空======");
			return false;
		}
		
		if(StringUtils.isBlank(pro.getProperty("name"))){
			logger.error("======组件名称为空======");
			return false;
		}
		
		if(StringUtils.isBlank(pro.getProperty("version"))){
			logger.error("======当前组件版本号为空======");
			return false;
		}
		
		if(StringUtils.isBlank(pro.getProperty("generalNo"))){
			logger.error("======总版本号为空======");
			return false;
		}
		
		if(StringUtils.isBlank(pro.getProperty("publishDate"))){
			logger.error("======当前组件发行时间为空======");
			return false;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", pro.getProperty("name"));
		map.put("versionNo", pro.getProperty("version"));
		map.put("versionContent", pro.getProperty("content"));
		map.put("generalNo", pro.getProperty("generalNo"));
		map.put("displayLabel", pro.getProperty("displayLabel"));
		map.put("publishDate", pro.getProperty("publishDate"));
		logger.info("{}",map);
		try {
			HttpsUtils.postMap(url, map);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("======无法连接到web======");
			return false;
		}
		return true;
	}
		
	public Properties readFile(String path){
		logger.info("=================开始读取version.properties文件=================");
		Properties p= null;
		InputStreamReader inputStreamReader = null;
		InputStream in = getClass().getResourceAsStream(path);
		if(in == null){
			logger.error("======version.properties文件不存在======");
			return p;
		}
		try {
			p = new Properties();
			inputStreamReader = new InputStreamReader(in, "utf-8");
			p.load(inputStreamReader);
		} catch (IOException e) {
			logger.error("加载version.properties失败",e);
		}
		
		logger.info("=================version.properties文件读取完毕=================");
		return p;
	}
	
}

