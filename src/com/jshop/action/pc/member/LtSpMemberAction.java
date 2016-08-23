package com.jshop.action.pc.member;

import java.util.HashMap;
import java.util.Map;

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

@Namespace("/" + Global.PP_PC + "/member")
@ParentPackage(Global.PP_PC)
@Action("member")
public class LtSpMemberAction extends BaseMobileAction<LtSpMember, Integer>{
	
	private Integer type;
	private LtSpMemberDao memberDao;
	
	@Resource
	public void setMemberDao(LtSpMemberDao memberDao) {
		this.setBaseShopCRUDDao(memberDao);
		this.memberDao = memberDao;
		super.entity = new LtSpMember();
	}
	
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
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
