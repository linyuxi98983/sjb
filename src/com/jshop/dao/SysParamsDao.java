package com.jshop.dao;

import java.util.List;

import com.jshop.entity.SysParams;

public interface SysParamsDao extends BaseWebCRUDDao<SysParams, Integer> {

	public void saveOrUpdateWebEntity(List list) throws Exception;

	public List<SysParams> getWebMemberLevelList();

	public String getWebValueByName(String name);
}
