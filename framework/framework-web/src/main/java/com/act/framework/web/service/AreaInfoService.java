package com.act.framework.web.service;

import java.util.List;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.AreaInfo;

/**
 * ClassName: AreaInfoService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:27:15 <br/>
 * @author   lyc
 * @version

 * @see
 */
@CacheConfig(cacheNames = "AreaInfo")
@Service
public class AreaInfoService extends SingleTableService<AreaInfo> {

	@Override
	public Class<AreaInfo> getGenericClazz() {
		return AreaInfo.class;
	}

	@CacheEvict(allEntries=true)
	public void fresh(){
		return;
	}

	@Cacheable
	public AreaInfo selectByCode(String code) {
		AreaInfo entity = new AreaInfo();
		entity.setAreaCode(code);
		return super.selectOne(entity);
	}

	public List<AreaInfo> selectChild(String code) {
		AreaInfo father = this.selectByCode(code);
		AreaInfo child = new AreaInfo();
		child.setParentCode(father.getAreaCode());
		return super.selectAll(child);
	}

}

