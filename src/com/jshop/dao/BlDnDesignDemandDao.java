package com.jshop.dao;

import com.jshop.entity.BlDnDesignDemand;

public interface BlDnDesignDemandDao   extends BaseCRUDDao<BlDnDesignDemand, Integer>{

	public Integer saveDemandAndApply(BlDnDesignDemand entity)throws Exception;
	
}
