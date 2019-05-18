
package com.act.framework.web.vo;

import com.act.framework.web.model.SystemMenu;

/**
 * ClassName:FavoriteMenuVo <br/>
 * Date:     2017年9月13日 下午4:36:52 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
public class FavoriteMenuVo extends SystemMenu {
	
	private static final long serialVersionUID = 4077884901612362638L;

	private Long favoriteId;

	public Long getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Long favoriteId) {
		this.favoriteId = favoriteId;
	}
	
	
}

