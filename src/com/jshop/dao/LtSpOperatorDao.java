package com.jshop.dao;

import com.jshop.entity.LtSpOperator;

public interface LtSpOperatorDao extends BaseWebCRUDDao<LtSpOperator, Integer> {

	public LtSpOperator getLoginer(String loginName, String password);
}
