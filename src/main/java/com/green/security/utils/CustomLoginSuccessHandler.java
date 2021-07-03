package com.green.security.utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.green.oauth2.domain.SessionUser;
import com.green.security.domain.SecurityMemberVO;
import com.green.security.domain.SecurityUser;
import com.green.security.mapper.SecurityMemberMapper;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private SecurityMemberMapper mapper;
	
	@Autowired(required = false)
	private HttpSession session;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		SecurityUser securityUser = (SecurityUser) authentication.getPrincipal();
		SecurityMemberVO loginedMember = mapper.getOne(securityUser.getUsername());
		session.setAttribute("user", new SessionUser(loginedMember));
		
		response.sendRedirect("/");
	}

}
