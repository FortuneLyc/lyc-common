
package com.act.framework.web.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.model.VersionInfo;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.VersionInfoService;

/**
 * ClassName:VersionInfoCtrl <br/>
 * Date:     2017年9月30日 下午3:02:46 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@RequestMapping
@ControllerLog(format="版本信息上报ctrl")
@RestController
public class VersionInfoCtrl extends BaseCtrl<VersionInfo> {
	
	@Autowired
	private VersionInfoService versionInfoService;
	
	@RequestMapping
	@ControllerLog(format="保存上报的版本信息", type= LogType.Insert)
	public SimpleReturn<Boolean> saveVersion(VersionInfo entity){
		return versionInfoService.saveOrupdate(entity);
	}
	
	@RequestMapping
	@ControllerLog(format="获取版本信息", type= LogType.Select)
	public List<VersionInfo> getVersionInfo(){
		return versionInfoService.getVersionInfo();
	}
}

