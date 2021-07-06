package com.green.utils;

import javax.servlet.http.HttpSession;

import com.green.oauth2.domain.SessionUser;

public class SessionUserGetter {
	
	public static SessionUser getSessionUser(HttpSession session) {
		return (SessionUser)session.getAttribute("user");
	}
	
	public static String getSessionUserId(HttpSession session) {
		SessionUser user = getSessionUser(session);
		return user.getUserid();
	}
	
	public static String getSessionUserName(HttpSession session) {
		SessionUser user=  getSessionUser(session);
		return user.getName();
	}
	
	public static String getSessionUserEmail(HttpSession session) {
		SessionUser user=  getSessionUser(session);
		return user.getEmail();
	}
}
