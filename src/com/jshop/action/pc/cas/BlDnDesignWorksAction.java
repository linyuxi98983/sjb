package com.jshop.action.pc.cas;

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

@Namespace("/" + Global.PP_PC + "/case")
@ParentPackage(Global.PP_PC)
@Action("case")
public class BlDnDesignWorksAction extends BaseMobileAction<BlDnDesignWorks, Integer>{
	
	private String type = "";
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
	private String memberId;

	private String Lt_DnHouseType;
	private String Lt_DnRenovationStyle;
	private String Lt_DnSpaceType;
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

	
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
	
		pager = loadPager();
		pager.setPageSize(36);
		searchProperties.put("sqm", sqm);
		searchProperties.put("costAmt", costAmt);
		searchProperties.put("styleId", styleId);
		searchProperties.put("typeId", typeId);
		searchProperties.put("priceId", priceId);
		searchProperties.put("keyword", keyword);
		searchProperties.put("sqmId", sqmId);
		searchProperties.put("type", type);
		searchProperties.put("spaceTypeId", spaceTypeId);
		searchProperties.put("houseTypeOrSpaceType", houseTypeOrSpaceType);
		/**
		 * 主页分类查询
		 */
		try {
			if(Lt_DnHouseType!=null && !"".equals(Lt_DnHouseType)){
				searchProperties.put("Lt_DnHouseType", new String(Lt_DnHouseType.getBytes("iso-8859-1"), "UTF-8"));
			}
			if(Lt_DnRenovationStyle!=null && !"".equals(Lt_DnRenovationStyle)){
				searchProperties.put("Lt_DnRenovationStyle",  new String(Lt_DnRenovationStyle.getBytes("iso-8859-1"),"UTF-8"));
			}
			if(Lt_DnSpaceType!=null && !"".equals(Lt_DnSpaceType)){
				searchProperties.put("Lt_DnSpaceType",  new String(Lt_DnSpaceType.getBytes("iso-8859-1"),"UTF-8"));
			}
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		data = worksDao.getData(pager, searchProperties);
		if(data.getTypeIds() != null){
			this.houseType = data.getTypeIds().getHouseType();
			this.styleId = data.getTypeIds().getStyleId();
		}
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
		pager.setPageSize(36);
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
		
		return "detail";
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
		searchProperties.put("personDetail", "personDetail");
		searchProperties.put("memberId", memberId);
		list = worksDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getHouseTypeOrSpaceType() {
		return houseTypeOrSpaceType;
	}

	public void setHouseTypeOrSpaceType(String houseTypeOrSpaceType) {
		this.houseTypeOrSpaceType = houseTypeOrSpaceType;
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

	public void setLt_DnHouseType(String lt_DnHouseType) {
		Lt_DnHouseType = lt_DnHouseType;
	}

	public void setLt_DnRenovationStyle(String lt_DnRenovationStyle) {
		Lt_DnRenovationStyle = lt_DnRenovationStyle;
	}
	
	
}
