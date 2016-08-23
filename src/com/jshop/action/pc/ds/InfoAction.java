package com.jshop.action.pc.ds;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_PC + "/ds/info")
@ParentPackage(Global.PP_PC)
@Action("info")
public class InfoAction extends BaseMobileAction<LtSpMember, Integer>{

	
	private LtSpMemberDao memberDao;
	
	private String password;
	@Resource
	public void setMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		this.entity = new LtSpMember();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	
	
	public String edit() {
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		if(member != null){
			this.entity = memberDao.getShopEntity(member.getId());
			return "edit";
		}else{
			return "toLogin";
		}
		
	}
	
	@Action(value="save", results={@Result(name="success",location="edit",type="redirectAction")})
	@Override
	public String save() throws Exception {
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		if(member != null){
			memberDao.saveOrUpdateShopEntity(entity);		
			this.success = true;
			this.msg = "修改个人信息成功";
			return "edit";
		}else{
			return "toLogin";
		}	
		
	}
	
	public String toChangePwd() {
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		if(member != null){
			this.entity = memberDao.getShopEntity(member.getId());
			return "pwd";
		}else{
			return "toLogin";
		}		
	}
	
	public String changePwd() throws Exception{
		LtSpMember member  = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		if(member != null){
			this.entity = memberDao.getShopEntity(member.getId());
			
			this.entity.setPassword(password);
			memberDao.saveOrUpdateShopEntity(entity);
			this.success = true;
			this.msg = "修改密码成功";
			return "json";
		}else{
			return "toLogin";
		}					
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
