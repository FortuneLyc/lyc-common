package com.act.framework.web.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.SystemRole;
import com.act.framework.web.model.SystemUser;
import com.act.framework.web.model.UserRoleRelation;
import com.act.framework.web.model.enums.SystemUserType;

/**
 * ClassName: SystemUserService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午5:27:15 <br/>
 *
 * @author "zhangpeng"
 * @see
 * @since JDK 1.7
 */
@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SystemUserService extends SingleTableService<SystemUser> implements UserDetailsService {

	@Override
	public Class<SystemUser> getGenericClazz() {
		return SystemUser.class;
	}

	@Autowired
	private SystemRoleService systemRoleService;
	@Autowired
	private UserRoleRelationService userRoleRelationService;

	@Value("${security.superAdminPassword:qbysycjgly}")
	private String superAdminPassword;
	
	//登入时，前端传到后台的密码增加了签名
	@Value("${act.security.secret:}")
	private String secret;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if ("superAdmin".equals(username)) {
			logger.warn("警告！！！ 请不要使用超级用户进行操作！！！");
			logger.warn("警告！！！ 请不要使用超级用户进行操作！！！");
			logger.warn("警告！！！ 请不要使用超级用户进行操作！！！");
			logger.warn("警告！！！ 请不要使用超级用户进行操作！！！");

			SystemUser superAdmin = new SystemUser();
			superAdmin.setSystemUserType(SystemUserType.super_admin);
			superAdmin.setDisplayName("超级用户");
			superAdmin.setUsername("superAdmin");
			superAdmin.setEnable(true);
			superAdmin.setLayout("left");
			superAdmin.setTheme("sidebar-mini skin-blue");
			PasswordEncoder passwordEncoder =new MessageDigestPasswordEncoder("MD5");
			superAdmin.setPassword(passwordEncoder.encode(superAdminPassword));
			return superAdmin;
		}
		SystemUser systemUser = this.selectUserByUsername(username);
		//将签名加入从DB取出的密码前，用于比对前端传到后台的密码
		systemUser.setPassword(secret+systemUser.getPassword());
		List<SystemRole> roleList = systemRoleService.selectByUserId(systemUser.getId());
		systemUser.setRoleList(roleList);
		return systemUser;
	}

	/**
	 * selectUserByUsername: 不包括角色. <br/>
	 * <br/>
	 *
	 * @param username
	 * @return
	 * @throws UsernameNotFoundException
	 * @author "zhangpeng"
	 * @since JDK 1.7
	 */
	public SystemUser selectUserByUsername(String username) throws UsernameNotFoundException {
		if (StringUtils.isBlank(username)) {
			throw new UsernameNotFoundException("用户名为空");
		}
		SystemUser user = new SystemUser();
		user.setUsername(username);
		SystemUser systemUser = super.selectOne(user);
		if (systemUser == null) {
			throw new UsernameNotFoundException("用户[" + username + "]不存在");
		}
		return systemUser;
	}


	@Override
	public int deleteById(Long id) {
		SystemUser user = new SystemUser();
		user.setId(id);
		user.getBaseEntity().addNot("id");
		int count = super.count(user);
		if (count == 0) {
			throw new UnsupportedOperationException("不能删除最后一个用户");
		}
		int i = super.deleteById(id);
		UserRoleRelation ru = new UserRoleRelation();
		ru.setUserId(id);
		userRoleRelationService.delete(ru);
		return i;
	}

	@Override
	public int delete(SystemUser entity) {
		throw new UnsupportedOperationException("不支持的操作");
	}

	@Transactional
	@Override
	public int insert(SystemUser entity) {
		entity.setId(null);
		entity.setUsername(entity.getUsername().trim());
		if (StringUtils.isBlank(entity.getUsername())) {
			throw new IllegalArgumentException("用户名不应该为 空");
		}
		if (StringUtils.isBlank(entity.getPassword())) {
			throw new IllegalArgumentException("密码不应该为 空");
		}
		SimpleReturn<Boolean> simpleReturn = this.check(entity);
		if (Boolean.FALSE.equals(simpleReturn.getState())) {
			throw new IllegalArgumentException(simpleReturn.getMsg().toString());
		}
		int i = super.insert(entity);
		updateRoleRelation(entity);
		return i;
	}

	private void updateRoleRelation(SystemUser entity) {
		if (entity.getRoleIdList() != null) {
			UserRoleRelation ru = new UserRoleRelation();
			ru.setUserId(entity.getId());
			userRoleRelationService.delete(ru);
			for (Long roleId : entity.getRoleIdList()) {
				UserRoleRelation roleUser = new UserRoleRelation();
				roleUser.setUserId(entity.getId());
				roleUser.setRoleId(roleId);
				userRoleRelationService.insert(roleUser);
			}
		}
	}

	@Override
	public int insertList(List<SystemUser> entityList) {
		throw new UnsupportedOperationException("");
	}

	@Transactional
	@Override
	public int updateById(SystemUser entity) {
		SimpleReturn<Boolean> simpleReturn = this.check(entity);
		if (Boolean.FALSE.equals(simpleReturn.getState())) {
			throw new IllegalArgumentException(simpleReturn.getMsg().toString());
		}
		int i = super.updateById(entity);
		updateRoleRelation(entity);
		return i;
	}

	@Override
	public int updateFullById(SystemUser entity) {
		throw new UnsupportedOperationException("不支持的操作");
	}


	@Override
	public SimpleReturn<Boolean> check(SystemUser user) {
		if (StringUtils.isNotBlank(user.getUsername())) {
			if ("superAdmin".equalsIgnoreCase(user.getUsername())) {
				return new SimpleReturn<Boolean>(false, "用户名不应该为 superAdmin");
			}
			if ("anonymous".equalsIgnoreCase(user.getUsername())) {
				return new SimpleReturn<Boolean>(false, "用户名不应该为 anonymous");
			}
			SystemUser entity = new SystemUser();
			entity.setUsername(user.getUsername());
			if (user.getId() != null) {
				entity.setId(user.getId());
				entity.getBaseEntity().addNot("id");
			}
			int count = this.count(entity);
			if (count > 0) {
				return new SimpleReturn<Boolean>(false, "用户账号重复");
			}
		}
		if (user.getId() != null) {
			SystemUser entity = super.selectById(user.getId());
			if (entity == null) {
				String msg = "验证失败,id=" + user.getId() + "的用户不存在";
				return new SimpleReturn<Boolean>(false, msg);
			}
		}
		return new SimpleReturn<Boolean>(true);
	}

	@Override
	public SystemUser selectById(Long id) {
		SystemUser systemUser = super.selectById(id);
		if (systemUser == null) {
			return null;
		}
		List<SystemRole> roleList = systemRoleService.selectByUserId(systemUser.getId());
		systemUser.setRoleList(roleList);
		return systemUser;
	}

}

