package com.green.security.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.green.oauth2.domain.Role;
import com.green.oauth2.domain.SessionUser;
import com.green.security.domain.SecurityMemberVO;
import com.green.security.mapper.SecurityMemberMapper;

@Service
public class SecurityMemberServiceImpl implements SecurityMemberService {
	
	@Autowired
	private SecurityMemberMapper mapper;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean signUp(SecurityMemberVO vo) {
		// TODO Auto-generated method stub
		vo.setRole(Role.MEMBER);
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		return mapper.insert(vo) == 1? true : false;
	}

	@Override
	public SecurityMemberVO getMember(String email) {
		// TODO Auto-generated method stub
		return mapper.getOne(email);
	}
	
	@Override
	public boolean delete(String userid) {
		// TODO Auto-generated method stub
		boolean isSuccess = mapper.delete(userid) == 1 ? true: false;
		
		if(isSuccess) {
			session.setAttribute("user", null);
			return isSuccess;
		}
		
		return isSuccess;
	}
	

	@Override
	public boolean updateUser(SecurityMemberVO vo) {
		
		if(vo.getPassword() != null && !vo.getPassword().equals("")) {
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		}
		
		boolean isUpdated = mapper.update(vo) == 1 ? true: false;
		
		if(isUpdated && (vo.getName() != null && !vo.getName().equals(""))) {
			SecurityMemberVO updatedMember = mapper.getOne(vo.getEmail());
			session.setAttribute("user", new SessionUser(updatedMember));
			return true;
		}
		
		return isUpdated;
		
	}

	

}
