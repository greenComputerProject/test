package com.green.oauth2.domain;

import java.util.Map;

import lombok.Builder;
import lombok.Getter;

@Getter
public class OAuthAttributes {

	private Map<String, Object> attributes;
	private String nameAttributeKey;
	private String name;
	private String email;
	private String picture;
	
	@Builder
	public OAuthAttributes(Map<String, Object> attributes,
			String nameAttributeKey, String name, String email
			,String picture) {
		
		this.attributes =attributes;
		this.nameAttributeKey = nameAttributeKey;
		this.name =name;
		this.email =email;
		this.picture =picture;
	}
	
	public static OAuthAttributes of(String registrationId,
			String userNameAttributeName, Map<String, Object> attributes) {
		if(registrationId.equals("google")) return ofGoogle(userNameAttributeName, attributes);
		if(registrationId.equals("facebook")) return ofFacebook(userNameAttributeName, attributes);
		return null;
	}
	
	private static OAuthAttributes ofGoogle(String userNameAttributeName
			,  Map<String, Object> attributes) {
		
		return OAuthAttributes.builder()
				.name((String)attributes.get("name"))
				.email((String)attributes.get("email"))
				.picture((String)attributes.get("picture"))
				.attributes(attributes)
				.nameAttributeKey(userNameAttributeName)
				.build();
	}
	
	private static OAuthAttributes ofFacebook(String userNameAttributeName, Map<String, Object> attributes) {
		
		//String userInfoEndpointUri = "https://graph.facebook.com/me?fields=email,name,photos";
		
		
		
		System.out.println("FACEBOOK ATTRIBUTES ==================================> " + attributes.toString() );
		return OAuthAttributes.builder()
				.name((String)attributes.get("name"))
				.email((String)attributes.get("id"))
				.attributes(attributes)
				.nameAttributeKey(userNameAttributeName)
				.build();
		
	}
	
	public OAuthUserVO toEntity() {
		OAuthUserVO user = new OAuthUserVO();
		user.setName(name);
		user.setEmail(email);
		user.setPicture(picture);
		user.setRole(Role.MEMBER);
		
		return user;
	}
}
