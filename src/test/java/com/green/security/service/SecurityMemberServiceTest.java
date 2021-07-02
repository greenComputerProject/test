package com.green.security.service;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.oauth2.domain.Role;
import com.green.security.domain.SecurityMemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

@Log4j
public class SecurityMemberServiceTest {

	@Autowired
	private SecurityMemberService service;
	
	private static final String EMAIL = "thdrkdcks@naver.com";
	
	private static final String NAME = "송강훈";
	private static final String NEWNAME = "송창희";
	
	private static final String PASSWORD = "ekdls93";
	private static final String NEWPASSWORD = "rkdcks123";
	private static SecurityMemberVO vo = new SecurityMemberVO();

	
	@Test
	public void 회원_탈퇴() {
		String userid = service.getMember(EMAIL).getUserid();
		service.delete(userid);
	}
	
	@Test
	public void 회원_가입() {
		vo.setEmail(EMAIL);
		vo.setName(NAME);
		vo.setPassword(PASSWORD);
		vo.setRole(Role.MEMBER);
		
		service.signUp(vo);
	}
	
	@Test
	public void 회원_조회() {
		
		log.info(service.getMember(EMAIL));
	}
	

	
}
