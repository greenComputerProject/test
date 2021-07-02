package com.green.oauth2.domain;

import lombok.Data;

@Data
public class OAuthUserVO {

	private String userid;
	private String name;
	private String email;
	private String picture;
	private Role role;
	
	public String getRoleKey() {
		return this.role.getKey();
	}
}
