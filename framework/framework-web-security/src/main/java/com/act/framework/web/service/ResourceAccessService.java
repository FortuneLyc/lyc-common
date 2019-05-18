
package com.act.framework.web.service;

import java.util.List;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.ResourceAccess;

/**
 * ClassName: ResourceAccessService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version

 * @see
 */
@CacheConfig(cacheNames = "ResourceAccess")
@Service
public class ResourceAccessService extends SingleTableService<ResourceAccess>{

	@Override
	public Class<ResourceAccess> getGenericClazz() {
		return ResourceAccess.class;
	}

	@CacheEvict(allEntries=true)
	public boolean fresh(){
		return true;
	}

	@CacheEvict(allEntries=true)
	@Override
	public int insert(ResourceAccess entity) {
		return super.insert(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int insertList(List<ResourceAccess> entityList) {
		return super.insertList(entityList);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int deleteById(Long id) {
		return super.deleteById(id);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int delete(ResourceAccess entity) {
		return super.delete(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int updateById(ResourceAccess entity) {
		return super.updateById(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int updateFullById(ResourceAccess entity) {
		return super.updateFullById(entity);
	}

	@Cacheable
	@Override
	public ResourceAccess selectById(Long id) {
		return super.selectById(id);
	}

	@Cacheable
	@Override
	public ResourceAccess selectOne(ResourceAccess entity) {
		return super.selectOne(entity);
	}

	@Cacheable
	@Override
	public List<ResourceAccess> selectAll(ResourceAccess entity) {
		return super.selectAll(entity);
	}

}

