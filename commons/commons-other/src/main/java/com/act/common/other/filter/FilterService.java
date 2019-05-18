
package com.act.common.other.filter;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;



/**
 * ClassName: FilterService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月12日 下午2:17:21 <br/>
 * @author   zhangpeng
 * @version

 * @see
 */
public class FilterService {

	private boolean isEnd = false;
	public void endConfig(){
		this.isEnd = true;
	}

	@SuppressWarnings("rawtypes")
	private Map<Class,List<Filter>> filtersMap = new HashMap<>();
	public synchronized <T> void addFilter(Class<T> clazz, Filter<T> filler){
		if (isEnd) {
			throw new IllegalStateException("初始化已经完毕，无法添加Filler");
		}
		@SuppressWarnings("rawtypes")
		List<Filter> filters = filtersMap.get(clazz);
		if (filters == null) {
			filters = new LinkedList<>();
			filtersMap.put(clazz, filters);
		}
		filters.add(filler);
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public <T> boolean doFilter(T o){
		if (!isEnd) {
			throw new IllegalStateException("过滤器尚未初始化完毕");
		}
		if (o==null) {
			return false;
		}
		List<Filter> fillers = filtersMap.get(o.getClass());
		for (Filter filler : fillers) {
			if (!filler.accept(o)) {
				return false;
			}
		}
		return true;
	}
}

