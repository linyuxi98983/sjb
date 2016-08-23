package com.jshop.action.web.org;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.SysParamsDao;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.SysParams;

@ParentPackage(Global.PP_WEB)
public class OrgAction extends BaseWebAction<LtSpMember, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpMemberDao MemberDao;
	@Resource
	private SysParamsDao paramsDao;
	List<SysParams> memberLevelList;

	@Resource
	public void setMemberDao(LtSpMemberDao MemberDao) {
		setBaseWebCRUDDao(MemberDao);
		this.MemberDao = MemberDao;
		super.entity = new LtSpMember();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	public List<SysParams> getMemberLevelList() {
		return memberLevelList;
	}
	
	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		searchProperties.put("type", "2");
		pager = loadPager();
		list = MemberDao.getWebList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	@Override
	public String add() {
		return super.add();
	}

	@Override
	public String edit() {
		super.entity.setMemberType(2);
		return super.edit();
	}
	
	private Integer type;

	public void setType(Integer type) {
		this.type = type;
	}
}
