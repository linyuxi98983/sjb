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
public class PCInterceptor extends MethodFilterInterceptor implements
		Serializable {

	private static final long serialVersionUID = 2375497057550305779L;
	private static Log logger = LogFactory.getLog(LoginInterceptor.class);
	
	
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(StrutsStatics.HTTP_REQUEST);
		String namespace = invocation.getProxy().getNamespace();
	
		Object loginer = null;
		Map session = ctx.getSession();
		System.out.println(session.get("member"));
		if(session.get("member")!=null){
			session.put("member", (LtSpMember)session.get("member"));
			
			session.put("memberId", ((LtSpMember)session.get("member")).getId());
		}
		
		System.out.println(SessionMember.getSessionUser());
		String result = invocation.invoke();
		return result;
	}
}
