package com.jshop.action.web.market;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpSeoDao;
import com.jshop.entity.LtSpSeo;

@Namespace("/" + Global.PP_WEB + "/seo")
@ParentPackage(Global.PP_WEB)
@Action("seo")
public class SeoAction extends BaseWebAction<LtSpSeo, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpSeoDao seoDao;

	@Resource
	public void setMemberDao(LtSpSeoDao seoDao) {
		setBaseWebCRUDDao(seoDao);
		this.seoDao = seoDao;
		super.entity = new LtSpSeo();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
}
