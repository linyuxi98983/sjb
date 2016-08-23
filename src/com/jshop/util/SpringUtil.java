package com.jshop.util;

import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.LocaleResolver;

import com.jshop.action.mobile.login.SessionMember;
import com.jshop.entity.LtSpMember;

@Component
public class SpringUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		SpringUtil.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 根据Bean名称获取实例
	 * 
	 * @param name
	 *            Bean注册名称
	 * 
	 * @return bean实例
	 * 
	 * @throws BeansException
	 */
	public static Object getBean(String name) throws BeansException {
		if (applicationContext.containsBean(name)) {
			return applicationContext.getBean(name);
		}
		return null;
	}

	public static String getMessage(String code) {
		return getMessage(code, null);
	}

	public static String getMessage(String code, Object[] args) {
		LocaleResolver localLocaleResolver = (LocaleResolver) getBean("localeResolver");
		Locale localLocale = localLocaleResolver.resolveLocale(null);
		return applicationContext.getMessage(code, args, localLocale);
	}

	public static String getMemberId() {
		return SessionMember.getSessionUserId() + "";
	}
	public static LtSpMember getMember(){
		
		return SessionMember.getSessionUser();
	}
}