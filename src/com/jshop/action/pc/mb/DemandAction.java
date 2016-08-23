package com.jshop.action.pc.mb;

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
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_PC + "/mb/demand")
@ParentPackage(Global.PP_PC)
@Action("demand")
public class DemandAction extends BaseMobileAction<BlDnDesignDemand, Integer>{
	
	@Resource
	private OtSpPictureDao pictureDao;
	
	private BlDnDesignDemandDao demandDao;
	
	
	@Resource
	public void setDemandDao(BlDnDesignDemandDao demandDao) {
		this.setBaseShopCRUDDao(demandDao);
		this.demandDao = demandDao;
		super.entity = new BlDnDesignDemand();
	}
	@Override
	public String add() {		
		
		return super.add();
	}
	@Override
	public String save() throws Exception {
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
		entity.setLtSpMemberId(member.getId());
		demandDao.saveOrUpdateWebEntity(entity);
		
		return list();
	}
	
	
	public String list(){
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
		
		if(member == null){
			return "toLogin";
		}
		
		pager = loadPager();		
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
	
		searchProperties.put("Lt_SpMemberID",member.getId()+ "");
		searchProperties.put("personDetail", "personDetail");	
		searchProperties.put("state", state);
		list = demandDao.getShopList(pager, searchProperties);
		
		return "list";
	}

	private String state;
	public void setState(String state) {
		this.state = state;
	}
	
	
}
