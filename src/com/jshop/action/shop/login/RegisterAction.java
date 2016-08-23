package com.jshop.action.shop.login;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.shop.BaseShopAction;
import com.jshop.common.Global;
import com.jshop.common.GEnum.SMSType;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpSmsCodeDao;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.OtSpSmsCode;
import com.jshop.util.SpringUtil;
import com.octo.captcha.service.CaptchaService;
import com.octo.captcha.service.CaptchaServiceException;

@Namespace("/" + Global.PP_SHOP + "/register")
@ParentPackage(Global.PP_SHOP)
@Action("register")
public class RegisterAction extends BaseShopAction<LtSpMember, Integer> {
	public RegisterAction() {
		System.out.println("*******");
	}

	private String verify;

	public void setVerify(String verify) {
		this.verify = verify;
	}

	private String captchaId;

	public void setCaptchaId(String captchaId) {
		this.captchaId = captchaId;
	}

	public String getCaptchaId() {
		return UUID.randomUUID().toString();
	}

	private String captchaStr;
	private String captcha;

	public void setCaptchaStr(String captchaStr) {
		this.captchaStr = captchaStr;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	@Resource
	private OtSpSmsCodeDao codeDao;

	private LtSpMemberDao memberDao;

	@Resource
	public void setMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		super.entity = new LtSpMember();
	}

	@Resource
	private CaptchaService captchaService;

	public String register() {
		return "register";
	}

	@Override
	public String save() throws Exception {
		// entity.setName(entity.getPhoneNo());
		try {
			Integer result = memberDao.veridate(entity.getPhoneNo());
			if (result > 0) {
				this.success = false;
				this.msg = SpringUtil.getMessage("global.register.exisits");
				return JSON;
			}
			this.success = captchaService.validateResponseForID(captchaStr,
					captcha.toUpperCase()).booleanValue();
			if (!this.success) {
				this.msg = SpringUtil
						.getMessage("global.login.incorrectCaptcha");
				return JSON;
			}
			Integer id = memberDao.saveOrUpdateShopEntity(entity);
			LtSpMember member = memberDao.getLogin(entity.getPhoneNo(),
					entity.getPassword());
			if (member != null) {
				this.success = true;
				getSession().put(Global.SESSION_KEY_MOBILE_LOGINER, member);
				return JSON;
			}
		} catch (CaptchaServiceException e) {
			e.printStackTrace();
			this.success = false;
			this.msg = SpringUtil.getMessage("global.login.incorrectCaptcha");
			return JSON;
		}

		return JSON;
	}

	public String queryCode() throws Exception {

		if (memberDao.veridate(entity.getPhoneNo()) > 0) {
			this.success = false;
			this.msg = SpringUtil.getMessage("global.register.exisits");
			return JSON;
		}
		OtSpSmsCode smsCode = new OtSpSmsCode();
		smsCode.setSmsType(SMSType.REGISTER);
		smsCode.setPhoneNo(entity.getPhoneNo());
		smsCode.setSendTime(new Timestamp(new Date().getTime()));
		Integer result_code = codeDao.saveOrUpdateWebEntity(smsCode);
		if (result_code < 0) {
			this.success = false;
			this.msg = SpringUtil
					.getMessage("global.register.incorrectCaptcha");
		}
		if (result != null && !"".equals(result)) {
			return result;
		}
		this.success = true;
		return JSON;
	}

	public String finl() {
		return "final";
	}

	public String valicode() {
		Integer result = memberDao.veridate(entity.getPhoneNo());
		if (result > 0) {
			this.success = false;
			this.msg = SpringUtil.getMessage("global.register.exisits");
			return JSON;
		}
		this.success = true;
		return JSON;
	}
}
