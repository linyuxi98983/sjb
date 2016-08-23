package com.jshop.action.web.system;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.OtSpLogDao;
import com.jshop.entity.OtSpLog;

@Namespace("/" + Global.PP_WEB + "/log")
@ParentPackage(Global.PP_WEB)
@Action("log")
public class LogAction extends BaseWebAction<OtSpLog, Integer> {

	private static final long serialVersionUID = 1L;
	private OtSpLogDao logDao;

	@Resource
	public void setMemberDao(OtSpLogDao logDao) {
		setBaseWebCRUDDao(logDao);
		this.logDao = logDao;
		super.entity = new OtSpLog();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
}
