package com.jshop.common;

import java.io.Serializable;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 登录拦截器
 * 
 * @author Jacky Shen
 * 
 */
public class AppInterceptor extends AbstractInterceptor implements Serializable {

	private static final long serialVersionUID = 2375497057550305779L;
	private static Log logger = LogFactory.getLog(AppInterceptor.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		logger.debug("====================================>AppInterceptor");
		/*
		 * ActionContext ctx = invocation.getInvocationContext();
		 * 
		 * Map r = (Map)ctx.get("request"); Map params = ctx.getParameters();
		 * for (Object key : params.keySet()) { String[] o =
		 * (String[])params.get(key); if (o != null && o.length > 0) {
		 * System.out.println("key= "+ key + " and value= " + o[0]); } }
		 * 
		 * for (Object key2 :r.keySet()) { System.out.println("key2= "+ key2 +
		 * " and value= " + r.get(key2)); }
		 * 
		 * HttpServletRequest request =
		 * (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		 * System.out.println("Username="+request.getParameter("Username"));
		 * Enumeration names = request.getHeaderNames(); StringBuilder sb = new
		 * StringBuilder("headerInfo---"); while(names.hasMoreElements()) {
		 * String name = names.nextElement().toString(); Enumeration headers =
		 * request.getHeaders(name); sb.append(name).append(":");
		 * while(headers.hasMoreElements()) {
		 * sb.append(headers.nextElement()).append(" "); } sb.append("\n"); }
		 * System.out.println(sb.toString());
		 * 
		 * 
		 * Map params2 = request.getParameterMap(); for (Object key :
		 * params2.keySet()) { String[] o = (String[])params2.get(key); if (o !=
		 * null && o.length > 0) { System.out.println("key= "+ key +
		 * " and value= " + o[0]); } }
		 * 
		 * String[] data = (String[])params.get("data"); params.put("data",
		 * data);
		 */
		return invocation.invoke();
	}

}
