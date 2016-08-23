package com.jshop.action.mobile.login;

import com.jshop.entity.LtSpMember;

public class SessionMember {
	@SuppressWarnings("unchecked")
	static ThreadLocal sessionUser = new ThreadLocal();

	@SuppressWarnings("unchecked")
	public static void setSessionUser(LtSpMember member) {
		sessionUser.set(member);
	}

	public static LtSpMember getSessionUser() {
		return (LtSpMember) sessionUser.get();
	}

	public static Integer getSessionUserId() {
		if (getSessionUser() != null) {
			return getSessionUser().getId();
		}
		return null;
	}

	public static String getSessionUserName() {
		if (getSessionUser() != null) {
			return getSessionUser().getNickname();
		}
		return null;
	}
}
