package com.jshop.dao;

import java.util.Map;

import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.Pager;
import com.jshop.vo.cas.CaseData;
public interface BlDnDesignWorksDao   extends BaseCRUDDao<BlDnDesignWorks, Integer>{

	public CaseData getData(Pager pager, Map<String, String> searchProperties);
}
