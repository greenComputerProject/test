package com.green.security.mapper;


import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.oauth2.domain.Role;
import com.green.security.domain.SecurityMemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

@Log4j
public class SecurityMemberMapperTest {
	
	@Autowired
	private SecurityMemberMapper mapper;
	
	@Autowired
	private PasswordEncoder encoder;
	
	private static final String EMAIL = "thdrkdcks@naver.com";
	
	private static final String NAME = "송강훈";
	private static final String NEWNAME = "송창희";
	
	private static final String PASSWORD = "ekdls93";
	private static final String NEWPASSWORD = "rkdcks123";
	private static SecurityMemberVO vo = new SecurityMemberVO();

	
	//@After
	public void 테스트용_유저_삭제(){
		
		String userid = mapper.getOne(EMAIL).getUserid();
		mapper.delete(userid);
	}
	
	@Test
	public void 회원_꺼내기() {
	
		log.info(mapper.getOne(EMAIL).getRoleKey());
		
	}
	
	@Test
	public void 회원_등록() {
		
		vo.setEmail(EMAIL);
		vo.setName(NAME);
		vo.setPassword(encoder.encode(PASSWORD));
		vo.setRole(Role.MEMBER);
		
		mapper.insert(vo);
	}
	
	@Test
	public void 회원_수정() {
	
		
		vo = mapper.getOne("owo57@naver.com");
		SecurityMemberVO newVO = new SecurityMemberVO();
		log.info(vo);
		newVO.setUserid(vo.getUserid());
		newVO.setPassword("ekdls93");
		newVO.setName("");
		mapper.update(newVO);
		
		
	}
	
	
	

	
	

}
