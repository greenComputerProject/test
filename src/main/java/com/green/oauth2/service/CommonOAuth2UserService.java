package com.green.oauth2.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.green.oauth2.domain.OAuthAttributes;
import com.green.oauth2.domain.OAuthUserVO;
import com.green.oauth2.mapper.OAuthUserMapper;

@Component
public class CommonOAuth2UserService {
	
	@Autowired
	private OAuthUserMapper mapper;

	public OAuthUserVO saveOrUpdate(OAuthAttributes attributes) {
		System.out.println("ATTRIBUTES.EMAIL ====================> " + attributes.getEmail());
		
		OAuthUserVO findedUser = mapper.findByEmail(attributes.getEmail());
		OAuthUserVO currentlyUpdatedUser  = null;
		
		if(findedUser != null) {
			findedUser.setName(attributes.getName());
			findedUser.setPicture(attributes.getPicture());
			mapper.update(findedUser);
		} else {
			OAuthUserVO user = attributes.toEntity();
			
			mapper.insert(user);
		}
		
		
		
		return mapper.findByEmail(attributes.getEmail());
	}
	
	public HttpSession getSession() {
		
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		
		return sra.getRequest().getSession();
	
	}
}
