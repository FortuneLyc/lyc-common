
package com.act.framework.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.dao.VersionInfoMapper;
import com.act.framework.web.model.VersionInfo;

/**
 * ClassName:VersionInfoService <br/>
 * Date:     2017年9月30日 下午3:10:27 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@Service
public class VersionInfoService extends SingleTableService<VersionInfo> {
	
	@Autowired
	private VersionInfoMapper versionInfoMapper;

	@Override
	public Class<VersionInfo> getGenericClazz() {
		return VersionInfo.class;
	}
	
	public SimpleReturn<Boolean> saveOrupdate(VersionInfo entity){
		VersionInfo model = new VersionInfo();
		model.setName(entity.getName());
		model.setVersionNo(entity.getVersionNo());
		//校验组件是否已经上报过当前版本信息
		VersionInfo one = super.selectOne(model);
		int result = 0;
		if(one != null){
			one.setVersionContent(entity.getVersionContent());
			one.setReportDate(new Date());
			one.setDisplayLabel(entity.getDisplayLabel());
			one.setGeneralNo(entity.getGeneralNo());
			result = super.updateFullById(one);
		}else{
			entity.setIsVisible(true);
			entity.setReportDate(new Date());
			entity.setFirstReportDate(new Date());
			result = super.insertFull(entity);
		}
		
		if(result>0){
			return new SimpleReturn<Boolean>(true);
		}else{
			return new SimpleReturn<Boolean>(false);
		}
	}
	
	public List<VersionInfo> getVersionInfo(){
		return versionInfoMapper.getVersionInfo();
	}
}

