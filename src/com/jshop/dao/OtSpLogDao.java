package com.jshop.dao;

import com.jshop.entity.LtSpOperator;
import com.jshop.entity.OtSpLog;
import com.opensymphony.xwork2.ActionInvocation;

public interface OtSpLogDao extends BaseWebCRUDDao<OtSpLog, Integer> {
	public static final String MESSAGE_LOG_PRE = "web.log.";
	public static final String MESSAGE_PACKAGE_PRE = "web.package.";

	public void saveWebLog(ActionInvocation invocation, LtSpOperator operator)
			throws Exception;
}
