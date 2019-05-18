
package com.act.framework.web.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.Api;
import com.act.framework.web.model.ApiAccess;
import com.act.framework.web.model.SystemRole;
import com.act.framework.web.model.SystemUser;

/**
 * ClassName: ApiAccessService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   "zhangpeng"
 * @version
 * @see
 */
@CacheConfig(cacheNames = "ApiAccess")
@Service
public class ApiAccessService extends SingleTableService<ApiAccess> {

	@Override
	public Class<ApiAccess> getGenericClazz() {
		return ApiAccess.class;
	}

	@Autowired
	private ApiService apiService;

	@CacheEvict(allEntries=true)
	public void fresh(){
		return;
	}


	private List<ApiAccess> selectByRoleAndApi(Long roleId, String apiUrl) {
		ApiAccess entity = new ApiAccess();
		entity.setRoleId(roleId);
		List<ApiAccess> apiAccessList = this.selectAll(entity);
		Iterator<ApiAccess> it = apiAccessList.iterator();
		while (it.hasNext()) {
			ApiAccess apiAccess = it.next();
			Api apiEntity = new Api();
			apiEntity.setId(apiAccess.getApiId());
			apiEntity.setIsEnable(true);
			apiEntity.setUrl(apiUrl);
			apiEntity = apiService.selectOne(apiEntity);
			if (apiEntity == null) {
				it.remove();
			}else{
				apiAccess.setApi(apiEntity);
			}
		}
		return apiAccessList;
	}

	@Cacheable(key="#user.id + '-' + #apiUrl")
	public List<ApiAccess> getDecisionVoters(SystemUser user, String apiUrl) {
		List<SystemRole> roleList = user.getRoleList();
		if (roleList==null || roleList.size()==0) {
			return Collections.emptyList();
		}
		List<ApiAccess> result = new ArrayList<>();
		for (SystemRole systemRole : roleList) {
			result.addAll(this.selectByRoleAndApi(systemRole.getId(),apiUrl));
		}
		return result;
	}


	@Cacheable(key="#user.id")
	public boolean isDefautGrant(SystemUser user) {
		List<SystemRole> roleList = user.getRoleList();
		if (roleList==null || roleList.size()==0) {
			return false;
		}
		for (SystemRole systemRole : roleList) {
			ApiAccess aa = new ApiAccess();
			aa.setRoleId(systemRole.getId());
			if (this.count(aa)>0) {
				return false;
			}
		}
		return true;
	}


	@CacheEvict(allEntries=true)
	@Override
	public int insert(ApiAccess entity) {
		return super.insert(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int insertList(List<ApiAccess> entityList) {
		return super.insertList(entityList);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int deleteById(Long id) {
		return super.deleteById(id);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int delete(ApiAccess entity) {
		return super.delete(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int updateById(ApiAccess entity) {
		return super.updateById(entity);
	}

	@CacheEvict(allEntries=true)
	@Override
	public int updateFullById(ApiAccess entity) {
		return super.updateFullById(entity);
	}

	@Cacheable
	@Override
	public ApiAccess selectById(Long id) {
		return super.selectById(id);
	}

	@Cacheable
	@Override
	public ApiAccess selectOne(ApiAccess entity) {
		return super.selectOne(entity);
	}

	@Cacheable
	@Override
	public List<ApiAccess> selectAll(ApiAccess entity) {
		return super.selectAll(entity);
	}

}

