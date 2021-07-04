package com.green.security.mapper;

import com.green.security.domain.SecurityMemberVO;

public interface SecurityMemberMapper {
	
	public int insert(SecurityMemberVO vo);
	public SecurityMemberVO getOne(String email);
	public int update(SecurityMemberVO vo);
	public int delete(String userid);
	
}
