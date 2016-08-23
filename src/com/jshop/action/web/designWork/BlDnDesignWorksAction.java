package com.jshop.action.web.designWork;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.action.shop.BaseShopAction;
import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnDesignWorks;

@Namespace("/" + Global.PP_WEB + "/designWork")
@ParentPackage(Global.PP_WEB)
@Action("designWork")
public class BlDnDesignWorksAction extends BaseWebAction<BlDnDesignWorks, Integer>{
	
	private BlDnDesignWorksDao designWorksDao;
	
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	public void setBlDnDesignWorksDao(BlDnDesignWorksDao designWorksDao) {
		this.setBaseWebCRUDDao(designWorksDao);
		this.designWorksDao = designWorksDao;
		super.entity = new BlDnDesignWorks();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	public String updateOrderNo() throws Exception{
		System.out.println(entity.getOrderNo());
		System.out.println(entity.getId());
		BlDnDesignWorks cas = designWorksDao.getWebEntity(entity.getId());
		cas.setOrderNo(entity.getOrderNo());
		designWorksDao.saveOrUpdateWebEntity(cas);
		this.success = true;
		
		return JSON;
	}
	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		list = designWorksDao.getWebList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}

	
}
