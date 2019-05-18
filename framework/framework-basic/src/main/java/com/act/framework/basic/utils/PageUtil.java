
package com.act.framework.basic.utils;

import java.util.List;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.code.Style;
import tk.mybatis.mapper.util.StringUtil;

/**
 * ClassName: PageUtil <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月9日 下午3:51:36 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class PageUtil {
	public static <T> com.github.pagehelper.Page<T> PageHelper(BaseEntity baseEntity){
		if (baseEntity.getCurrent()==null) {
			com.github.pagehelper.Page<T> page = new com.github.pagehelper.Page<T>(0, 0);
	        page.setReasonable(true);
	        page.setPageSizeZero(true);
	        return page;
		}
		if (baseEntity.getMultiSorts() != null && baseEntity.getMultiSorts().size() > 0) {//多字段排序
			String orderByClause = multiSorts(baseEntity.getMultiSorts(), null);
			if (StringUtils.isBlank(orderByClause)) {
				return PageHelper.startPage(baseEntity.getCurrent(),baseEntity.getPageSize());
			}
			
			return PageHelper.startPage(baseEntity.getCurrent(),baseEntity.getPageSize()).setOrderBy(orderByClause);
		}else{//单字段排序
			if (StringUtils.isNotBlank(baseEntity.getSortName()) && baseEntity.getOrder()!=null) {
				if(!Pattern.matches("[\\w_]{0,64}", baseEntity.getSortName())){
					throw new IllegalArgumentException("单字段排序错误，正确排序字段为0-64位字母或下划线");
				}
				
				return PageHelper.startPage(
						baseEntity.getCurrent(),
						baseEntity.getPageSize()
						).setOrderBy(baseEntity.getSortName()+" "+baseEntity.getOrder());
			}else{
				return PageHelper.startPage(
						baseEntity.getCurrent(),
						baseEntity.getPageSize()
						);
			}
		}
	}
	public static <T extends IBaseEntity> com.github.pagehelper.Page<T> PageHelper(IBaseEntity iBaseEntity){
		return PageHelper(iBaseEntity.getBaseEntity());
	}
	public static <T> com.github.pagehelper.Page<T> selectOne(){
		return PageHelper.startPage(1,1,false);
	}
	public static String multiSorts(List<String> multiSorts,Style style){
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i< multiSorts.size(); i++){
			//需要排序的字段
			String sort = multiSorts.get(i);
			if (StringUtils.isNotBlank(sort)){
				String[] sp = sort.split("\\s+");
				if (sp.length != 2) {
					throw new IllegalArgumentException("多字段排序参数格式错误");
				}
				if (!Pattern.matches("[\\w_]{0,64}", sp[0])) {
					throw new IllegalArgumentException("多字段排序错误，正确排序字段为0-64位字母或下划线");
				}
				if (!"ASC".equalsIgnoreCase(sp[1]) && !"DESC".equalsIgnoreCase(sp[1])) {
					throw new IllegalArgumentException("多字段排序规则错误，请指定正序或倒序");
				}
				
				//设置排序字段
				if(style != null){
					//将驼峰属性字段转换成下划线连接
					sb.append(StringUtil.convertByStyle(sp[0], style));
				}else{
					sb.append(sp[0]);
				}
				
				//设置排序规则
				sb.append(" ").append(sp[1]).append(" ,");
			}
		}
		
		String orderByClause = sb.toString();
		if (StringUtils.isNotBlank(orderByClause)){
			orderByClause = orderByClause.substring(0, orderByClause.length()-1);
		}
		return orderByClause;
	}
}

