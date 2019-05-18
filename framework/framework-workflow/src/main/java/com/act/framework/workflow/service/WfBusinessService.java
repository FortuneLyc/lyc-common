
package com.act.framework.workflow.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.act.common.constant.workflow.BusinessType;
import com.act.framework.basic.model.SimpleReturn;
import com.act.framework.basic.model.enums.OrderType;
import com.act.framework.basic.service.SingleTableService;
import com.act.framework.workflow.model.WfBusiness;
import com.act.framework.workflow.model.WfExecutable;
import com.act.framework.workflow.model.WfState;

/**
 * ClassName: UserRoleRelationService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月7日 下午5:39:07 <br/>
 * @author   lyc
 * @version

 * @see
 */
@Service
public class WfBusinessService extends SingleTableService<WfBusiness> {

	@Override
	public Class<WfBusiness> getGenericClazz() {
		return WfBusiness.class;
	}

	@Value("#{'${workflow.systemTypes:0,1}'.split(',')}")
	private List<Long> systemTypes;
	@PostConstruct
	private void init(){
		List<Long> list = systemTypes;
		delete(new WfBusiness());
		for (BusinessType bt : BusinessType.values()) {
			if (list.contains(bt.getSystemType())) {
				WfBusiness wfBusiness = new WfBusiness();
				wfBusiness.setBusinessType(bt);
				wfBusiness.setBusinessName(bt.getDescribe());
				insert(wfBusiness);
			}
		}
	}

	@Autowired
	private WfStateService wfStateService;
	@Autowired
	private ApplicationContext context;

	public SimpleReturn<Boolean> dispatch(WfExecutable executable){
		WfState currentState = getCurrentState(executable);
		if (currentState == null) {
			logger.error("流程参数配置错误，找不到对应的state，BusinessType:{} ; StateId:{}", executable.getWfExecutableModel().getBusinessType(), executable.getWfExecutableModel().getStateId());
			return new SimpleReturn<Boolean>(false, "流程参数配置错误，找不到对应的state");
		}
		if (StringUtils.isNotBlank(currentState.getClassAliax())) {
			WfAction action = null;
			try {
				action = context.getBean(currentState.getClassAliax(), WfAction.class);
				return action.execute(executable);
			} catch (BeansException e) {
				String msg = currentState.getClassAliax() + "不在容器中";
				logger.error(msg, e);
				return new SimpleReturn<Boolean>(false, msg);
			} catch (Exception e) {
				String msg = "工作流执行失败";
				logger.error(msg, e);
				return new SimpleReturn<Boolean>(false, msg);
			}
		}else{
			logger.error("流程参数配置错误，ClassAliax不应该为空，BusinessType:{} ; StateId:{}", executable.getWfExecutableModel().getBusinessType(), executable.getWfExecutableModel().getStateId());
			return new SimpleReturn<Boolean>(false, "流程参数配置错误，ClassAliax不应该为空");
		}
	}

	public WfState getCurrentState(WfExecutable executable) {
		WfState entity = new WfState();
		entity.setBusinessType(executable.getWfExecutableModel().getBusinessType());
		entity.setStateId(executable.getWfExecutableModel().getStateId());
		WfState result = null;
		try {
			result = wfStateService.selectOne(entity);
		} catch (TooManyResultsException e) {
			logger.error("流程参数配置错误，找到state结果超过一个，BusinessType:{} ; StateId:{}",executable.getWfExecutableModel().getBusinessType(), executable.getWfExecutableModel().getStateId());
		}
		return result;
	}

	public WfState getNextState(WfExecutable executable) {
		WfState wfCurrentState = getCurrentState(executable);
		if (!wfCurrentState.getNextStateIds().contains(executable.getWfExecutableModel().getNextStateId())) {
			logger.error("工作流配置错误，指定的下一步不在选择范围中");
			return null;
		}

		WfState entity = new WfState();
		entity.setBusinessType(executable.getWfExecutableModel().getBusinessType());
		entity.setStateId(executable.getWfExecutableModel().getNextStateId());
		WfState result = null;
		try {
			result = wfStateService.selectOne(entity);
		} catch (TooManyResultsException e) {
			logger.error("流程参数配置错误，找到state结果超过一个，BusinessType:{} ; StateId:{}",executable.getWfExecutableModel().getBusinessType(), executable.getWfExecutableModel().getStateId());
		}
		return result;
	}

	public WfBusiness selectDetailByBusinessType(BusinessType businessType) {
		WfBusiness businessEntity = new WfBusiness();
		businessEntity.setBusinessType(businessType);
		WfBusiness result = this.selectOne(businessEntity);
		if (result == null) {
			throw new IllegalArgumentException("找不到businessType=" + businessType + "对应的WfBusiness");
		}

		WfState stateEntity = new WfState();
		stateEntity.setBusinessType(businessType);
		stateEntity.getBaseEntity().setSortName("stateId").setOrder(OrderType.ASC);
		List<WfState> stateList = wfStateService.selectAll(stateEntity);
		stateList.sort((st1, st2) -> Boolean.TRUE.equals(st1.getIsHead())?-1:1);
		result.setStateList(stateList);
		if (stateList.size() > 0) {
			WfState first = stateList.get(0);
			Map<String, List<WfState>> stateMap = new HashMap<>();
			this.connectStateMap(first, stateList, stateMap);
			result.setStateMap(stateMap);
		}
		return result;
	}

	private void connectStateMap(WfState current, List<WfState> stateList, Map<String, List<WfState>> stateMap){
		ArrayList<String> nextStateIds = current.getNextStateIds();
		stateMap.putIfAbsent(current.getStateId(), new ArrayList<>());
		if (CollectionUtils.isNotEmpty(nextStateIds)) {
			for (String stateId : nextStateIds) {
				WfState next = stateList.stream().filter(state -> stateId.equals(state.getStateId())).findAny().get();
				stateMap.get(current.getStateId()).add(next);
				if (!stateMap.containsKey(next.getStateId())) {
					this.connectStateMap(next, stateList, stateMap);
				}
			}
		}
	}

}



























