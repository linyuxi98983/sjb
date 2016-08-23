package com.jshop.dao;

import com.jshop.entity.LtSpPhomepage;
import com.jshop.vo.index.IndexData;

public interface LtSpPhomepageDao extends BaseCRUDDao<LtSpPhomepage, Integer> {

	public IndexData getIndexData();
	
	public IndexData getMobileIndexData();
}
