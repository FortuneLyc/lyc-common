package com.act.framework.basic.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.model.SimplePage;
import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.model.enums.OrderType;
import com.act.framework.basic.utils.PageUtil;

import tk.mybatis.mapper.code.Style;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
import tk.mybatis.mapper.entity.Example.OrderBy;

/**
 * ClassName:SingleTableService <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年10月27日 下午5:27:39 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
public abstract class SingleTableService<T> {
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	protected SingleTableMapper<T> mapper;

	@Value("${spring.datasource.identity}")
	private String identity;

	/**
	 *
	 * insert: 保存一个实体，null的属性不会保存，会使用数据库默认值. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @param entity
	 * @return
	 * @since JDK 1.7
	 */
	public int insert(T entity) {
		return mapper.singleTableInsertSelective(entity);
	}
	/**
	 *
	 * insertFull: 保存一个实体，<b>null值会被插入</b>. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @param entity
	 * @return
	 * @since JDK 1.7
	 */
	public int insertFull(T entity) {
		return mapper.insert(entity);
	}

	public Long getNewId() {
		return mapper.getNewId();
	}


	/**
	 *
	 * save: 保存一批实体，null也会被保存，并且 <b>使用MySQL数据库时 ID 不会回写</b>. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @param entityList
	 * @return
	 * @since JDK 1.7
	 */
	public int insertList(List<T> entityList) {
		switch (identity.toUpperCase()) {
		case "POSTGRE":
			return mapper.insertList(entityList);
		case "MYSQL":
			return mapper.insertList(entityList);
		case "ORACLE":

		default:
			int c = 0;
			for (T entity : entityList) {
				c+=mapper.singleTableInsert(entity);
			}
			return c;
		}

	}

	/**
	 *
	 * delete: 根据主键删除. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @return
	 * @since JDK 1.7
	 */
	public int deleteById(Long id) {
		if (id==null) {
			return 0;
		}
		return mapper.deleteByPrimaryKey(id);
	}

	/**
	 *
	 * delete: 根据实体属性作为条件进行删除，查询条件使用等号. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @param entity
	 * @return
	 * @since JDK 1.7
	 */
	public int delete(T entity) {
		if(entity==null){
			throw new IllegalArgumentException("删除操作不允许NULL条件");
		}
		return mapper.delete(entity);
	}

	/**
	 *
	 * update: 根据主键 <b>更新属性不为null的值</b>. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @param entity
	 * @return
	 * @since JDK 1.7
	 */
	public int updateById(T entity) {
		return mapper.updateByPrimaryKeySelective(entity);
	}
	/**
	 *
	 * updateFullById: 根据主键更新实体全部字段，<b>null值会被更新</b>. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @param entity
	 * @return
	 * @since JDK 1.7
	 */
	public int updateFullById(T entity) {
		return mapper.updateByPrimaryKey(entity);
	}

	/**
	 *
	 * getById: 根据主键字段进行查询. <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @return
	 * @since JDK 1.7
	 */
	public T selectById(Long id) {
		return mapper.selectByPrimaryKey(id);
	}

	/**
	 *
	 * selectOne: 根据实体中的属性进行查询，只能有一个返回值，有多个结果是抛出异常，查询条件使用等号 <br/>
	 * <br/>
	 *
	 * @author lyc
	 * @return
	 * @since JDK 1.7
	 */
	public T selectOne(T entity) {
		return mapper.selectOne(entity);
	}

	/**
	 *
	 * count: 根据实体中的属性进行查询,查询条件可以使用模糊匹配,不允许null值 <br/>
	 * <br/>
	 * @author lyc
	 * @param entity
	 * @return
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @since JDK 1.7
	 */
	public int count(T entity) {
		if (null == entity) {
			throw new IllegalArgumentException("不允许NULL值查询条件");
		}
		if (!(entity instanceof IBaseEntity)) {// 使用不支持模糊与分页的实体时
			return mapper.selectCount(entity);
		}
		try {
			IBaseEntity iBaseEntity = (IBaseEntity) entity;
			BaseEntity baseEntity = iBaseEntity.getBaseEntity();
			Class<?> clazz = entity.getClass();
			Example example = new Example(clazz);

			if (CollectionUtils.isEmpty(baseEntity.getLike())
					&& CollectionUtils.isEmpty(baseEntity.getNot())
					&& CollectionUtils.isEmpty(baseEntity.getGt())
					&& CollectionUtils.isEmpty(baseEntity.getLt())
					&& CollectionUtils.isEmpty(baseEntity.getGet())
					&& CollectionUtils.isEmpty(baseEntity.getLet())
					&& CollectionUtils.isEmpty(baseEntity.getNotNull())
					&& CollectionUtils.isEmpty(baseEntity.getIsNull())
					) {// 无模糊查询时
				example.or().andEqualTo(entity);
				return mapper.selectCountByExample(example);
			}

			// 排除不需要模糊查询的属性列表
			Set<String> conditionPropertySet = new HashSet<String>();
			if (baseEntity.getLike() != null) {
				conditionPropertySet.addAll(baseEntity.getLike());
			}
			if (baseEntity.getNot() != null) {
				conditionPropertySet.addAll(baseEntity.getNot());
			}
			if (baseEntity.getGt() != null) {
				conditionPropertySet.addAll(baseEntity.getGt());
			}
			if (baseEntity.getLt() != null) {
				conditionPropertySet.addAll(baseEntity.getLt());
			}
			if (baseEntity.getGet() != null) {
				conditionPropertySet.addAll(baseEntity.getGet());
			}
			if (baseEntity.getLet() != null) {
				conditionPropertySet.addAll(baseEntity.getLet());
			}

			Object target = clazz.newInstance();

			BeanUtils.copyProperties(entity, target, conditionPropertySet.toArray(new String[] {}));
			Criteria criteria = example.or().andEqualTo(target);

			if (baseEntity.getLike() != null) {
				for (String property : baseEntity.getLike()) {
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					if (value instanceof String) {
						String stringVal = (String) value;
						if (StringUtils.isBlank(stringVal)) {
							continue;
						}
						criteria.andLike(property, "%" + stringVal + "%");
					} else if (value != null) {
						throw new IllegalArgumentException("只有String属性可以使用Like查询");
					}
				}
			}
			if (baseEntity.getNot() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getNot()) {
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andNotEqualTo(property, value);
				}
			}
			if (baseEntity.getGt() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getGt()) {
					String real = StringUtils.removeEnd(property, "After");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andGreaterThan(real, value);
				}
			}
			if (baseEntity.getLt() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getLt()) {
					String real = StringUtils.removeEnd(property, "Before");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andLessThan(real, value);
				}
			}
			if (baseEntity.getGet() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getGet()) {
					String real = StringUtils.removeEnd(property, "After");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andGreaterThanOrEqualTo(real, value);
				}
			}
			if (baseEntity.getLet() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getLet()) {
					String real = StringUtils.removeEnd(property, "Before");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andLessThanOrEqualTo(real, value);
				}
			}
			if (baseEntity.getNotNull() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getNotNull()) {
					criteria.andIsNotNull(property);
				}
			}
			if (baseEntity.getIsNull() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getIsNull()) {
					criteria.andIsNull(property);
				}
			}

			return mapper.selectCountByExample(example);
		} catch (Exception e) {
			logger.error("",e);
			throw new IllegalArgumentException("COUNT错误",e);
		}
	}

	/**
	 *
	 * selectAll: 单表全表查询，据实体中的属性值进行查询，查询条件使用等号。保证空值也有空的集合，不会为NULL. <br/>
	 * <br/>
	 * @author lyc
	 * @param entity
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	public List<T> selectAll(T entity) {
		if (null == entity) {
			return new ArrayList<T>((mapper.selectAll()));
		}
		if (!(entity instanceof IBaseEntity)) {// 使用不支持模糊与分页的实体时
			return new ArrayList<T>(mapper.select(entity));
		}
		IBaseEntity iBaseEntity = (IBaseEntity) entity;
		BaseEntity baseEntity = iBaseEntity.getBaseEntity();
		baseEntity.setCurrent(0).setPageSize(Integer.MAX_VALUE);
		return selectPage(entity).getRows();
	}

	/**
	 * 单表分页查询，结果中包含count值，不需要单独调用count方法，据实体中的属性值进行查询，查询条件使用等号。保证空值也有空的集合，不会为NULL
	 *
	 * @return
	 */
	public SimplePage<T> selectPage(T entity) {
		if (null == entity) {
			return new SimplePage<T>(mapper.selectAll());
		}
		if (!(entity instanceof IBaseEntity)) {// 使用不支持模糊与分页的实体时
			return new SimplePage<T>(mapper.select(entity));
		}

		IBaseEntity iBaseEntity = (IBaseEntity) entity;
		BaseEntity baseEntity = iBaseEntity.getBaseEntity();
		RowBounds rowBounds = null;
		if (baseEntity.getCurrent() != null && baseEntity.getPageSize() != null) {
			rowBounds = new RowBounds((baseEntity.getCurrent() - 1) * baseEntity.getPageSize(),
					baseEntity.getPageSize());
		}
		Class<?> clazz = entity.getClass();
		Example example = new Example(clazz);

		//单字段排序
		String sortName = baseEntity.getSortName();
		//多字段排序
		List<String> multiSorts = baseEntity.getMultiSorts();
		if (multiSorts == null) {//多字段为空排序以单字段排序，多字段排序不为空以多字段排序
			if (StringUtils.isNotBlank(sortName)) {
				OrderBy order = example.orderBy(sortName);
				if (OrderType.ASC.equals(baseEntity.getOrder())) {
					order.asc();
				} else {
					order.desc();
				}
			}
		}else{
			String orderByClause = PageUtil.multiSorts(baseEntity.getMultiSorts(),Style.camelhump);
			if (StringUtils.isNotBlank(orderByClause)) example.setOrderByClause(orderByClause);
		}

		if (CollectionUtils.isEmpty(baseEntity.getLike())
				&& CollectionUtils.isEmpty(baseEntity.getNot())
				&& CollectionUtils.isEmpty(baseEntity.getGt())
				&& CollectionUtils.isEmpty(baseEntity.getLt())
				&& CollectionUtils.isEmpty(baseEntity.getGet())
				&& CollectionUtils.isEmpty(baseEntity.getLet())
				&& CollectionUtils.isEmpty(baseEntity.getNotNull())
				&& CollectionUtils.isEmpty(baseEntity.getIsNull())
				) {// 无模糊查询时
			example.createCriteria().andEqualTo(entity);
			if (null == rowBounds) {
				return new SimplePage<T>(mapper.selectByExample(example));
			}
			com.github.pagehelper.Page<T> rows = (com.github.pagehelper.Page<T>) mapper.selectByExampleAndRowBounds(example, rowBounds);
			return new SimplePage<T>(rows,rows.getTotal());
		}

		// 排除不需要模糊查询的属性列表
		Set<String> conditionPropertySet = new HashSet<String>();
		if (baseEntity.getLike() != null) {
			conditionPropertySet.addAll(baseEntity.getLike());
		}
		if (baseEntity.getNot() != null) {
			conditionPropertySet.addAll(baseEntity.getNot());
		}
		if (baseEntity.getGt() != null) {
			conditionPropertySet.addAll(baseEntity.getGt());
		}
		if (baseEntity.getLt() != null) {
			conditionPropertySet.addAll(baseEntity.getLt());
		}
		if (baseEntity.getGet() != null) {
			conditionPropertySet.addAll(baseEntity.getGet());
		}
		if (baseEntity.getLet() != null) {
			conditionPropertySet.addAll(baseEntity.getLet());
		}
		try {
			Object target = clazz.newInstance();
			BeanUtils.copyProperties(entity, target, conditionPropertySet.toArray(new String[] {}));
			Criteria criteria = example.createCriteria().andEqualTo(target);

			if (baseEntity.getLike() != null) {
				for (String property : baseEntity.getLike()) {
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					if (value instanceof String) {
						String stringVal = (String) value;
						if (StringUtils.isBlank(stringVal)) {
							continue;
						}
						criteria.andLike(property, "%" + stringVal + "%");
					} else if (value != null) {
						throw new IllegalArgumentException("只有String属性可以使用Like查询");
					}
				}
			}
			if (baseEntity.getNot() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getNot()) {
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andNotEqualTo(property, value);
				}
			}
			if (baseEntity.getGt() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getGt()) {
					String real = StringUtils.removeEnd(property, "After");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andGreaterThan(real, value);
				}
			}
			if (baseEntity.getLt() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getLt()) {
					String real = StringUtils.removeEnd(property, "Before");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andLessThan(real, value);
				}
			}
			if (baseEntity.getGet() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getGet()) {
					String real = StringUtils.removeEnd(property, "After");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andGreaterThanOrEqualTo(real, value);
				}
			}
			if (baseEntity.getLet() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getLet()) {
					String real = StringUtils.removeEnd(property, "Before");
					Object value = PropertyUtils.getSimpleProperty(entity, property);
					criteria.andLessThanOrEqualTo(real, value);
				}
			}
			if (baseEntity.getNotNull() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getNotNull()) {
					criteria.andIsNotNull(property);
				}
			}
			if (baseEntity.getIsNull() != null) {// 注意这里会出现 条件 不为空的情况。
				for (String property : baseEntity.getIsNull()) {
					criteria.andIsNull(property);
				}
			}
		}catch(Exception e){
			logger.error("",e);
			throw new IllegalArgumentException("分页错误",e);
		}

		if (null == rowBounds) {
			return new SimplePage<T>(mapper.selectByExample(example));
		}
		com.github.pagehelper.Page<T> rows = (com.github.pagehelper.Page<T>) mapper.selectByExampleAndRowBounds(example, rowBounds);
		return new SimplePage<T>(rows,rows.getTotal());
	}

	public SimpleReturn<Boolean> check(T entity){
		return new SimpleReturn<Boolean>(true);
	}

	public abstract Class<T> getGenericClazz();

}

