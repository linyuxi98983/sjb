package com.jshop.common;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 异常拦截器
 * 
 * @author Jackyshen
 * 
 */
public class ExceptionInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -4372064686392270475L;
	protected static Log logger = LogFactory.getLog(ExceptionInterceptor.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception,
			SQLException {
		logger.debug("=========================> ExceptionInteceptor");
		String result = "json";
		String errorMsg = "";
		String msg = "";
		try {
			result = invocation.invoke();
		} catch (SQLException e) {
			result = "json";
			logger.error(errorMsg, e);// 记录日志
			e.printStackTrace();
			errorMsg = e.getMessage();
			msg = "数据库操作错误！";
			jsonResult(invocation, errorMsg, msg);
			throw e;
		} catch (Exception e) {
			result = "json";
			logger.error(errorMsg, e);// 记录日志
			e.printStackTrace();
			if (e.getCause() != null) {
				if (e.getCause() instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException) {
					msg = "数据库语句有错！";
				}
				errorMsg = e.getCause().getMessage().toString();
			} else {
				msg = e.getMessage();
				errorMsg = e.getMessage();
			}
			jsonResult(invocation, errorMsg, msg);
			throw e;
		}
		return result;
	}

	private void jsonResult(ActionInvocation invocation, String errorMsg,
			String msg) {
		HttpServletResponse response = (HttpServletResponse) invocation
				.getInvocationContext().get(StrutsStatics.HTTP_RESPONSE);
		JSONObject json = new JSONObject();
		json.put("success", false);
		if (msg.indexOf("死锁") != -1 || errorMsg.indexOf("死锁") != -1) {
			msg = "网络繁忙请重试";
			errorMsg = msg;
		}
		json.put("msg", msg);
		json.put("errorMsg", errorMsg);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		try {
			response.getWriter().append(json.toString());
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
