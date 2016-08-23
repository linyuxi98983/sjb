package com.jshop.action.web.eva;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.OtEvaDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.OtEva;

@Namespace("/" + Global.PP_WEB + "/eva")
@ParentPackage(Global.PP_WEB)
@Action("eva")
public class OtEvaAction extends BaseWebAction<OtEva, Integer>{
	
		
	@Resource
	private OtSpPictureDao pictureDao;
	
	
	private OtEvaDao otEvaDao;
	@Resource
	public void setOtEvaDao(OtEvaDao otEvaDao) {
		this.setBaseWebCRUDDao(otEvaDao);
		this.otEvaDao = otEvaDao;
		super.entity = new OtEva();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		list = otEvaDao.getWebList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}

	
}
