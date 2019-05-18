
package com.act.framework.web.service;

import org.springframework.stereotype.Service;

import com.act.framework.basic.service.SingleTableService;
import com.act.framework.web.model.MyFavorite;

/**
 * ClassName:MyFavoriteService <br/>
 * Date:     2017年9月13日 下午1:41:21 <br/>
 * @author   feifan
 * @version
 * @since    JDK 1.8
 * @see
 */
@Service
public class MyFavoriteService extends SingleTableService<MyFavorite> {

	@Override
	public Class<MyFavorite> getGenericClazz() {
		return MyFavorite.class;
	}

	/**
	 * clickCount:(统计菜单点击次数). <br/>
	 *
	 * @author feifan
	 * @param entity
	 * @since JDK 1.8
	 */
	public void clickCount(MyFavorite entity){
		MyFavorite selectModel = new MyFavorite();
		selectModel.setMenuId(entity.getMenuId());
		selectModel.setUserId(entity.getUserId());
		MyFavorite one = this.selectOne(selectModel);
		if(one != null){ // 更新
			one.setClickCount(one.getClickCount()+1L);
			this.updateById(one);
		}else{ // 新增
			entity.setIsFavorite(false);
			entity.setClickCount(1L);
			this.insert(entity);
		}
	}

	/**
	 * addToFavorite:(加入收藏夹). <br/>
	 *
	 * @author feifan
	 * @since JDK 1.8
	 */
	public void addToFavorite(MyFavorite entity){
		MyFavorite selectModel = new MyFavorite();
		selectModel.setMenuId(entity.getMenuId());
		selectModel.setUserId(entity.getUserId());
		MyFavorite one = this.selectOne(selectModel);
		if(one != null){
			one.setIsFavorite(true);
			this.updateById(one);
		}else{
			entity.setIsFavorite(true);
			entity.setClickCount(0L);
			this.insert(entity);
		}
	}
}

