package com.jshop.action.pc.org;

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
import com.jshop.dao.BlApplyDemandDao;
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_PC + "/org/demand")
@ParentPackage(Global.PP_PC)
@Action("demand")
public class DemandAction extends BaseMobileAction<BlDnDesignDemand, Integer>{
	
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	private BlApplyDemandDao applyDemandDao;
	private BlDnDesignDemandDao demandDao;
	
	
	@Resource
	public void setDemandDao(BlDnDesignDemandDao demandDao) {
		this.setBaseShopCRUDDao(demandDao);
		this.demandDao = demandDao;
		super.entity = new BlDnDesignDemand();
	}
	public String save() throws Exception{
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		if(member == null){
			return "toLogin";
		}
		entity = demandDao.getShopEntity(id);
		BlApplyDemand applyDemand = applyDemandDao.findApplyDemandByDemandIdAndMemberId(entity, member);
		applyDemand.setState(state);
		applyDemandDao.agreeOrRefuse(applyDemand);
		
		this.state = 2;
		return list();
	}
	public String list(){
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		
		if(member == null){
			return "toLogin";
		}
		
		pager = loadPager();		
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
	
		searchProperties.put("DesignMemberId",member.getId()+ "");
		searchProperties.put("personDetail", "personDetail");	
		searchProperties.put("state", state+"");
		searchProperties.put("effective", effective+"");
		list = demandDao.getShopList(pager, searchProperties);
		
		return "list";
	}
	/**
	 * 我的签单项目
	 */
	public String deal(){
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		
		if(member == null){
			return "toLogin";
		}
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		searchProperties.put("Lt_SpMemberID", member.getId()+"");
		searchProperties.put("state", "4");
		searchProperties.put("effective", effective);
		list = applyDemandDao.getShopList(pager, searchProperties);

		return "deal";
	}
	private Integer state;
	private String effective;
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getState() {
		return state;
	}

	public void setEffective(String effective) {
		this.effective = effective;
	}
	
	
}
