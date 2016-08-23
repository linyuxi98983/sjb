package com.jshop.action.mobile.goods;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpHtmlDao;
import com.jshop.entity.LtSpHtml;

@ParentPackage(Global.PP_MOBILE)
public class HtmlAction extends BaseMobileAction<LtSpHtml, Integer> {

	private static final long serialVersionUID = -4189046045774079488L;
	private LtSpHtmlDao htmlDao;

	@Resource
	public void setHtmlDao(LtSpHtmlDao htmlDao) {
		setBaseShopCRUDDao(htmlDao);
		this.htmlDao = htmlDao;
	}

	@Override
	public String execute() {
		entity = htmlDao.get(id);
		return "html";
	}
}
