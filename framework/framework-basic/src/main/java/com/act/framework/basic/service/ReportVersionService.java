package com.act.framework.basic.service;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.act.common.net.utils.ReportVersionInfo;


@Service
public class ReportVersionService {
	
	@Value("${version.url:}")
	private String url;
	@Value("${version.isReport:false}")
	private Boolean isReport;
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@PostConstruct
	private void init(){
		if(isReport){
			ReportVersionInfo.report(url);
		}
	}
}

