package com.jshop.action.web.common;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.entity.LtSpOperator;

@ParentPackage(Global.PP_WEB)
public class MainAction extends BaseWebAction {

	private static final long serialVersionUID = -1243926287364832122L;

	/*
	 * @Resource private LoperatorprivilegeDao operatorprivilegeDao; private
	 * List<Smodule> modulelist;
	 * 
	 * public List<Smodule> getModulelist() { return modulelist; }
	 */

	@Override
	public String execute() throws Exception {
		Object loginer = getSession().get(Global.SESSION_KEY_LOGINER);
		if (loginer != null && loginer instanceof LtSpOperator) {
			LtSpOperator operator = (LtSpOperator) loginer;
			// modulelist =
			// operatorprivilegeDao.getModuleList(operator.getId());
		}
		return super.execute();
	}
}
