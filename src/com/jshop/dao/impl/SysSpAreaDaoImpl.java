package com.jshop.dao.impl;

import org.springframework.stereotype.Repository;

import com.jshop.dao.SysSpAreaDao;
import com.jshop.entity.SysSpArea;

@Repository
public class SysSpAreaDaoImpl extends BaseDaoImpl<SysSpArea, Integer> implements SysSpAreaDao{
	
	@Override
	public SysSpArea getWebEntity(Integer id){
		SysSpArea entity = get(id);
		if (entity.getParentId() != null) {
			entity.setParent(getWebEntity(entity.getParentId()));
		}
		return entity;
	}
}
