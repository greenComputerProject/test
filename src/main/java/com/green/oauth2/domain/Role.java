package com.green.oauth2.domain;

public enum Role {
	MEMBER("ROLE_MEMBER","일반사용자")
	, ROLE_ADMIN("ROLE_ADMIN","운영자");
	
	private final String key;
	private final String value;
	private Role(String key, String value) {
		// TODO Auto-generated constructor stub
		this.key = key;
		this.value =value;
	}
	
	public String getKey() {
		return key;
	}
	public String getValue() {
		return value;
	}
	
}
