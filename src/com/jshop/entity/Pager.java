package com.jshop.entity;

public class Pager {

	public final static Integer NOT_PAGER_PAGESIZE = -1;// 不分页时的pagesize默认值
	public final static Integer DEFAULT_PAGESIZE = 10;// 默认分页条数
	private Integer pageNumber = 1;
	private Integer pageSize = NOT_PAGER_PAGESIZE;
	private String orderProperty = "ID";
	private String orderDirection = "DESC";
	private Integer pageCount;
	private Object datas;// 额外获取数据

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getOrderProperty() {
		return orderProperty;
	}

	public void setOrderProperty(String orderProperty) {
		this.orderProperty = orderProperty;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Object getDatas() {
		return datas;
	}

	public void setDatas(Object datas) {
		this.datas = datas;
	}

	public String orderSql() {
		String orderby = " order by " + getOrderProperty() + " "
				+ getOrderDirection();
		return orderby;
	}

	/**
	 * 获取分页sql
	 * 
	 * @param sql
	 * @return
	 */
	public String toPagerSql(String sql) {
		String orderby = orderSql();
		if (pageSize == NOT_PAGER_PAGESIZE) {// -1代表不分页
			pageSize = DEFAULT_PAGESIZE;
			return sql + orderby;
		}
		return sql = "select * from(select m.*,row_number() over(" + orderby
				+ ") as rownumber from(" + sql
				+ ") m) m where rownumber between "
				+ ((getPageNumber() - 1) * getPageSize() + 1) + " and "
				+ (getPageNumber() * getPageSize());
	}

	@Override
	public String toString() {
		return "Pager [pageSize=" + pageSize + ", orderProperty="
				+ orderProperty + ", orderDirection=" + orderDirection
				+ ", pageNumber=" + pageNumber + ", pageCount=" + pageCount
				+ "]";
	}
}
