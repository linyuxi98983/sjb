package com.jshop.action.web.market;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpPhomepageMenuDao;
import com.jshop.entity.LtSpPhomepageMenu;

@Namespace("/" + Global.PP_WEB + "/phomepagemenu")
@ParentPackage(Global.PP_WEB)
@Action("phomepagemenu")
public class PhomepageMenuAction extends
		BaseWebAction<LtSpPhomepageMenu, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpPhomepageMenuDao phomepageMenuDao;

	@Resource
	public void setPhomepageMenuDao(LtSpPhomepageMenuDao phomepageMenuDao) {
		setBaseWebCRUDDao(phomepageMenuDao);
		this.phomepageMenuDao = phomepageMenuDao;
		super.entity = new LtSpPhomepageMenu();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
}
