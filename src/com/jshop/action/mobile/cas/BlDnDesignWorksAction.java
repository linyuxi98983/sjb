package com.jshop.action.mobile.cas;

import java.io.UnsupportedEncodingException;
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
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.vo.cas.CaseData;

@Namespace("/" + Global.PP_MOBILE + "/case")
@ParentPackage(Global.PP_MOBILE)
@Action("case")
public class BlDnDesignWorksAction extends BaseMobileAction<BlDnDesignWorks, Integer>{
	
	private String type;
	private CaseData data;
	private String sqm;
	private String costAmt;
	private BlDnDesignWorksDao worksDao; 
	private String houseType;
	private String styleId;
	private String typeId;
	private String priceId;
	private String sqmId;
	private String spaceTypeId;
	private String houseTypeOrSpaceType;
	@Resource
	public void setWorksDao(BlDnDesignWorksDao worksDao) {
		this.setBaseShopCRUDDao(worksDao);
		this.worksDao = worksDao;
		this.entity = new BlDnDesignWorks();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	public String loadMore(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
	
		pager = loadPager();
		searchProperties.put("sqm", sqm);
		searchProperties.put("costAmt", costAmt);
		searchProperties.put("styleId", styleId);
		searchProperties.put("typeId", typeId);
		searchProperties.put("priceId", priceId);
		searchProperties.put("keyword", keyword);
		searchProperties.put("sqmId", sqmId);
		searchProperties.put("type", type);
		searchProperties.put("spaceTypeId", spaceTypeId);
		
		list = worksDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
	
		pager = loadPager();
		searchProperties.put("sqm", sqm);
		searchProperties.put("costAmt", costAmt);
		searchProperties.put("styleId", styleId);
		searchProperties.put("typeId", typeId);
		searchProperties.put("priceId", priceId);
		searchProperties.put("keyword", keyword);
		searchProperties.put("sqmId", sqmId);
		searchProperties.put("type", type);
		searchProperties.put("spaceTypeId", spaceTypeId);
		try {
			if(houseTypeOrSpaceType != null && !"".equals(houseTypeOrSpaceType)){
				searchProperties.put("houseTypeOrSpaceType", new String(houseTypeOrSpaceType.getBytes("ISO8859-1"), "utf-8"));
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		data = worksDao.getData(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	public String pics(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
	
		pager = loadPager();
		pager.setPageSize(6);
		searchProperties.put("sqm", sqm);
		searchProperties.put("costAmt", costAmt);
		searchProperties.put("styleId", styleId);
		searchProperties.put("typeId", typeId);
		searchProperties.put("priceId", priceId);
		searchProperties.put("sqmId", sqmId);
		searchProperties.put("keyword", keyword);
		searchProperties.put("type", type);
		searchProperties.put("spaceTypeId", spaceTypeId);
		
		data = worksDao.getData(pager, searchProperties);
	
		return "pics";
	}
	
	
	public String detail(){
		this.entity = worksDao.getWebEntity(id);
		this.entity.setBrowseCount(this.entity.getBrowseCount() + 1);
		try {
			worksDao.saveOrUpdateShopEntity(entity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "detail";
	}
	
	public String pic_detail(){
		this.entity = worksDao.getWebEntity(id);
		
		return "pic_detail";
	}
	
	
	public String getSpaceTypeId() {
		return spaceTypeId;
	}

	public void setSpaceTypeId(String spaceTypeId) {
		this.spaceTypeId = spaceTypeId;
	}

	public void setType(String type) {
		this.type = type;
	}

	public CaseData getData() {
		return data;
	}

	public void setData(CaseData data) {
		this.data = data;
	}

	public void setSqm(String sqm) {
		this.sqm = sqm;
	}

	public void setCostAmt(String costAmt) {
		this.costAmt = costAmt;
	}

	public String getStyleId() {
		return styleId;
	}

	public void setStyleId(String styleId) {
		this.styleId = styleId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getPriceId() {
		return priceId;
	}

	public void setPriceId(String priceId) {
		this.priceId = priceId;
	}

	public String getSqmId() {
		return sqmId;
	}

	public void setSqmId(String sqmId) {
		this.sqmId = sqmId;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getHouseTypeOrSpaceType() {
		return houseTypeOrSpaceType;
	}

	public void setHouseTypeOrSpaceType(String houseTypeOrSpaceType) {
		this.houseTypeOrSpaceType = houseTypeOrSpaceType;
	}
	
	
}
