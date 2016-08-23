package com.jshop.action.mobile.member;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_MOBILE + "/member")
@ParentPackage(Global.PP_MOBILE)
@Action("member")
public class MemberAction extends BaseMobileAction<LtSpMember, Integer> {

	private Long ticketCount;

	@Resource
	private OtSpPictureDao pictureDao;
	/*
	 * @Resource private LtSpTicketDao ticketDao;
	 */
	private LtSpMemberDao memberDao;

	@Resource
	public void setMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		super.entity = new LtSpMember();
	}

	@Override
	public String edit() {
		LtSpMember member = (LtSpMember) getSession().get(
				Global.SESSION_KEY_MOBILE_LOGINER);
		entity = memberDao.getShopEntity(member.getId());
		// this.ticketCount = ticketDao.getTotalCount();
		if (entity.getOtSpPictureId() != null) {
			entity.setImagePath(pictureDao.getSmallImagePath(pictureDao.get(
					member.getOtSpPictureId()).getPicFileName()));
		}
		return "edit";
	}

	@Override
	public String save() throws Exception {
		System.out.println(entity);
		memberDao.saveOrUpdateShopEntity(entity);

		return "main";
	}

	public Long getTicketCount() {
		return ticketCount;
	}

	public String apply() {
		this.entity.setId(id);
		return "apply";
	}

	public void setTicketCount(Long ticketCount) {
		this.ticketCount = ticketCount;
	}

}
