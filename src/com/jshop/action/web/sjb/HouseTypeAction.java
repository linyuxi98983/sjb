package com.jshop.action.web.sjb;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnHouseTypeDao;
import com.jshop.entity.LtDnHouseType;
@Namespace(value = "/web/houseType")
@ParentPackage(Global.PP_WEB)
@Action("houseType")
public class HouseTypeAction extends BaseWebAction<LtDnHouseType, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnHouseTypeDao houseTypeDao;
	@Resource
	public void setLtDnHouseTypeDao(LtDnHouseTypeDao houseTypeDao) {
		this.setBaseWebCRUDDao(houseTypeDao);
		this.houseTypeDao = houseTypeDao;
		super.entity = new LtDnHouseType();
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
		houseTypeDao.saveOrUpdateWebEntity(entity);
		return list();
	}
}
