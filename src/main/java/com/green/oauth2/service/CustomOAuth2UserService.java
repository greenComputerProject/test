package com.green.oauth2.service;

import java.util.Collections;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.green.oauth2.domain.OAuthAttributes;
import com.green.oauth2.domain.OAuthUserVO;
import com.green.oauth2.domain.SessionUser;
import com.green.oauth2.mapper.OAuthUserMapper;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
	
	@Autowired
	private CommonOAuth2UserService service;


	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		// TODO Auto-generated method stub
		
		System.out.println("ARRIVED AT LOAD USER");
		OAuth2UserService delegate = new DefaultOAuth2UserService();
		OAuth2User oAuth2User = delegate.loadUser(userRequest);
		
		String registrationId = userRequest.getClientRegistration().getRegistrationId();
		String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
		System.out.println("OAUTH2 USER : " + oAuth2User.toString());
		System.out.println("registrationId".toUpperCase() + " => " + registrationId);
		System.out.println("EMAIL: " + oAuth2User.getAttributes().get("public_profile"));
		OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());
		System.out.println("CHANGED TO OAUTH ATTRIBUTES");
		OAuthUserVO user = service.saveOrUpdate(attributes);
		
		service.getSession().setAttribute("userid", user.getUserid());
		service.getSession().setAttribute("user", new SessionUser(user));
		System.out.println("SAVED USER INFO IN SESSION");
		return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority(user.getRoleKey())), 
				attributes.getAttributes(), attributes.getNameAttributeKey());
	}
	
//	private OAuthUserVO saveOrUpdate(OAuthAttributes attributes) {
//		System.out.println("ATTRIBUTES.EMAIL ====================> " + attributes.getEmail());
//		OAuthUserVO findedUser = mapper.findByEmail(attributes.getEmail());
//		
//		if(findedUser != null) {
//			findedUser.setName(attributes.getName());
//			findedUser.setPicture(attributes.getPicture());
//			mapper.update(findedUser);
//		} else {
//			OAuthUserVO user = attributes.toEntity();
//			
//			mapper.insert(user);
//		}
//		
//		return mapper.findByEmail(attributes.getEmail());
//	}
//	
//	
//	public HttpSession getSession() {
//		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//		return sra.getRequest().getSession();
//	}
}
