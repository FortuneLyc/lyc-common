/**
 * Project Name:web-framework-base
 * File Name:GreetingCtrl.java
 * Package Name:com.act.framework.web.base.ctrl
 * Date:2016年10月13日下午5:51:26
 *
*/

package com.act.framework.web.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.act.framework.basic.model.SimplePage;
import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.aop.mvclog.ControllerLog;
import com.act.framework.web.exception.ApiHandleException;
import com.act.framework.web.model.enums.LogType;

/**
 * ClassName: BaseCtrl <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年10月13日 下午5:51:26 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
public abstract class BaseCtrl<T> {
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SingleTableService<T> singleTableService;

	@ControllerLog(format="根据主键获取数据", type=LogType.Select)
	@RequestMapping(path="/selectById")
	public T selectById(@RequestParam("id")long id, HttpServletRequest request, HttpServletResponse response) {
		try {
			T o = singleTableService.selectById(id);
			if(null == o){
				throw new IllegalArgumentException("ID:"+id+" 找不到对应的实体"+singleTableService.getGenericClazz());
			}
			return o;
		} catch (Exception e) {
			throw new ApiHandleException("获取单个数据失败",e);
		}
	}

	/**
	 * getByParams: 根据指定参数查询单个结果<br/>
	 * <br/>
	 * @author congyajing
	 * @param modelName
	 * @param param
	 * @return
	 * @since JDK 1.7
	 */
	@ControllerLog(format="根据条件获取数据", type=LogType.Select)
	@RequestMapping(path="/selectOne",method={RequestMethod.POST}, consumes = {"application/json"})
	public T selectOne(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			return singleTableService.selectOne(entity);
		} catch (Exception e) {
			throw new ApiHandleException("无法查询",e);
		}
	}

	@ControllerLog(format="添加非空字段数据",type=LogType.Insert)
	@Transactional
	@RequestMapping(path="/insert",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Boolean> insert(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			singleTableService.insert(entity);
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法保存",e);
		}
	}
	@ControllerLog(format="添加完整数据",type=LogType.Insert)
	@Transactional
	@RequestMapping(path="/insertFull",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Boolean> insertFull(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			singleTableService.insertFull(entity);
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法保存",e);
		}
	}

	@ControllerLog(format="根据主键更新非空字段数据",type=LogType.Update)
	@Transactional
	@RequestMapping(path="/update",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Boolean> update(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			singleTableService.updateById(entity);
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法保存",e);
		}
	}

	@ControllerLog(format="根据主键更新全部字段数据",type=LogType.Update)
	@Transactional
	@RequestMapping(path="/updateFull",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Boolean> updateFull(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			singleTableService.updateFullById(entity);
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法保存",e);
		}
	}

	@ControllerLog(format="根据主键删除数据",type=LogType.Delete)
	@Transactional
	@RequestMapping(path="/deleteById",method={RequestMethod.POST})
	public SimpleReturn<Boolean> deleteById(@RequestParam("id")long id, HttpServletRequest request, HttpServletResponse response) {
		try {
			singleTableService.deleteById(id);
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法删除",e);
		}
	}
	@ControllerLog(format="根据主键删除多条数据",type=LogType.Delete)
	@Transactional
	@RequestMapping(path="/deleteByIds",method={RequestMethod.POST})
	public SimpleReturn<Boolean> deleteByIds(@RequestParam("ids[]")long[] ids, HttpServletRequest request, HttpServletResponse response) {
		try {
			for (long id : ids) {
				singleTableService.deleteById(id);
			}
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法删除",e);
		}
	}

	@ControllerLog(format="根据条件删除数据",type=LogType.Delete)
	@Transactional
	@RequestMapping(path="/delete",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Boolean> delete(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			singleTableService.delete(entity);
			return new SimpleReturn<Boolean>(true);
		} catch (Exception e) {
			throw new ApiHandleException("无法删除",e);
		}
	}

	@ControllerLog(format="根据条件获取列表分页数据", type=LogType.Select)
	@RequestMapping(path="/selectPage",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimplePage<T> selectPage(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			return singleTableService.selectPage(entity);
		} catch (Exception e) {
			throw new ApiHandleException("无法查询",e);
		}
	}

	@ControllerLog(format="根据条件获取匹配数量", type=LogType.Select)
	@RequestMapping(path="/count",method={RequestMethod.POST}, consumes = {"application/json"})
	public SimpleReturn<Integer> count(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			int i = singleTableService.count(entity);
			return new SimpleReturn<Integer>(i);
		} catch (Exception e) {
			throw new ApiHandleException("无法查询",e);
		}
	}

	/**
	 * listAll: 根据指定参数进行查询，返回多个结果 <br/>
	 * <br/>
	 * @author congyajing
	 * @param modelName
	 * @param param
	 * @return 集合
	 * @since JDK 1.7
	 */
	@ControllerLog(format="根据条件获取列表全量数据", type=LogType.Select)
	@RequestMapping(path="/selectAll",method={RequestMethod.POST},consumes = {"application/json"})
	public List<T> selectAll(@RequestBody(required=false) T entity, HttpServletRequest request, HttpServletResponse response) {
		try {
			return singleTableService.selectAll(entity);
		} catch (Exception e) {
			throw new ApiHandleException("无法查询",e);
		}
	}
}
