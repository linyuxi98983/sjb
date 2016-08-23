package com.jshop.dao;

import java.io.Serializable;

/**
 * 增删查改基类 （用于电商后台管理）
 * 
 * @author syx
 * 
 */
public interface BaseCRUDDao<T, PK extends Serializable> extends
		BaseShopCRUDDao<T, PK>, BaseWebCRUDDao<T, PK> {

}
