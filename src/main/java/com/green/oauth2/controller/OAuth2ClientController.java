package com.green.oauth2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OAuth2ClientController {

	@Autowired
	private OAuth2AuthorizedClientService authorizedClientService;
	
	@GetMapping("/oauth2clientcontroller")
	public String index(Authentication authentication) {
		OAuth2AuthorizedClient authorizedClient =
				this.authorizedClientService.loadAuthorizedClient("google", 
						authentication.getName());
		
		OAuth2AccessToken accessToken = authorizedClient.getAccessToken();
		
		System.out.println("authorizedClient.getPrincipalName()==>" +authorizedClient.getPrincipalName());
		System.out.println("authorizedClient.getClientRegistration()==>" + authorizedClient.getClientRegistration());
		
		return "/oauth2clientcontroller";
	}
}
