
package com.act.framework.web.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ClassName:收藏夹 <br/>
 * Date:     2017年9月13日 上午10:50:37 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@Table(name="tb_my_favorites")
public class MyFavorite {

	/**
	 * id:(主键).
	 * @since JDK 1.8
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	/**
	 * userId:(用户ID).
	 * @since JDK 1.8
	 */
	private Long userId;
	
	/**
	 * menuId:(菜单ID).
	 * @since JDK 1.8
	 */
	private Long menuId;
	
	/**
	 * clickCount:(点击次数).
	 * @since JDK 1.8
	 */
	private Long clickCount;
	
	/**
	 * isFavorite:(是否加入收藏夹).
	 * @since JDK 1.8
	 */
	private Boolean isFavorite;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getClickCount() {
		return clickCount;
	}

	public void setClickCount(Long clickCount) {
		this.clickCount = clickCount;
	}

	public Boolean getIsFavorite() {
		return isFavorite;
	}

	public void setIsFavorite(Boolean isFavorite) {
		this.isFavorite = isFavorite;
	}
	
}

