package com.jshop.action.mobile.demand;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
@Namespace("/" + Global.PP_MOBILE + "/demand")
@ParentPackage(Global.PP_MOBILE)
@Action("demand")
public class DesignDemandAction  extends BaseMobileAction<BlDnDesignDemand, Integer>{

	private BlDnDesignDemandDao demandDao;
	
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	@Resource
	public void setDemandDao(BlDnDesignDemandDao demandDao) {
		this.setBaseShopCRUDDao(demandDao);
		this.demandDao = demandDao;
		this.entity = new BlDnDesignDemand();
	}
	
	@Override
	public String save() throws Exception {
		
		demandDao.saveOrUpdateShopEntity(entity);
		
		this.success = true;
		return JSON;
	}
	
	public String apply(){
		return "apply";
	}
	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		list = demandDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	/**
	 * 详情
	 * @return
	 */
	public String detail(){		
		entity = demandDao.getShopEntity(id);
		return "detail";
	}
}
