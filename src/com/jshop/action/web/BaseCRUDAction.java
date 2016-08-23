package com.jshop.action.web;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.jshop.entity.Pager;

/**
 * 对增删查改的进一步抽取，提取action公共方法基类
 * 
 * @author syx
 * 
 * @param <T>
 * @param <PK>
 */
public abstract class BaseCRUDAction<T, PK extends Serializable> extends
		BaseAction implements IBaseCRUDAction<T, PK> {

	private static final long serialVersionUID = -4912295180934545532L;
	protected PK id;
	protected String ids;
	protected List list;
	protected Map<String, String> searchProperties;
	protected T entity;
	protected String result;
	protected String keyword;
	protected Pager pager;
	protected Pager pageCount;
	private Integer pageNumber = 1;
	private Integer pageSize = Pager.NOT_PAGER_PAGESIZE;// -1代表不分页
	private String orderProperty;
	private String orderDirection;

	public void setPageCount(Pager pageCount) {
		this.pageCount = pageCount;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setOrderProperty(String orderProperty) {
		this.orderProperty = orderProperty;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Pager getPager() {
		return pager;
	}

	public Pager loadPager() {
		pager = new Pager();
		pager.setOrderProperty(orderProperty);
		pager.setOrderDirection(orderDirection);
		if (pageNumber != null) {
			pager.setPageNumber(pageNumber);
		}
		if (pageSize == Pager.NOT_PAGER_PAGESIZE) {// 设置默认分页
			pageSize = Pager.DEFAULT_PAGESIZE;
		}
		pager.setPageSize(pageSize);
		return pager;
	}

	public T getEntity() {
		return entity;
	}

	public void setEntity(T entity) {
		this.entity = entity;
	}

	public Map<String, String> getSearchProperties() {
		return searchProperties;
	}

	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	public List getList() {
		return list;
	}

	public void setId(PK id) {
		this.id = id;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
