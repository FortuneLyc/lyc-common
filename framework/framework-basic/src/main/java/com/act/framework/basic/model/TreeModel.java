package com.act.framework.basic.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.act.framework.basic.model.enums.TreeNodeType;

/**
 * ClassName: TreeModel <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年10月29日 下午6:56:37 <br/>
 * @author   lyc
 * @version

 * @see
 */
public abstract class TreeModel<T extends TreeModel<T>> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Long fatherId;
	private Long orderNum;
	private TreeNodeType treeNodeType;


	@Transient
	private List<T> children;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getFatherId() {
		return fatherId;
	}

	public void setFatherId(Long fatherId) {
		this.fatherId = fatherId;
	}

	public TreeNodeType getTreeNodeType() {
		return treeNodeType;
	}

	public void setTreeNodeType(TreeNodeType treeNodeType) {
		this.treeNodeType = treeNodeType;
	}

	public List<T> getChildren() {
		return children;
	}

	public void setChildren(List<T> children) {
		this.children = children;
	}

	public void addChild(T child){
		if (this.children == null) {
			this.children = new ArrayList<>();
		}
		this.children.add(child);
	}

	@Override
	public int hashCode() {
		if (id==null) {
			return 0;
		}
		return id.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (obj == this) {
			return true;
		}
		if (obj.getClass() != getClass()) {
			return false;
		}
		@SuppressWarnings("unchecked")
		TreeModel<T> rhs = (TreeModel<T>) obj;
		if (rhs.getId() == null || this.id == null) {
			return false;
		}
		return rhs.getId().equals(id);
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
}

