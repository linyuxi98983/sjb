package com.jshop.action.shop.member;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.shop.BaseShopAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_SHOP + "/member")
@ParentPackage(Global.PP_SHOP)
@Action("home")
public class HomeActiom extends BaseShopAction<LtSpMember, Integer> {
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	private LtSpMemberDao memberDao;
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String execute() {

		// LtSpMember member = (LtSpMember)
		// getSession().put(Global.SESSION_KEY_SHOP_LOGINER,
		// memberDao.get(1));// TODO:by syx 暂时写死
		if (getSession().get(Global.SESSION_KEY_SHOP_LOGINER) == null) {
			return LOGIN;
		}
		LtSpMember member = (LtSpMember) getSession().get(
				Global.SESSION_KEY_SHOP_LOGINER);
		entity = memberDao.getShopEntity(member.getId());
		if (entity.getOtSpPictureId() != null) {
			entity.setImagePath(pictureDao.getSmallImagePath(pictureDao.get(
					member.getOtSpPictureId()).getPicFileName()));
		}
		return "home";
	}
}
