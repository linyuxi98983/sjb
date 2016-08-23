package com.jshop.action.web.market;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMhomepageDao;
import com.jshop.entity.LtSpMhomepage;

@Namespace("/" + Global.PP_WEB + "/mhomepage")
@ParentPackage(Global.PP_WEB)
@Action("mhomepage")
public class MhomepageAction extends BaseWebAction<LtSpMhomepage, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpMhomepageDao mhomepageDao;

	@Resource
	public void setMemberDao(LtSpMhomepageDao mhomepageDao) {
		setBaseWebCRUDDao(mhomepageDao);
		this.mhomepageDao = mhomepageDao;
		super.entity = new LtSpMhomepage();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	@Override
	public String save() throws Exception {
		boolean isSave = entity.getId() == null;
		id = mhomepageDao.saveOrUpdateWebEntity(entity);
		if (isSave && entity.getModuleType() == 3) {// 商品列表
			searchProperties = new HashMap<String, String>(0);
			searchProperties.put("mhomepageId", id.toString());
			return super.edit();
		}
		return list();
	}
}
