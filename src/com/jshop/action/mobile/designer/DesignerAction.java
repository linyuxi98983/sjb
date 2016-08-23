package com.jshop.action.mobile.designer;

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

@Namespace("/" + Global.PP_MOBILE + "/designer")
@ParentPackage(Global.PP_MOBILE)
@Action("designer")
public class DesignerAction  extends BaseMobileAction<LtSpMember, Integer>{

	
	@Resource
	private LtSpMemberDao memberDao;
	
	@Resource
	private BlDnDesignWorksDao worksDao;
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
	
	public String detail(){
		
		pager = loadPager();
		pager.setPageSize(4);
		
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		this.entity = memberDao.getShopEntity(id);
		searchProperties.put("memberId",this.entity.getId()+ "");
		this.entity.setWorksList(worksDao.getShopList(pager, searchProperties));
		return "detail";
	}
	
	public String personal(){
		pager = loadPager();
		pager.setPageSize(4);
		
		
		this.entity = memberDao.getShopEntity(id);
		searchProperties.put("memberId",this.entity.getId()+ "");
		this.entity.setWorksList(worksDao.getShopList(pager, searchProperties));
		return "personal";
	}
	
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		pager = loadPager();
		searchProperties.put("DESIGNWORK", "DESIGNWORK");
		searchProperties.put("keyword", keyword);
		list = memberDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return "list";
	}
}
