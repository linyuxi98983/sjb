package com.jshop.action.web;

import java.io.Serializable;

/**
 * 增删查改基类action
 * 
 * @author syx
 * 
 */
public interface IBaseCRUDAction<T, PK extends Serializable> {

	/**
	 * 获得列表数据
	 * 
	 * @return
	 */
	public String list();

	/**
	 * 添加或修改实体
	 * 
	 * @return
	 */
	// public String save() throws Exception;
	/**
	 * 添加页面
	 * 
	 * @return
	 */
	public String add();

	/**
	 * 编辑页面
	 * 
	 * @return
	 */
	public String edit();
	/**
	 * 删除实体
	 * 
	 * @return
	 */
	/*
	 * public String delete();
	 *//**
	 * 修改实体字段
	 * 
	 * @return
	 */
	/*
	 * public String update() throws Exception;
	 */
}
