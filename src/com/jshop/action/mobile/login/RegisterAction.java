package com.jshop.action.mobile.login;

import java.sql.Timestamp;
import java.util.Date;

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

@Namespace("/" + Global.PP_MOBILE + "/register")
@ParentPackage(Global.PP_MOBILE)
@Action("register")
public class RegisterAction extends BaseMobileAction<LtSpMember, Integer> {
	private String phoneNo;

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	private String verify;

	public void setVerify(String verify) {
		this.verify = verify;
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

	@Override
	public String save() throws Exception {
		// entity.setName(entity.getPhoneNo());
		Integer id = memberDao.saveOrUpdateShopEntity(entity);

		LtSpMember member = memberDao.getLogin(entity.getPhoneNo(),
				entity.getPassword());
		if (member != null) {
			this.success = true;
			getSession().put(Global.SESSION_KEY_MOBILE_LOGINER, member);
			return JSON;
		}
		return JSON;
	}

	@Override
	public String add() {
		return "add";
	}

	public String next() throws Exception {
		return "next";
	}

	public String queryCode() throws Exception {
		OtSpSmsCode smsCode = new OtSpSmsCode();
		smsCode.setSmsType(SMSType.REGISTER);
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

	public String finl() {
		return "final";
	}

	public String valicode() {
		if ("validate".equals(result)) {
			Integer result = memberDao.veridate(entity.getPhoneNo());
			if (result > 0) {
				this.success = false;
				this.msg = SpringUtil.getMessage("global.register.exisits");
				return JSON;
			}
		} else {
			this.msg = codeDao.updateCheckValidateNo(phoneNo, verify);
			if ("".equals(this.msg)) {
				this.success = true;
				return JSON;
			} else {
				this.success = false;
				return JSON;
			}
		}

		return JSON;
	}
}
