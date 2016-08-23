package com.jshop.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.jshop.entity.Pager;

/**
 * 增删查改基类 （用于电商前台，PC和手机页面）
 * 
 * @author syx
 * 
 */
public interface BaseShopCRUDDao<T, PK extends Serializable> extends
		BaseDao<T, PK> {

	/**
	 * 获取列表
	 * 
	 * @param pager
	 * @param searchProperties
	 * @return
	 */
	public List getShopList(Pager pager, Map<String, String> searchProperties);

	/**
	 * 获取实体类
	 * 
	 * @param id
	 * @return
	 */
	public T getShopEntity(PK id);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 */
	public void deleteShopIds(String ids);

	/**
	 * 添加或修改实体类
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public PK saveOrUpdateShopEntity(T entity) throws Exception;
}
