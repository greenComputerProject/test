package com.green.oauth2.domain;

import java.io.Serializable;

import com.green.security.domain.SecurityMemberVO;

import lombok.Getter;


@Getter
public class SessionUser implements Serializable{
	
	private String userid;
	private String email;
	private String name;
	private String picture;
	
	public SessionUser(OAuthUserVO user) {
		this.userid = user.getUserid();
		this.name = user.getName();
		this.email = user.getEmail();
		this.picture = user.getPicture();
	}
	
	public SessionUser(SecurityMemberVO user) {
		this.userid = user.getUserid();
		this.name = user.getName();
		this.email = user.getEmail();
	}

}
