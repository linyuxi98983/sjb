package com.jshop.action.web.login;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpOperatorDao;
import com.jshop.entity.LtSpOperator;
import com.jshop.util.SpringUtil;
import com.octo.captcha.service.CaptchaService;
import com.octo.captcha.service.CaptchaServiceException;

@Action("login")
@ParentPackage(Global.PP_WEB)
public class LoginAction extends BaseWebAction {

	private static final long serialVersionUID = -3847730974741161403L;

	@Resource
	private LtSpOperatorDao operatorDao;
	@Resource
	private CaptchaService captchaService;
	/*@Resource
	private LtSpShopDao shopDao;*/

	private String username;
	private String password;
	private String type;
	private String captcha;
	private String captchaId;

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public void setCaptchaId(String captchaId) {
		this.captchaId = captchaId;
	}

	@Override
	public String execute() throws Exception {
		if (getSession().get(Global.SESSION_KEY_LOGINER) != null) {
			return "main";
		}
		return "login";
	}

	public String login() {
		logger.debug("username=" + username + ",password=" + password
				+ ",type=" + type);
		try {
			this.success = captchaService.validateResponseForID(captchaId,
					captcha.toUpperCase()).booleanValue();
			if (!this.success) {
				this.msg = SpringUtil
						.getMessage("global.login.incorrectCaptcha");
				return JSON;
			}
		} catch (CaptchaServiceException e) {
			e.printStackTrace();
			this.success = false;
			this.msg = SpringUtil.getMessage("global.login.incorrectCaptcha");
			return JSON;
		}
		if (username != null && password != null) {
			if ("-1".equals(type)) {
				LtSpOperator operator = operatorDao.getLoginer(username,
						password);
				if (operator != null) {
					if (operator.getClosed() == 1) {
						this.success = false;
						this.msg = SpringUtil
								.getMessage("global.login.disabledAccount");
						return JSON;
					}
					this.success = true;
					getSession().put(Global.SESSION_KEY_LOGINER, operator);
					return JSON;
				}
			} else {
				/*LtSpShop shop = shopDao.getLoginer(username, password);
				if (shop != null) {
					if (shop.getAuditState() != 1) {
						this.success = false;
						this.msg = SpringUtil
								.getMessage("global.login.unauditAccount");
						return JSON;
					}
					if (shop.getClosed() == 1) {
						this.success = false;
						this.msg = SpringUtil
								.getMessage("global.login.disabledAccount");
						return JSON;
					}
					this.success = true;
					getSession().put(Global.SESSION_KEY_LOGINER, shop);
					return JSON;
				}*/
			}
		}
		this.success = false;
		this.msg = SpringUtil.getMessage("global.login.incorrectCredentials");
		return JSON;
	}

	public String clean() {
		getSession().remove(Global.SESSION_KEY_LOGINER);
		return LOGIN;
	}
}
