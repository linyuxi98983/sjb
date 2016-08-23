package com.jshop.action.pc.dn;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnInfoDao;
import com.jshop.entity.LtDnInfo;

@Namespace("/" + Global.PP_PC + "/dinfo")
@ParentPackage(Global.PP_PC)
@Action("dinfo")
public class LtDnInfoAction extends BaseWebAction<LtDnInfo, Integer>{

	private LtDnInfoDao dnInfoDao;
	@Resource
	public void setLtDnInfoDao(LtDnInfoDao dnInfoDao) {
		this.setBaseWebCRUDDao(dnInfoDao);
		this.dnInfoDao = dnInfoDao;
		this.entity = new LtDnInfo();
	}

	
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		searchProperties.put("type", "1");
		pager = loadPager();
		list = dnInfoDao.getWebList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	public String detail(){
		this.entity = dnInfoDao.getWebEntity(id);
		
		return "detail";
	}
}
