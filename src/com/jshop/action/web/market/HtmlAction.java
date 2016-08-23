package com.jshop.action.web.market;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpHtmlDao;
import com.jshop.entity.LtSpHtml;

@Namespace("/" + Global.PP_WEB + "/html")
@ParentPackage(Global.PP_WEB)
@Action("html")
public class HtmlAction extends BaseWebAction<LtSpHtml, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpHtmlDao htmlDao;

	@Resource
	public void setHtmlDao(LtSpHtmlDao htmlDao) {
		setBaseWebCRUDDao(htmlDao);
		this.htmlDao = htmlDao;
		super.entity = new LtSpHtml();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
}
