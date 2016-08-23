package com.jshop.action.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.jshop.util.SpringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	public static Log logger = LogFactory.getLog(BaseAction.class);

	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final String LIST = "list";
	public static final String EDIT = "edit";
	public static final String VIEW = "view";
	public static final String ADD = "add";
	public static final String FREEMARKER = "freemarker";
	public static final String JSON = "json";

	protected String msg;// 返回给前台的信息
	protected Boolean success;// 前台操作后的返回结果
	private SpringUtil springUtil;

	public SpringUtil getSpringUtil() {
		return springUtil;
	}

	@Resource
	public void setSpringUtil(SpringUtil springUtil) {
		this.springUtil = springUtil;
	}

	// 获取Attribute
	public Object getAttribute(String name) {
		return ServletActionContext.getRequest().getAttribute(name);
	}

	// 设置Attribute
	public void setAttribute(String name, Object value) {
		ServletActionContext.getRequest().setAttribute(name, value);
	}

	// 获取Parameter
	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}

	// 获取Parameter数组
	public String[] getParameterValues(String name) {
		return getRequest().getParameterValues(name);
	}

	// 获取Session
	public Object getSession(String name) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		return session.get(name);
	}

	// 获取Session
	public Map<String, Object> getSession() {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		return session;
	}

	// 设置Session
	public void setSession(String name, Object value) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.put(name, value);
	}

	// 删除Session
	public void deleteSession(String name) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.remove(name);
	}

	// 获取Request
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	// 获取Response
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	// 获取Application
	public ServletContext getApplication() {
		return ServletActionContext.getServletContext();
	}

	public String getMsg() {
		return msg;
	}

	public Boolean getSuccess() {
		return success;
	}
}
