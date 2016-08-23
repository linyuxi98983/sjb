package com.jshop.action.pc.mb;

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
import com.jshop.dao.LtSpMemberDao;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_PC + "/mb")
@ParentPackage(Global.PP_PC)

public class IndexAction extends BaseMobileAction<LtSpMember, Integer>{

	@Resource
	private LtSpMemberDao memberDao;
	
	private BlDnDesignWorks design;
	
	@Resource
	private BlDnDesignWorksDao designWorksDao;
	public void setMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		this.entity = new LtSpMember();
		this.design = new BlDnDesignWorks();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	@Action("index")
	@Override
	public String execute() throws Exception {
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
		
		if(member != null){			
			this.entity = memberDao.getShopEntity(member.getId());
			return "home";
		}else{			
			return "toLogin";
		}		
	}
	

	/*@Action("case")
	public String workCase(){
		
		this.entity = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		
		if(this.entity == null){
			return "toLogin";
		}
		pager = loadPager();		
		pager.setPageSize(9);
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
	
		searchProperties.put("memberId",this.entity.getId()+ "");
		searchProperties.put("personDetail", "personDetail");
		
		list = designWorksDao.getShopList(pager, searchProperties);
		
		return "case";
	}*/

	public BlDnDesignWorks getDesign() {
		return design;
	}

	public void setDesign(BlDnDesignWorks design) {
		this.design = design;
	}
	
	
	
}
