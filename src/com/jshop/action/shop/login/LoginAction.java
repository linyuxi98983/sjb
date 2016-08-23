package com.jshop.action.shop.login;

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

@Namespace("/" + Global.PP_SHOP + "/login")
@ParentPackage(Global.PP_SHOP)
@Action("login")
public class LoginAction extends BaseShopAction {

	private static final long serialVersionUID = -6032635871650212133L;

	@Resource
	private LtSpMemberDao memberDao;

	private String username;
	private String password;

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
		if (getSession().get(Global.SESSION_KEY_SHOP_LOGINER) != null) {
			if ("json".equals(result)) {
				this.success = true;
				return JSON;
			}
			return "main";
		} else {
			if ("json".equals(result)) {
				this.success = false;
				return JSON;
			}
		}
		return LOGIN;
	}

	/**
	 * 登陆逻辑
	 * 
	 * @return
	 */
	public String login() {
		if (username != null && password != null) {
			LtSpMember member = memberDao.getLogin(username, password);
			if (member != null) {
				if (member.getClosed() == 1) {
					this.success = false;
					this.msg = SpringUtil
							.getMessage("global.login.disabledAccount");
					return JSON;
				}
				SessionMember.setSessionUser(member);
				getSession().put(Global.SESSION_KEY_SHOP_LOGINER, member);
				if ("".equals(result)) {
					return "main";
				} else {
					this.success = true;
					return JSON;
				}

			}
		}
		if ("".equals(result)) {
			return "main";
		}
		this.success = false;
		this.msg = SpringUtil.getMessage("global.login.incorrectCredentials");
		return JSON;
	}

	/**
	 * 退出登陆
	 */
	public String clean() {
		getSession().remove(Global.SESSION_KEY_SHOP_LOGINER);
		return LOGIN;
	}
}
