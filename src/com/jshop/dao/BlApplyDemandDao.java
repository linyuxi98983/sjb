package com.jshop.dao;

import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.LtSpMember;
public interface BlApplyDemandDao   extends BaseCRUDDao<BlApplyDemand, Integer>{
	public BlApplyDemand findApplyDemandByDemandIdAndMemberId(
			BlDnDesignDemand entity,LtSpMember member);
	public Integer agreeOrRefuse(BlApplyDemand applyDemand) throws Exception;
}
