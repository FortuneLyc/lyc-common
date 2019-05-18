
package com.act.framework.web.dao;

import java.util.List;

import com.act.framework.basic.service.SingleTableMapper;
import com.act.framework.web.model.VersionInfo;

/**
 * ClassName:VersionInfoMapper <br/>
 * Date:     2017年9月30日 下午3:11:25 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
public interface VersionInfoMapper extends SingleTableMapper<VersionInfo> {

	public List<VersionInfo> getVersionInfo();
}

