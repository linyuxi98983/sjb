package com.jshop.common;

import java.net.URISyntaxException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

/**
 * 公共类 - 全局变量、方法
 * 
 * @author Jacky Shen
 */
public class Global {

	public static Log logger = LogFactory.getLog(Global.class);

	// 全局
	public static final String ENCODING = "utf-8";// 编码

	// 后台Action - ParentPackage
	public static final String PP_WEB = "web";// 电脑后台ParentPackage
	public static final String PP_APP = "app";// 手机app ParentPackage
	public static final String PP_MOBILE = "mobile";// 手机商城 ParentPackage
	public static final String PP_SHOP = "shop";// 电脑商城 ParentPackage
	public static final String PP_PC = "pc";// 电脑商城 ParentPackage
	public static final String PP_LOGIN = "login";// 后台登录ParentPackage

	// SESSION - KEY
	public static final String SESSION_KEY_LOGINER = "loginer";// 后台登录人
	public static final String SESSION_KEY_MOBILE_LOGINER = "mobile_loginer";// H5登录人信息
	public static final String SESSION_KEY_SHOP_LOGINER = "shop_loginer";// PC端登录人信息
	

	public static final String SESSION_KEY_PC_LOGINER = "pc_loginer";
	public static final String SESSION_KEY_PC_YEZHU_LOGINER = "yezhu_loginer";// PC端登录人信息
	
	public static final String SESSION_KEY_PC_DESIGNER_LOGINER = "designer_loginer";// PC端登录人信息
	
	public static final String SESSION_KEY_PC_ORG_LOGINER = "org_loginer";// PC端登录人信息
	
	
	public static String getResourcePath(String path) {
		try {
			return Thread.currentThread().getContextClassLoader()
					.getResource(path).toURI().getPath();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getResourcePath() {
		return getResourcePath("");
	}

	public static String getRealPath(String path) {
		return ServletActionContext.getServletContext().getRealPath(path);
	}

	public static String getRealPath() {
		return ServletActionContext.getServletContext().getRealPath("");
	}

	/**
	 * 获取url域名+应用程序名+端口号
	 * 
	 * @return
	 */
	public static String getBase() {
		String path = ServletActionContext.getRequest().getContextPath();
		String basePath = ServletActionContext.getRequest().getScheme() + "://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort() + path;
		return basePath;
	}
}
