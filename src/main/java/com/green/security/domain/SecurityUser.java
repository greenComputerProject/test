package com.green.security.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.green.oauth2.domain.Role;

import lombok.Getter;

@Getter
public class SecurityUser extends User{

	private static final long serialVersionUID = 1L;
	
	private SecurityMemberVO vo;
	
	public SecurityUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}

	public SecurityUser(SecurityMemberVO vo, List<Role> authList) {
		
		super(vo.getEmail(), vo.getPassword(), 
				authList.stream().map(auth -> new SimpleGrantedAuthority(auth.getKey())).collect(Collectors.toList()) );
		
		this.vo =vo;
	}
}
