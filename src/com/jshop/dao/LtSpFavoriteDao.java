package com.jshop.dao;

import com.jshop.entity.LtSpFavorite;


public interface LtSpFavoriteDao extends BaseShopCRUDDao<LtSpFavorite, Integer>{

	public void deleteByObject(LtSpFavorite entity) ;
}
