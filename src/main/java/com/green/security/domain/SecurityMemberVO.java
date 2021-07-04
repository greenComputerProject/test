package com.green.security.domain;

import com.green.oauth2.domain.Role;

import lombok.Data;

@Data
// OAuth2 와 같은 테이블을 공유, 패스워드만 추가됨
public class SecurityMemberVO {

	private String userid;
	private String name;
	private String email;
	private String password;
	private Role role;
	
	public String getRoleKey() {
		return this.role.getKey();
	}
	
}
