package com.green.oauth2.service;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.green.oauth2.domain.OAuthAttributes;
import com.green.oauth2.domain.OAuthUserVO;
import com.green.oauth2.domain.SessionUser;
import com.green.oauth2.mapper.OAuthUserMapper;

@Service
public class CustomOidcUserService extends OidcUserService{
	
	@Autowired
	private CommonOAuth2UserService service;
	
//	@Autowired(required = true)
//	private HttpSession httpSession;
	
	@Override
	public OidcUser loadUser(OidcUserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("ARRIVED AT LOAD USER");
		OidcUserService delegate = new OidcUserService();
		OidcUser oAuth2User = delegate.loadUser(userRequest);
		
		String registrationId = userRequest.getClientRegistration().getRegistrationId();
		String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
		
		OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());
		System.out.println("CHANGED TO OAUTH ATTRIBUTES");
		OAuthUserVO user = service.saveOrUpdate(attributes);
		
		OAuth2AccessToken token = userRequest.getAccessToken();
		OidcIdToken oidcToken = new OidcIdToken(token.getTokenValue(), token.getIssuedAt(), token.getExpiresAt(),attributes.getAttributes() );
		
		service.getSession().setAttribute("userid", user.getUserid());
		service.getSession().setAttribute("user", new SessionUser(user));
		System.out.println("SAVED USER INFO IN SESSION");
		return new DefaultOidcUser(Collections.singleton(new SimpleGrantedAuthority(user.getRoleKey())), 
				oidcToken, attributes.getNameAttributeKey());
	}
	
	
}
