package com.jshop.common;

import java.io.Serializable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.jshop.action.mobile.login.SessionMember;
import com.jshop.entity.LtSpMember;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * PC登录拦截器
 * 
 * @author Jacky Shen
 * 
 */
public class ShopLoginInterceptor extends MethodFilterInterceptor implements
		Serializable {

	private static final long serialVersionUID = 2375497057550305779L;
	private static Log logger = LogFactory.getLog(LoginInterceptor.class);
	private static final String includePackages = "order,member";// 要判断登陆的包名集合

	
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(StrutsStatics.HTTP_REQUEST);
		String namespace = invocation.getProxy().getNamespace();
		if (namespace.split("/").length >= 3) {// 处理首页
			namespace = namespace.split("/")[2];
		} else {
			namespace = namespace.split("/")[1];
		}

		
		if (includePackages.indexOf(namespace) != -1) {
			Object loginer = null;
			Map session = ctx.getSession();
			loginer = session.get(Global.SESSION_KEY_SHOP_LOGINER);
			SessionMember.setSessionUser((LtSpMember) loginer);
			if (loginer == null) {
				return Action.LOGIN;// 返回登陆页面
			}
		}
		String result = invocation.invoke();
		return result;
	}
}
