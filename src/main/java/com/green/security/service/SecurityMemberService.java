package com.green.security.service;

import com.green.security.domain.SecurityMemberVO;

public interface SecurityMemberService {
	
	public boolean signUp(SecurityMemberVO vo);
	public SecurityMemberVO getMember(String email);
	public boolean updateUser(SecurityMemberVO vo);
	public boolean delete(String userid);


}
