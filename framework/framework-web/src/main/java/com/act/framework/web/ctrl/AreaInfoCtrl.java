package com.act.framework.web.ctrl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.exception.ApiHandleException;
import com.act.framework.web.model.AreaInfo;
import com.act.framework.web.model.enums.AreaType;
import com.act.framework.web.model.enums.LogType;
import com.act.framework.web.service.AreaInfoService;

/**
 * ClassName: AreaInfoCtrl <br/>
 * Function: <br/>
 * date: 2016年11月4日 下午3:53:24 <br/>
 *
 * @author congyajing
 * @version
 * @since JDK 1.8
 */
@ControllerLog(format="地市信息")
@RestController
@RequestMapping
public class AreaInfoCtrl extends BaseCtrl<AreaInfo> {

	@Autowired
	private AreaInfoService areaInfoService;

	@ControllerLog(format="获取地市信息", type=LogType.Select)
	@RequestMapping(path="/selectByCode")
	public AreaInfo selectByCode(@RequestParam(required=true) String code) {
		try {
			if (StringUtils.isBlank(code)) {
				throw new ApiHandleException("获取区域失败 code 不能为空");
			}
			return areaInfoService.selectByCode(code);
		} catch (Exception e) {
			throw new ApiHandleException("获取区域失败",e);
		}
	}
	@ControllerLog(format="获取子地市信息列表", type=LogType.Select)
	@RequestMapping(path="/selectChild")
	public List<AreaInfo> selectChild(@RequestParam(required=true) String code) {
		try {
			if (StringUtils.isBlank(code)) {
				throw new ApiHandleException("获取区域失败 code 不能为空");
			}
			return areaInfoService.selectChild(code);
		} catch (Exception e) {
			throw new ApiHandleException("获取区域失败",e);
		}
	}
	@ControllerLog(format="获取全国省列表", type=LogType.Select)
	@RequestMapping(path="/allProvince")
	public List<AreaInfo> allProvince() {
		try {
			AreaInfo areaInfo = new AreaInfo();
			areaInfo.setAreaType(AreaType.Province);
			return areaInfoService.selectAll(areaInfo);
		} catch (Exception e) {
			throw new ApiHandleException("获取区域失败",e);
		}
	}
}
