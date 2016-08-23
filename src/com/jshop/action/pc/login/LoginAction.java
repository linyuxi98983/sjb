package com.jshop.action.pc.login;

import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.login.SessionMember;
import com.jshop.action.shop.BaseShopAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.entity.LtSpMember;
import com.jshop.util.SpringUtil;


@Namespace("/"+Global.PP_PC+"/login")
@ParentPackage(Global.PP_PC)
@Action("login")
public class LoginAction extends BaseShopAction{
	
	private static final long serialVersionUID = -6032635871650212133L;
	
	@Resource
	private LtSpMemberDao memberDao;
	
	private String username;
	private String password;
	private Integer memberType;
	private LtSpMember member;
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 登陆页面
	 */
	@Override
	public String execute() throws Exception {
		if (getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER) != null || getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER) != null|| getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER) != null) {
			if("json".equals(result)){
				this.success = true;
				return JSON;
			}
			return "main";
		}else{
			if("json".equals(result)){
				this.success = false;
				return JSON;
			}
		}
		return LOGIN;
	}
	
	/**
	 * 登陆逻辑
	 * @return
	 */
	public String login(){
		if (username != null && password != null) {
			member = memberDao.getLogin(username, password);
			if(member != null){
				
				this.memberType = member.getMemberType();
				if(member.getClosed() == 1){
					this.success = false;
					this.msg = SpringUtil.getMessage("global.login.disabledAccount");
					return JSON;
				}
				
				switch (memberType) {
				case 0://业主
					getSession().put(Global.SESSION_KEY_PC_YEZHU_LOGINER, member);
					getSession().put(Global.SESSION_KEY_PC_DESIGNER_LOGINER, null);
					getSession().put(Global.SESSION_KEY_PC_ORG_LOGINER, null);
					break;
				case 1://设计师
					getSession().put(Global.SESSION_KEY_PC_YEZHU_LOGINER, null);
					getSession().put(Global.SESSION_KEY_PC_DESIGNER_LOGINER, member);		
					getSession().put(Global.SESSION_KEY_PC_ORG_LOGINER, null);
					break;
				
				case 2://设计机构
					getSession().put(Global.SESSION_KEY_PC_YEZHU_LOGINER, null);
					getSession().put(Global.SESSION_KEY_PC_DESIGNER_LOGINER, null);
					getSession().put(Global.SESSION_KEY_PC_ORG_LOGINER, member);
					break;

				default:
					
					break;
				}
				getSession().put("member", member);
				getSession().put(Global.SESSION_KEY_PC_LOGINER, member);
				SessionMember.setSessionUser(member);
				if("".equals(result)){
					return "main";
				}else{
					this.success = true;
					return JSON;
				}
				
			}
		}
		
		
		if("".equals(result)){
			return "main";
		}
		this.success = false;
		this.msg = SpringUtil.getMessage("global.login.incorrectCredentials");
		
		return JSON;
	}
	
	/**
	 * 登陆逻辑
	 * @return
	 */
	public String validateLogin(){
		LtSpMember member =(LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
		LtSpMember member2 =(LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		LtSpMember member3 =(LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		if(member != null || member2 != null || member3 != null){
			
			if(member != null){
				this.memberType = member.getMemberType();
			}
			if(member2 != null){
				this.memberType = member2.getMemberType();
			}
			if(member3 != null){
				this.memberType = member3.getMemberType();
			}
			this.success = true;
		}else{
			this.success = false;
			this.msg = SpringUtil.getMessage("global.login.incorrectCredentials");
		}		
		return JSON;
	}
	
	/**
	 * 退出登陆
	 */
	public String clean(){
		if(getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER) != null){
			getSession().remove(Global.SESSION_KEY_PC_YEZHU_LOGINER);	
		}
		
		if(getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER) != null){
			getSession().remove(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		}

		if(getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER) != null){
			getSession().remove(Global.SESSION_KEY_PC_ORG_LOGINER);
		}
	
		getSession().remove(Global.SESSION_KEY_PC_LOGINER);
		
		return LOGIN;
	}

	public Integer getMemberType() {
		return memberType;
	}

	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}

	public LtSpMember getMember() {
		return member;
	}

	public void setMember(LtSpMember member) {
		this.member = member;
	}
	
	
}
