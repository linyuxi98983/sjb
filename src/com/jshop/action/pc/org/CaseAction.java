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
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_PC + "/org/case")
@ParentPackage(Global.PP_PC)
@Action("case")
public class CaseAction extends BaseWebAction<BlDnDesignWorks, Integer>{
	
	@Resource
	private OtSpPictureDao pictureDao;
	
	private BlDnDesignWorksDao designWorksDao;
	
	
	@Resource
	public void setBlDnDesignWorksDao(BlDnDesignWorksDao designWorksDao) {
		this.setBaseWebCRUDDao(designWorksDao);
		this.designWorksDao = designWorksDao;
		super.entity = new BlDnDesignWorks();
	}
	
	
	public String toAdd()throws Exception{		
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		if(member != null){
			return "add";
		}else{
			return "toLogin";
		}
	}
	
	
	public String list(){
		
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		
		if(member == null){
			return "toLogin";
		}
		pager = loadPager();		
		pager.setPageSize(9);
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
	
		searchProperties.put("memberId",member.getId()+ "");
		searchProperties.put("personDetail", "personDetail");
		
		list = designWorksDao.getShopList(pager, searchProperties);
		
		return "list";
	}
	
	@Override
	public String edit() {
		entity = designWorksDao.getShopEntity(id);
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return EDIT;
	}
	@Override
	public String save() throws Exception {
		

		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		if(member !=null){
			this.entity.setLtSpMemberId(member.getId());
			return super.save();
		}else{
			return "toLogin";
		}
		
	}
	@Override
	public String delete(){
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		if(member !=null){
			designWorksDao.delete(designWorksDao.get(this.entity.getId()));
			this.success = true;
			this.msg = "删除案例成功";
			return "json";
		}else{
			return "toLogin";
		}
	}
}
