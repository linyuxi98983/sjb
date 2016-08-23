package com.jshop.dao;

import com.jshop.entity.SysSpArea;



public interface SysSpAreaDao extends BaseDao<SysSpArea, Integer>{
	public SysSpArea getWebEntity(Integer id);
}
