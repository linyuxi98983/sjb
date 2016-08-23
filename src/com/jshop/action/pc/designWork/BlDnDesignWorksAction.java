package com.jshop.action.pc.designWork;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnDesignWorks;

@Namespace("/" + Global.PP_PC + "/designWork")
@ParentPackage(Global.PP_PC)
@Action("designWork")
public class BlDnDesignWorksAction extends BaseMobileAction<BlDnDesignWorks, Integer>{
	
	private String sqm;
	private String costAmt;
	private BlDnDesignWorksDao designWorksDao;
	
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	public void setBlDnDesignWorksDao(BlDnDesignWorksDao designWorksDao) {
		this.setBaseShopCRUDDao(designWorksDao);
		this.designWorksDao = designWorksDao;
		super.entity = new BlDnDesignWorks();
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
		searchProperties.put("sqm", sqm);
		searchProperties.put("costAmt", costAmt);
		searchProperties.put("keyword", keyword);
		pager = loadPager();
		list = designWorksDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}

	public void setSqm(String sqm) {
		this.sqm = sqm;
	}

	public void setCostAmt(String costAmt) {
		this.costAmt = costAmt;
	}

}
