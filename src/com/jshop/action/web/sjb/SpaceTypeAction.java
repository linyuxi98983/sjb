package com.jshop.action.web.sjb;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnSpaceTypeDao;
import com.jshop.entity.LtDnSpaceType;
@Namespace(value = "/web/spaceType")
@ParentPackage(Global.PP_WEB)
@Action("spaceType")
public class SpaceTypeAction extends BaseWebAction<LtDnSpaceType, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnSpaceTypeDao spaceTypeDao;
	@Resource
	public void setLtDnSpaceTypeDao(LtDnSpaceTypeDao spaceTypeDao) {
		this.setBaseWebCRUDDao(spaceTypeDao);
		this.spaceTypeDao = spaceTypeDao;
		super.entity = new LtDnSpaceType();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	@Override
	public String add() {		
		return super.add();
	}

	@Override
	public String edit() {
		return super.edit();
	}

	@Override
	public String save() throws Exception {
		spaceTypeDao.saveOrUpdateWebEntity(entity);
		return list();
	}
}
