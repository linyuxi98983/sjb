package com.jshop.common;

import java.io.Serializable;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.jshop.dao.OtSpLogDao;
import com.jshop.entity.LtSpOperator;
import com.jshop.util.SpringUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 登录拦截器
 * 
 * @author Jacky Shen
 * 
 */
public class LoginInterceptor extends MethodFilterInterceptor implements
		Serializable {

	private static final long serialVersionUID = 2375497057550305779L;
	private static Log logger = LogFactory.getLog(LoginInterceptor.class);

	@Resource
	private OtSpLogDao logDao;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx
				.get(StrutsStatics.HTTP_RESPONSE);
		String actionMethodName = invocation.getProxy().getMethod();
		/*
		 * String actionClassName = invocation.getAction().getClass().getName();
		 * logger.debug(request.getServletPath());
		 * logger.debug(request.getContextPath());
		 * logger.debug(request.getQueryString());
		 * logger.debug(request.getMethod()); logger.debug(actionClassName);
		 * logger.debug(actionMethodName);
		 * logger.debug(invocation.getProxy().getNamespace());
		 */
		Object loginer = null;
		Map session = ctx.getSession();
		loginer = session.get(Global.SESSION_KEY_LOGINER);
		if (loginer == null) {
			return Action.LOGIN;
		}
		if (loginer instanceof LtSpOperator) {
			if (SpringUtil.getMessage(
					OtSpLogDao.MESSAGE_LOG_PRE + actionMethodName).indexOf(
					OtSpLogDao.MESSAGE_LOG_PRE) == -1) {
				logDao.saveWebLog(invocation, (LtSpOperator) loginer);
			}
		}
		String result = invocation.invoke();
		return result;
	}
}
