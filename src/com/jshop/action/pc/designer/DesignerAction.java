package com.jshop.action.pc.designer;

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
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.SysSpAreaDao;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.SysSpArea;
import com.jshop.vo.designer.LtSpMemberIndexData;

@Namespace("/" + Global.PP_PC + "/designer")
@ParentPackage(Global.PP_PC)
@Action("designer")
public class DesignerAction  extends BaseMobileAction<LtSpMember, Integer>{

	private LtSpMember member;
	@Resource
	private LtSpMemberDao memberDao;
	
	private String searchByArea;
	private LtSpMemberIndexData indexData;
	
	private String MinDesignAmt;
	private String MaxDesignAmt;
	@Resource
	private BlDnDesignWorksDao worksDao;
	
	
	@Resource
	private BlDnDesignDemandDao demandDao;
	private String houseTypeOrSpaceType;
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	@Resource
	public void setLtSpMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		this.entity = new LtSpMember();
	}
	
	@Resource
	private SysSpAreaDao areaDao;

	public String apply(){
		
		return "apply";
	}
	
	public String home(){
		pager = loadPager();
		
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		searchProperties.put("state", "0");
		list = demandDao.getShopList(pager, searchProperties);
		return "home";
	}
	
	public String personal(){
		pager = loadPager();
		pager.setPageSize(3);
		
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
			
		}
		if(id == null){
			LtSpMember yezhu = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
			Integer memberId = null;
			if(yezhu != null){
				memberId = yezhu.getId();
			}
			LtSpMember designer = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);			
			if(designer != null){
				memberId = designer.getId();
			}
			LtSpMember org = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
			if(org != null){
				memberId = org.getId();
			}
			if(memberId == null){
				
				return "toLogin";
			}
			this.entity = memberDao.getShopEntity(memberId);
			searchProperties.put("memberId",memberId+ "");
			searchProperties.put("personDetail", "personDetail");
			this.entity.setWorksList(worksDao.getShopList(pager, searchProperties));
		}else{
			this.entity = memberDao.getShopEntity(id);
			searchProperties.put("memberId",this.entity.getId()+ "");
			searchProperties.put("personDetail", "personDetail");
			this.entity.setWorksList(worksDao.getShopList(pager, searchProperties));
		}
		
		
		return "personal";
	}
	
	public String index(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		pager.setPageSize(5);
		searchProperties.put("DESIGNWORK", "DESIGNWORK");
		try {
			if(searchByArea != null &&!"".equals(searchByArea)){
				searchProperties.put("searchByArea", new String(searchByArea.getBytes("iso-8859-1"),"UTF-8"));
			}
			if(houseTypeOrSpaceType != null && !houseTypeOrSpaceType.equals("")){
				searchProperties.put("houseTypeOrSpaceType", houseTypeOrSpaceType);
			}
			if(MinDesignAmt != null && !"".equals(MinDesignAmt)){
				searchProperties.put("MinDesignAmt", MinDesignAmt);
			}
			if(MaxDesignAmt != null && !"".equals(MaxDesignAmt)){
				searchProperties.put("MaxDesignAmt", MaxDesignAmt);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		searchProperties.put("keyword", keyword);
		searchProperties.put("memberType", "11111");
		indexData = memberDao.getDesignerIndexData(pager, searchProperties);
		
		
		LtSpMember yezhu = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
		LtSpMember designer = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		LtSpMember org = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		
		if(yezhu != null){
			member = yezhu;
		}
		
		if(designer != null){
			member = designer;
		}
		if(org != null){
			member = org;
		}
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return "index";
	}
	
	
	

	public LtSpMember getMember() {
		return member;
	}

	public void setMember(LtSpMember member) {
		this.member = member;
	}

	public String getMinDesignAmt() {
		return MinDesignAmt;
	}

	public void setMinDesignAmt(String minDesignAmt) {
		MinDesignAmt = minDesignAmt;
	}

	public String getMaxDesignAmt() {
		return MaxDesignAmt;
	}

	public void setMaxDesignAmt(String maxDesignAmt) {
		MaxDesignAmt = maxDesignAmt;
	}

	public LtSpMemberIndexData getIndexData() {
		return indexData;
	}

	public void setIndexData(LtSpMemberIndexData indexData) {
		this.indexData = indexData;
	}

	public void setSearchByArea(String searchByArea) {
		this.searchByArea = searchByArea;
	}

	public String getHouseTypeOrSpaceType() {
		return houseTypeOrSpaceType;
	}

	public void setHouseTypeOrSpaceType(String houseTypeOrSpaceType) {
		this.houseTypeOrSpaceType = houseTypeOrSpaceType;
	}
	
	
}
