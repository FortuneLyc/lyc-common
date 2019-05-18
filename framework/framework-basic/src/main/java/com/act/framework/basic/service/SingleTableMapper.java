package com.act.framework.basic.service;

import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.SelectProvider;

import com.act.framework.basic.conf.db.util.SequenceProvider;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SingleTableMapper<T> extends Mapper<T>, MySqlMapper<T> {

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param record
     * @return
     */
    @InsertProvider(type = SequenceProvider.class, method = "dynamicSQL")
    int singleTableInsertSelective(T record);

    /**
     * 保存一个实体，null的属性也会保存，不会使用数据库默认值
     *
     * @param record
     * @return
     */
    @InsertProvider(type = SequenceProvider.class, method = "dynamicSQL")
    int singleTableInsert(T record);

    /**
     * 根据实体中的属性查询总数，查询条件使用等号
     *
     * @param record
     * @return
     */
    @SelectProvider(type = SequenceProvider.class, method = "dynamicSQL")
    Long getNewId();
}
