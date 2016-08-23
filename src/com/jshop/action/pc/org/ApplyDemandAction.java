package com.jshop.action.pc.org;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.BlApplyDemandDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.LtSpMember;
@Namespace("/" + Global.PP_PC + "/org/apply")
@ParentPackage(Global.PP_PC)
@Action("apply")
public class ApplyDemandAction  extends BaseMobileAction<BlApplyDemand, Integer>{
	
	
	private BlApplyDemandDao applyDemandDao;
	@Resource
	public void setApplyDemandDao(BlApplyDemandDao applyDemandDao) {
		this.setBaseShopCRUDDao(applyDemandDao);
		this.applyDemandDao = applyDemandDao;
		this.entity = new BlApplyDemand();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	
	/**
	 * 项目申请列表
	 */
	@Override
	public String list(){
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		
		if(member == null){
			return "toLogin";
		}
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		searchProperties.put("Lt_SpMemberID", member.getId()+"");
		searchProperties.put("state", state);
		searchProperties.put("effective", effective);
		list = applyDemandDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	private String state;
	private String effective;
	public void setState(String state) {
		this.state = state;
	}

	public void setEffective(String effective) {
		this.effective = effective;
	}
	
	
}