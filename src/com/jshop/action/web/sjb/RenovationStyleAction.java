package com.jshop.action.web.sjb;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnRenovationStyleDao;
import com.jshop.entity.LtDnRenovationStyle;
@Namespace(value = "/web/renovationStyle")
@ParentPackage(Global.PP_WEB)
@Action("renovationStyle")
public class RenovationStyleAction extends BaseWebAction<LtDnRenovationStyle, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnRenovationStyleDao renovationStyleDao;
	@Resource
	
	
	public void setLtDnRenovationStyleDao(LtDnRenovationStyleDao renovationStyleDao) {
		this.setBaseWebCRUDDao(renovationStyleDao);		
		this.renovationStyleDao = renovationStyleDao;
		this.entity = new LtDnRenovationStyle();
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
		renovationStyleDao.saveOrUpdateWebEntity(entity);
		return list();
	}
	
	@Override
	public String delete() {

		renovationStyleDao.deleteWebIds(ids);
		return list();
	}
}
