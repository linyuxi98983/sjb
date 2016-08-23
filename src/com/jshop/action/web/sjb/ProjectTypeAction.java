package com.jshop.action.web.sjb;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnProjectTypeDao;
import com.jshop.entity.LtDnProjectType;
@Namespace(value = "/web/projectType")
@ParentPackage(Global.PP_WEB)
@Action("projectType")
public class ProjectTypeAction extends BaseWebAction<LtDnProjectType, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnProjectTypeDao projectTypeDao;
	@Resource
	public void setLtDnProjectTypeDao(LtDnProjectTypeDao projectTypeDao) {
		this.setBaseWebCRUDDao(projectTypeDao);
		this.projectTypeDao = projectTypeDao;
		super.entity = new LtDnProjectType();
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
		projectTypeDao.saveOrUpdateWebEntity(entity);
		return list();
	}
}
