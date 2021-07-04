package com.green.oauth2.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.ResolvableType;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import lombok.Setter;
@PropertySource("classpath:/application.properties")
@Controller
public class OAuth2Controller {
	
	private static String authorizationRequestBaseUri = "oauth2/authorization";
	
	Map<String, String> oauth2AuthenticationUrls = new HashMap<String, String>();
	
	@Setter(onMethod_=@Autowired)
	private ClientRegistrationRepository clientRegistrationRepository;
	
	@Setter(onMethod_=@Autowired)
	private OAuth2AuthorizedClientService authorizedClientService;
	
	//application.properties의 설정을 가져오기 위해
	@Setter(onMethod_=@Autowired)
	private Environment env;
	

	@GetMapping("/oauth_login")
	public String getLoginPage(Model model, String error) {
		
		System.out.println("ERROR : " + error);
		Iterable<ClientRegistration> clientRegistrations = null;
		
		ResolvableType type = ResolvableType.forInstance(clientRegistrationRepository)
				.as(Iterable.class);
		
		if(type != ResolvableType.NONE && 
				ClientRegistration.class.isAssignableFrom(type.resolveGenerics()[0])) {
			clientRegistrations = (Iterable<ClientRegistration>) clientRegistrationRepository;
		}
		
		clientRegistrations.forEach(registration -> 
	      oauth2AuthenticationUrls.put(registration.getClientName(), 
	      authorizationRequestBaseUri + "/" + registration.getRegistrationId()));
		
		model.addAttribute("urls", oauth2AuthenticationUrls);
		model.addAttribute("error", error);
		
		return "oauth_login";
	}
	
	
	
	@GetMapping("/loginSuccess")
	public String getLoginInfo(Model model, OAuth2AuthenticationToken authentication, HttpSession httpSession) {
		OAuth2AuthorizedClient client = authorizedClientService
				.loadAuthorizedClient(
						authentication.getAuthorizedClientRegistrationId()
						, authentication.getName());
		
		System.out.println("loginSuccess client: " + client);
		
		String registrationId = client.getClientRegistration().getRegistrationId();
		
		String userInfoEndpointUri = client.getClientRegistration()
				.getProviderDetails().getUserInfoEndpoint().getUri();
		
		System.out.println("userInfoEndpointUri : " + userInfoEndpointUri);
		
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		if(!StringUtils.isEmpty(userInfoEndpointUri) && "google".equals(registrationId)) {
			
			headers.add(HttpHeaders.AUTHORIZATION, "Bearer" + client.getAccessToken()
			.getTokenValue());
			
			HttpEntity entity = new HttpEntity("", headers);
			ResponseEntity<Map> response = restTemplate
					.exchange(userInfoEndpointUri, HttpMethod.GET, entity, Map.class);
			
			Map userAttributes = response.getBody();
			model.addAttribute("name", userAttributes.get("name"));
		}
		
		return "loginSuccess";
	}
	
	
	@GetMapping("/userInfoTest")
	public String getUserInfoFromSession(HttpSession session, Model model) {
		
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("userid", session.getAttribute("userid"));
		return "userInfoTest";
	}
	
}
