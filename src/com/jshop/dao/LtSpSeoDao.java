package com.jshop.dao;

import javax.servlet.http.HttpServletRequest;

import com.jshop.entity.LtSpSeo;

public interface LtSpSeoDao extends BaseCRUDDao<LtSpSeo, Integer> {

	public LtSpSeo getShopEntityByUrl(String url, String moduleName,
			HttpServletRequest request);
}
