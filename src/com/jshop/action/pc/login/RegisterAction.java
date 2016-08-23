package com.jshop.action.pc.login;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.LtSpMember;
import com.jshop.util.SpringUtil;
import com.octo.captcha.service.CaptchaService;
import com.octo.captcha.service.CaptchaServiceException;

@Namespace("/" + Global.PP_PC + "/register")
@ParentPackage(Global.PP_PC)
@Action("register")
public class RegisterAction extends BaseMobileAction<LtSpMember, Integer>{
	
	private Integer type;
	private LtSpMemberDao memberDao;
	private String captchaId;
	private String captcha;
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
		this.captchaId = UUID.randomUUID().toString();
		return "register";
	}
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	public String getCaptchaId() {
		return captchaId;
	}

	public void setCaptchaId(String captchaId) {
		this.captchaId = captchaId;
	}
	
	
	

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String save() throws Exception {
		
		try {
			this.success = captchaService.validateResponseForID(captchaId,
					captcha.toUpperCase()).booleanValue();
			if (!this.success) {
				this.msg = SpringUtil
						.getMessage("global.login.incorrectCaptcha");
				return JSON;
			}
			entity.setNickname(entity.getNickname().replace(",", ""));
			memberDao.saveOrUpdateShopEntity(entity);
			this.success = true;
		} catch (CaptchaServiceException e) {
			e.printStackTrace();
			this.success = false;
			this.msg = SpringUtil.getMessage("global.login.incorrectCaptcha");
			return JSON;
		}	
		
		
		return JSON;
	}

	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		if (type != null) {
			searchProperties.put("type", type.toString());
		}
		pager = loadPager();
		list = memberDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}

	
}
