
package com.act.framework.web.service;

import java.util.List;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.Api;

/**
 * ClassName: ApiService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version
 * @see
 */
@CacheConfig(cacheNames = "Api")
@Service
public class ApiService extends SingleTableService<Api> {

	@Override
	public Class<Api> getGenericClazz() {
		return Api.class;
	}

	@CacheEvict(allEntries=true)
	public boolean fresh(){
		return true;
	}

	@CacheEvict(allEntries=true)
	@Override
	public int insert(Api entity) {
		return super.insert(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int insertList(List<Api> entityList) {
		return super.insertList(entityList);
	}

	@CacheEvict
	@Override
	public int deleteById(Long id) {
		return super.deleteById(id);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int delete(Api entity) {
		return super.delete(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int updateById(Api entity) {
		return super.updateById(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int updateFullById(Api entity) {
		return super.updateFullById(entity);
	}

	@Cacheable
	@Override
	public Api selectById(Long id) {
		return super.selectById(id);
	}

	@Cacheable
	@Override
	public Api selectOne(Api entity) {
		return super.selectOne(entity);
	}

	@Cacheable
	@Override
	public List<Api> selectAll(Api entity) {
		return super.selectAll(entity);
	}

}

