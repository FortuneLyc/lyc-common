
package com.act.framework.basic.service;

import java.util.Comparator;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;

import com.act.framework.basic.model.IBaseEntity;
import com.act.framework.basic.model.TreeModel;
import com.act.framework.basic.model.enums.OrderType;
import com.act.framework.basic.model.enums.TreeNodeType;

/**
 * ClassName: SingleTreeTableService <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年6月13日 上午11:45:46 <br/>
 * @author   lyc
 * @version

 * @see
 */
public abstract class SingleTreeTableService<T extends TreeModel<T>> extends SingleTableService<T> {


	public T selectAllTree(){
		try {
			T t = this.selectById(1L);
			if (t == null) {
				throw new IllegalStateException("必须有一个根节点");
			}
			fillChildren(t);
			return t;
		} catch (Exception e) {
			logger.error("错误",e);
		}
		return null;
	}

	protected T selectToRootTree(T leaf){
		if (TreeNodeType.Root.equals(leaf.getTreeNodeType())) {
			return leaf;
		}
		T father = selectById(leaf.getFatherId());
		if (father == null) {
			throw new IllegalStateException("发现没有父节点的叶子节点");
		}
		father.addChild(leaf);
		return selectToRootTree(father);
	}

	public static <R extends TreeModel<R>> void combineSingleNodeToSameNodeTree(TreeModel<R> combined, TreeModel<R> singleNodeFromRootTree){
		if (!combined.equals(singleNodeFromRootTree)) {
			return;
		}
		if (CollectionUtils.isEmpty(combined.getChildren())) {
			combined.setChildren(singleNodeFromRootTree.getChildren());
			return;
		}
		if (CollectionUtils.isEmpty(singleNodeFromRootTree.getChildren())) {
			return;
		}
		if (!combined.getChildren().contains(singleNodeFromRootTree.getChildren().get(0))) {
			combined.getChildren().addAll(singleNodeFromRootTree.getChildren());
			combined.getChildren().sort(Comparator.comparingLong(TreeModel::getOrderNum));
			return;
		}
		List<R> combinedChildren = combined.getChildren();
		R singleNodeChild = singleNodeFromRootTree.getChildren().get(0);
		combineSingleNodeToSameNodeTree(combinedChildren.get(combinedChildren.indexOf(singleNodeChild)), singleNodeChild);
	}


	protected void fillChildren(T father) {
		try {
			if (!father.getTreeNodeType().equals(TreeNodeType.Leaf)) {
				T child = getGenericClazz().newInstance();
				child.setFatherId(father.getId());
				if (child instanceof IBaseEntity) {
					((IBaseEntity)child).getBaseEntity().setSortName("orderNum").setOrder(OrderType.ASC);
				}
				List<T> children = super.selectAll(child);
				children.removeIf(t -> TreeNodeType.Root.equals(t.getTreeNodeType()) || t.getId().equals(father.getId()));
				if (children.size()>0) {
					father.setChildren(children);
					for (T cc : children) {
						fillChildren(cc);
					}
				}
			}
		} catch (Exception e) {
			logger.error("错误",e);
		}
	}

	@Override
	public int insert(T entity) {
		entity.setId(null);
		if (entity.getFatherId() == null) {
			throw new IllegalArgumentException("tree实体必须有fatherId");
		}
		if (TreeNodeType.Root.equals(entity.getTreeNodeType())) {
			throw new IllegalArgumentException("不允许插入根节点，请直接在数据库初始化准备好");
		}
		entity.setTreeNodeType(TreeNodeType.Leaf);
		T father = selectById(entity.getFatherId());
		if (TreeNodeType.Leaf.equals(father.getTreeNodeType())) {
			father.setTreeNodeType(TreeNodeType.Branch);
			super.updateById(father);
		}

		return super.insert(entity);
	}

	@Override
	public int insertList(List<T> entityList) {
		int i = 0;
		for (T t : entityList) {
			i+=insert(t);
		}
		return i;
	}

	@Override
	public int deleteById(Long id) {
		T t = selectById(id);
		if (t==null) {
			return 0;
		}
		fillChildren(t);
		return deleteRecursive(t);
	}

	private int deleteRecursive(T t){
		int i = 0;
		if (!CollectionUtils.isEmpty(t.getChildren())) {
			for (T child : t.getChildren()) {
				i+=deleteRecursive(child);
			}
		}
		if (TreeNodeType.Root.equals(t.getTreeNodeType())) {
			logger.warn("不能删除根节点");
			return i;
		}
		return i+super.deleteById(t.getId());
	}

	@Override
	public int updateById(T entity) {
		if (entity.getId()==null) {
			logger.warn("id为必填项，直接退出");
			return 0;
		}
		if (TreeNodeType.Root.equals(entity.getTreeNodeType())) {
			logger.warn("不能修改根节点属性，已将根节点属性置空后继续");
			entity.setTreeNodeType(null);
		}
		if (entity.getFatherId()!=null) {
			logger.warn("不能修改FatherId，已将Father置空后继续");
			entity.setFatherId(null);
		}
		T t = selectById(entity.getId());
		if (t!=null && TreeNodeType.Root.equals(t.getTreeNodeType()) && entity.getTreeNodeType() != null && !TreeNodeType.Root.equals(entity.getTreeNodeType())) {
			logger.warn("不能将根节点修改为非根节点");
			return 0;
		}
		return super.updateById(entity);
	}

}

