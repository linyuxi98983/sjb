package com.jshop.action.web.market;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpPhomepageDao;
import com.jshop.entity.LtSpPhomepage;

@Namespace("/" + Global.PP_WEB + "/phomepage")
@ParentPackage(Global.PP_WEB)
@Action("phomepage")
public class PhomepageAction extends BaseWebAction<LtSpPhomepage, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpPhomepageDao phomepageDao;

	@Resource
	public void setPhomepageDao(LtSpPhomepageDao phomepageDao) {
		setBaseWebCRUDDao(phomepageDao);
		this.phomepageDao = phomepageDao;
		super.entity = new LtSpPhomepage();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	@Override
	public String save() throws Exception {
		boolean isSave = entity.getId() == null;
		id = phomepageDao.saveOrUpdateWebEntity(entity);
		if (isSave && entity.getModuleType() == 3) {// 商品列表
			searchProperties = new HashMap<String, String>(0);
			searchProperties.put("phomepageId", id.toString());
			return super.edit();
		}
		return list();
	}
}
