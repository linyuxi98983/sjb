package com.jshop.action.pc;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.shop.BaseShopAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.LtSpPhomepageDao;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.LtSpPhomepage;
import com.jshop.vo.index.IndexData;

@ParentPackage(Global.PP_PC)
public class IndexAction extends BaseShopAction<LtSpPhomepage, Integer> {
	private Integer type;
	
	private LtSpMember member;
	private IndexData data;
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	@Resource
	private LtSpPhomepageDao phomepageDao;
	
	
	public void setPhomepageDao(LtSpPhomepageDao phomepageDao) {
		this.setBaseShopCRUDDao(phomepageDao);
		this.phomepageDao = phomepageDao;
		entity = new LtSpPhomepage();
		data = new IndexData();
	}

	@Override
	public String execute() throws Exception {
		
		data = phomepageDao.getIndexData();		
		member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_LOGINER);
		return "index";
	}

	public IndexData getData() {
		return data;
	}

	public void setData(IndexData data) {
		this.data = data;
	}

	public LtSpMember getMember() {
		return member;
	}

	public void setMember(LtSpMember member) {
		this.member = member;
	}

}
