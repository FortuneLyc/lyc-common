package com.act.framework.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.act.framework.basic.service.SingleTableMapper;
import com.act.framework.web.model.SystemRole;

public interface SystemRoleMapper extends SingleTableMapper<SystemRole> {

	public List<SystemRole> selectByUserId(@Param("userId") long userId);

}

