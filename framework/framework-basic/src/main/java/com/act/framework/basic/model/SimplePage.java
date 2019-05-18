package com.act.framework.basic.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: SimplePage <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:     2016年10月27日 下午7:15:46 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class SimplePage<T> implements Serializable {
	private static final long serialVersionUID = 2254542783881148015L;

	private long count;
	private List<T> rows;

	public SimplePage() {
	}
	public SimplePage(List<T> rows) {
		this.rows = new ArrayList<>(rows);
		this.count = rows.size();
	}
	public SimplePage(List<T> rows,long count) {
		this.rows = new ArrayList<>(rows);
		this.count = count;
	}

	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}

