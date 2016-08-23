package com.jshop.action.web.budget;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.LtDnBudgetDao;
import com.jshop.entity.LtDnBudget;

@ParentPackage(Global.PP_WEB)
public class BudgetAction extends BaseWebAction<LtDnBudget, Integer> {
	private static final long serialVersionUID = 1L;
	
	private LtDnBudgetDao budgetDao;
	@Resource
	public void setDepartmentDao(LtDnBudgetDao budgetDao) {
		this.setBaseWebCRUDDao(budgetDao);
		this.budgetDao = budgetDao;
		super.entity = new LtDnBudget();
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

	@Override
	public String save() throws Exception {
		budgetDao.saveOrUpdateWebEntity(entity);
		return list();
	}
}
