/**
 * Project Name:web-framework-base
 * File Name:GreetingCtrl.java
 * Package Name:com.act.framework.web.base.ctrl
 * Date:2016年10月13日下午5:51:26
 *
*/

package com.act.framework.web.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.model.TreeModel;
import com.act.framework.basic.service.SingleTreeTableService;
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
public abstract class BaseTreeCtrl<T extends TreeModel<T>> extends BaseCtrl<T> {

	@Autowired
	private SingleTreeTableService<T> singleTreeTableService;

	@ControllerLog(format="获取全部树结构", type=LogType.Select)
	@RequestMapping(path="/selectAllTree")
	public T selectAllTree(HttpServletRequest request, HttpServletResponse response){
		try {
			T o = singleTreeTableService.selectAllTree();
			if(null == o){
				throw new IllegalArgumentException("获取树结构失败");
			}
			return o;
		} catch (Exception e) {
			throw new ApiHandleException("获取树结构失败",e);
		}
	}

	@ControllerLog(format="添加或者修改单条数据", type=LogType.Update)
	@Transactional
	@RequestMapping(path="/insertOrUpdate",method={RequestMethod.POST})
	public SimpleReturn<Boolean> insertOrUpdate(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		SimpleReturn<Boolean> result = singleTreeTableService.check(entity);
		if (Boolean.TRUE.equals(result.getState())) {
			try {
				if (entity.getId()==null) {
					singleTreeTableService.insert(entity);
				}else{
					singleTreeTableService.updateById(entity);
				}
				return new SimpleReturn<Boolean>(true);
			}  catch (Exception e) {
				throw new ApiHandleException("无法保存",e);
			}
		}else{
			return result;
		}
	}

	@ControllerLog(format="验证菜单参数", type=LogType.Select)
	@RequestMapping(method={RequestMethod.POST})
	public SimpleReturn<Boolean> check(@RequestBody T entity, HttpServletRequest request, HttpServletResponse response) {
		return singleTreeTableService.check(entity);
	}
}
