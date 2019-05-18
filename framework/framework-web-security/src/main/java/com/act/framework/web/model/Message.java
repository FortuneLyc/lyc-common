
package com.act.framework.web.model;

import java.util.Date;

import javax.persistence.Table;
import javax.persistence.Transient;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName:Message <br/>
 * Date:     2017年11月15日 上午10:54:53 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@Table(name="message_info")
public class Message implements IBaseEntity {

	/**
	 * id:(自增id).
	 * @since JDK 1.8
	 */
	private Long id;
	
	/**
	 * userId:(用户ID).
	 * @since JDK 1.8
	 */
	private Long userId;
	
	/**
	 * title:(消息标题).
	 * @since JDK 1.8
	 */
	private String title;
	
	/**
	 * content:(消息内容).
	 * @since JDK 1.8
	 */
	private String content;
	
	/**
	 * createTime:(消息创建时间).
	 * @since JDK 1.8
	 */
	private Date createTime;
	
	/**
	 * isRead:(是否已读).
	 * @since JDK 1.8
	 */
	private Boolean isRead;
	
	@JSONField(serialize = false)
	@Transient
	private BaseEntity baseEntity;
	@Override
	public BaseEntity getBaseEntity() {
		if (this.baseEntity==null) {
			this.baseEntity = new BaseEntity();
		}
		return baseEntity;
	}
	@Override
	public void setBaseEntity(BaseEntity baseEntity) {
		this.baseEntity = baseEntity;
	}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
	
	
}

