package com.act.framework.basic.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Transient;

import com.act.framework.basic.model.enums.OrderType;

/**
 * ClassName:BaseModel <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年10月19日 下午6:48:52 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
public class BaseEntity implements Serializable{
	private static final long serialVersionUID = -3149208181925333039L;

	public BaseEntity() {
		super();
	}
	public BaseEntity(String sortName) {
		super();
		this.sortName = sortName;
	}
	/**
	 * 当前页
	 */
	@Transient
	private Integer current=1;
	@Transient
	private Integer pageSize=15;
	@Transient
	private String sortName;
	@Transient
	private List<String> multiSorts;
	@Transient
	private OrderType order;
	@Transient
	private List<String> like;
	@Transient
	private List<String> not;
	@Transient
	private List<String> gt;
	@Transient
	private List<String> lt;
	@Transient
	private List<String> get;
	@Transient
	private List<String> let;
	@Transient
	private List<String> notNull;
	@Transient
	private List<String> isNull;

	public BaseEntity setNoPageNoSort(){
		this.current = null;
		this.pageSize = null;
		this.sortName = null;
		this.order = null;
		return this;
	}


	public Integer getPageSize() {
		return pageSize;
	}
	public BaseEntity setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
		return this;
	}
	public List<String> getLike() {
		return like;
	}
	public BaseEntity setLike(List<String> like) {
		this.like = like;
		return this;
	}
	public BaseEntity addLike(String... like) {
		if (this.like == null) {
			this.like = new ArrayList<>();
		}
		this.like.addAll(Arrays.asList(like));
		return this;
	}
	public List<String> getNot() {
		return not;
	}
	public BaseEntity setNot(List<String> not) {
		this.not = not;
		return this;
	}
	public BaseEntity addNot(String... not) {
		if (this.not == null) {
			this.not = new ArrayList<>();
		}
		this.not.addAll(Arrays.asList(not));
		return this;
	}
	public List<String> getGt() {
		return gt;
	}
	public BaseEntity setGt(List<String> gt) {
		this.gt = gt;
		return this;
	}
	public BaseEntity addGt(String... gt) {
		if (this.gt == null) {
			this.gt = new ArrayList<>();
		}
		this.gt.addAll(Arrays.asList(gt));
		return this;
	}
	public List<String> getLt() {
		return lt;
	}
	public BaseEntity setLt(List<String> lt) {
		this.lt = lt;
		return this;
	}
	public BaseEntity addLt(String... lt) {
		if (this.lt == null) {
			this.lt = new ArrayList<>();
		}
		this.lt.addAll(Arrays.asList(lt));
		return this;
	}
	public List<String> getGet() {
		return get;
	}
	public BaseEntity setGet(List<String> get) {
		this.get = get;
		return this;
	}
	public BaseEntity addGet(String... get) {
		if (this.get == null) {
			this.get = new ArrayList<>();
		}
		this.get.addAll(Arrays.asList(get));
		return this;
	}
	public List<String> getLet() {
		return let;
	}
	public BaseEntity setLet(List<String> let) {
		this.let = let;
		return this;
	}
	public BaseEntity addLet(String... let) {
		if (this.let == null) {
			this.let = new ArrayList<>();
		}
		this.let.addAll(Arrays.asList(let));
		return this;
	}
	public Integer getCurrent() {
		return current;
	}
	public BaseEntity setCurrent(Integer current) {
		if (null!=current) {
			this.current = current;
			if (current<=0) {
				this.current=1;
			}
		}
		return this;
	}
	public String getSortName() {
		return sortName;
	}
	public BaseEntity setSortName(String sortName) {
		this.sortName = sortName;
		return this;
	}
	public OrderType getOrder() {
		return order;
	}
	public BaseEntity setOrder(OrderType order) {
		this.order = order;
		return this;
	}
	public List<String> getNotNull() {
		return notNull;
	}
	public BaseEntity setNotNull(List<String> notNull) {
		this.notNull = notNull;
		return this;
	}
	public BaseEntity addNotNull(String... notNull) {
		if (this.notNull == null) {
			this.notNull = new ArrayList<>();
		}
		this.notNull.addAll(Arrays.asList(notNull));
		return this;
	}
	public List<String> getIsNull() {
		return isNull;
	}
	public BaseEntity setIsNull(List<String> isNull) {
		this.isNull = isNull;
		return this;
	}
	public BaseEntity addIsNull(String... isNull) {
		if (this.isNull == null) {
			this.isNull = new ArrayList<>();
		}
		this.isNull.addAll(Arrays.asList(isNull));
		return this;
	}
	public List<String> getMultiSorts() {
		return multiSorts;
	}
	public void setMultiSorts(List<String> multiSorts) {
		this.multiSorts = multiSorts;
	}

}
