package com.jshop.action.web.sjb;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnRenovationStageDao;
import com.jshop.entity.LtDnRenovationStage;
@Namespace(value = "/web/renovationStage")
@ParentPackage(Global.PP_WEB)
@Action("renovationStage")
public class RenovationStageAction extends BaseWebAction<LtDnRenovationStage, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnRenovationStageDao renovationStageDao;
	@Resource
	
	
	public void setRenovationStageDao(LtDnRenovationStageDao renovationStageDao) {
		this.setBaseWebCRUDDao(renovationStageDao);		
		this.renovationStageDao = renovationStageDao;
		this.entity = new LtDnRenovationStage();
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
		renovationStageDao.saveOrUpdateWebEntity(entity);
		return list();
	}
	
	@Override
	public String delete() {

		renovationStageDao.deleteWebIds(ids);
		return list();
	}
}
