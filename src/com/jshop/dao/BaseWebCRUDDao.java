package com.jshop.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.jshop.entity.Pager;

/**
 * 增删查改基类 （用于电商后台管理）
 * 
 * @author syx
 * 
 */
public interface BaseWebCRUDDao<T, PK extends Serializable> extends
		BaseDao<T, PK> {

	/**
	 * 获取列表
	 * 
	 * @param pager
	 * @param searchProperties
	 * @return
	 */
	public List getWebList(Pager pager, Map<String, String> searchProperties);

	/**
	 * 获取实体类
	 * 
	 * @param id
	 * @return
	 */
	public T getWebEntity(PK id);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 */
	public void deleteWebIds(String ids);

	/**
	 * 添加或修改实体类
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public PK saveOrUpdateWebEntity(T entity) throws Exception;
}
