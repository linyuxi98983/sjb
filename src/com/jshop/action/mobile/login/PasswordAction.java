package com.jshop.action.mobile.login;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.common.GEnum.SMSType;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpSmsCodeDao;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.OtSpSmsCode;
import com.jshop.util.SpringUtil;
import com.octo.captcha.service.CaptchaService;

@Namespace("/" + Global.PP_MOBILE + "/login")
@ParentPackage(Global.PP_MOBILE)
@Action("password")
public class PasswordAction extends BaseMobileAction<LtSpMember, Integer> {
	private String verify;

	public void setVerify(String verify) {
		this.verify = verify;
	}

	private String captchaId;
	private String phoneNo;

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

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	@Resource
	private OtSpSmsCodeDao codeDao;

	private LtSpMemberDao memberDao;

	@Resource
	private CaptchaService captchaService;

	@Resource
	public void setMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		super.entity = new LtSpMember();
	}

	@Override
	public String execute() throws Exception {
		return "password";
	}

	@Override
	public String save() {
		LtSpMember member = memberDao.get("phoneNo", entity.getPhoneNo());

		member.setPassword(entity.getPassword());

		memberDao.update(member);
		this.success = true;
		return JSON;
	}

	public String validateCode() {
		System.out.println(captchaStr + "----" + captcha);
		this.success = captchaService.validateResponseForID(captchaStr,
				captcha.toUpperCase()).booleanValue();
		if (!this.success) {
			this.success = false;
			this.msg = SpringUtil.getMessage("global.login.incorrectCaptcha");
			return JSON;
		}

		return JSON;
	}

	public String queryCode() throws Exception {
		OtSpSmsCode smsCode = new OtSpSmsCode();
		smsCode.setSmsType(SMSType.PWDBACK);
		smsCode.setPhoneNo(phoneNo);
		smsCode.setSendTime(new Timestamp(new Date().getTime()));
		Integer result_code = codeDao.saveOrUpdateWebEntity(smsCode);
		if (result_code < 0) {
			this.msg = SpringUtil
					.getMessage("global.register.incorrectCaptcha");
		}
		if (result != null && !"".equals(result)) {
			return result;
		}
		return JSON;
	}

}
