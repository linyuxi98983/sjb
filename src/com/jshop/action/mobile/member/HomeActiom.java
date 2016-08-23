package com.jshop.action.mobile.member;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.dao.SysParamsDao;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_MOBILE + "/member")
@ParentPackage(Global.PP_MOBILE)
@Action("home")
public class HomeActiom extends BaseMobileAction<LtSpMember, Integer> {

	private Long favNum;

	@Resource
	private SysParamsDao paramsDao;
	private String tel;
	private int ticketCount;

	/*
	 * @Resource private LtSpFavoriteDao favoriteDao;
	 */
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	private LtSpMemberDao memberDao;

	@Override
	public String execute() {
		// favNum = favoriteDao.getTotalCount();
		this.tel = paramsDao.getWebValueByName("ShopServicePhoneNo");
		LtSpMember member = (LtSpMember) getSession().get(
				Global.SESSION_KEY_MOBILE_LOGINER);
		this.setTicketCount(memberDao.getTicketCount(member.getId()));
		entity = memberDao.getShopEntity(member.getId());
		if (entity.getOtSpPictureId() != null) {
			entity.setImagePath(pictureDao.getSmallImagePath(pictureDao.get(
					member.getOtSpPictureId()).getPicFileName()));
		}

		System.out.println(entity);
		return "home";
	}

	public Long getFavNum() {
		return favNum;
	}

	public void setFavNum(Long favNum) {
		this.favNum = favNum;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}
}
