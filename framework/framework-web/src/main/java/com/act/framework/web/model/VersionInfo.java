
package com.act.framework.web.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.act.framework.basic.model.BaseEntity;
import com.act.framework.basic.model.IBaseEntity;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * ClassName:VersionInfo <br/>
 * Date:     2017年9月30日 下午3:03:17 <br/>
 * @author   feifan
 * @version  
 * @since    JDK 1.8
 * @see 	 
 */
@Table(name="version_info")
public class VersionInfo implements IBaseEntity {

	/**
	 * id:(主键).
	 * @since JDK 1.8
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	/**
	 * versionNo:(版本号).
	 * @since JDK 1.8
	 */
	private String versionNo;
	
	/**
	 * versionContent:(版本说明).
	 * @since JDK 1.8
	 */
	private String versionContent;
	
	/**
	 * name:(组件名称).
	 * @since JDK 1.8
	 */
	private String name;
	
	/**
	 * systemName:(子系统名称).
	 * @since JDK 1.8
	 */
	private String systemName;
	
	/**
	 * reportDate:(上报时间).
	 * @since JDK 1.8
	 */
	private Date reportDate;
	
	/**
	 * generalNo:(总版本号).
	 * @since JDK 1.8
	 */
	private String generalNo;
	
	/**
	 * displayLabel:(页面展示label).
	 * @since JDK 1.8
	 */
	private String displayLabel;
	
	/**
	 * firstReportDate:(首次上报时间).
	 * @since JDK 1.8
	 */
	private Date firstReportDate;
	
	/**
	 * isVisible:(是否展示).
	 * @since JDK 1.8
	 */
	private Boolean isVisible;
	
	/**
	 * publishDate:(发行时间).
	 * @since JDK 1.8
	 */
	private String publishDate;
	
	@JSONField(serialize = false)
	@Transient
	private BaseEntity baseEntity;
	@Override
	public BaseEntity getBaseEntity() {
		if (this.baseEntity == null) {
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

	public String getVersionNo() {
		return versionNo;
	}

	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}

	public String getVersionContent() {
		return versionContent;
	}

	public void setVersionContent(String versionContent) {
		this.versionContent = versionContent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getGeneralNo() {
		return generalNo;
	}

	public void setGeneralNo(String generalNo) {
		this.generalNo = generalNo;
	}

	public String getDisplayLabel() {
		return displayLabel;
	}

	public void setDisplayLabel(String displayLabel) {
		this.displayLabel = displayLabel;
	}

	public Date getFirstReportDate() {
		return firstReportDate;
	}

	public void setFirstReportDate(Date firstReportDate) {
		this.firstReportDate = firstReportDate;
	}

	public Boolean getIsVisible() {
		return isVisible;
	}

	public void setIsVisible(Boolean isVisible) {
		this.isVisible = isVisible;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	
}

