package com.act.framework.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.act.framework.basic.service.SingleTableMapper;
import com.act.framework.web.model.SystemMenu;

public interface SystemMenuMapper extends SingleTableMapper<SystemMenu> {

	List<SystemMenu> selectByUserId(@Param("userId") long userId);

	List<SystemMenu> getTopUseMenu(@Param("userId") Long userId);

	List<SystemMenu> selectFavorite(@Param("userId") Long userId);
}

