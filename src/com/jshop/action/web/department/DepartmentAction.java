package com.jshop.action.web.department;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDepartmentDao;
import com.jshop.entity.LtDepartment;

@SuppressWarnings("serial")
@ParentPackage(Global.PP_WEB)
public class DepartmentAction extends BaseWebAction<LtDepartment, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDepartmentDao departmentDao;
	@Resource
	public void setDepartmentDao(LtDepartmentDao departmentDao) {
		this.setBaseWebCRUDDao(departmentDao);
		this.departmentDao = departmentDao;
		super.entity = new LtDepartment();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	@Override
	public String add() {		
		return super.add();
	}

	@Override
	public String edit() {
		return super.edit();
	}
}
