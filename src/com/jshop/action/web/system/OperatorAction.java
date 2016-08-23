package com.jshop.action.web.system;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpOperatorDao;
import com.jshop.entity.LtSpOperator;

@Namespace("/" + Global.PP_WEB + "/operator")
@ParentPackage(Global.PP_WEB)
@Action("operator")
public class OperatorAction extends BaseWebAction<LtSpOperator, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpOperatorDao operatorDao;

	@Resource
	public void setMemberDao(LtSpOperatorDao operatorDao) {
		setBaseWebCRUDDao(operatorDao);
		this.operatorDao = operatorDao;
		super.entity = new LtSpOperator();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
}
