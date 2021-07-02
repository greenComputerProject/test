package com.green.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.green.oauth2.domain.Role;
import com.green.oauth2.domain.SessionUser;
import com.green.security.domain.SecurityMemberVO;
import com.green.security.domain.SecurityUser;
import com.green.security.mapper.SecurityMemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private SecurityMemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		SecurityMemberVO vo = mapper.getOne(username);
		if(vo == null) {
			return null;
		} else {
		
			log.info(vo.getEmail());
			log.info(vo.getPassword());
			log.info(vo.getRoleKey());
			
			List<Role> authList = new ArrayList<Role>();
			
			authList.add(vo.getRole());
			
			return new SecurityUser(vo, authList);
		}
	}

}
