package com.jshop.action.web.sjb;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnAreaMeasureDao;
import com.jshop.entity.LtDnAreaMeasure;
@Namespace(value = "/web/areaMeasure")
@ParentPackage(Global.PP_WEB)
@Action("areaMeasure")
public class LtDnAreaMeasureAction extends BaseWebAction<LtDnAreaMeasure, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnAreaMeasureDao areaMeasureDao;
	@Resource
	
	
	public void setLtDnAreaMeasureDao(LtDnAreaMeasureDao areaMeasureDao) {
		this.setBaseWebCRUDDao(areaMeasureDao);		
		this.areaMeasureDao = areaMeasureDao;
		this.entity = new LtDnAreaMeasure();
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
		areaMeasureDao.saveOrUpdateWebEntity(entity);
		return list();
	}
	
	@Override
	public String delete() {

		areaMeasureDao.deleteWebIds(ids);
		return list();
	}
}
