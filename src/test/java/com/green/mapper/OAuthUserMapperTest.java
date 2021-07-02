package com.green.mapper;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.oauth2.domain.OAuthUserVO;
import com.green.oauth2.domain.Role;
import com.green.oauth2.mapper.OAuthUserMapper;
import com.nimbusds.oauth2.sdk.id.Audience;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class OAuthUserMapperTest {

	@Setter(onMethod_=@Autowired)
	private OAuthUserMapper mapper;
	
	//@After
	public void cleanUp() {
		mapper.deleteAll();
	}
	
	@Test
	public void testInsertAndGet() {
		
		String email = "thd@nac.com";
		String picture = "picture";
		String name = "name";
		
		OAuthUserVO vo = new OAuthUserVO();
		vo.setEmail(email);
		vo.setPicture(picture);
		vo.setName(name);
		vo.setRole(Role.MEMBER);
		
		mapper.insert(vo);
		
		log.info(mapper.findByEmail(email));
		
	}
	
	//@Test
	public void testUpdate() {
		
		String email = "thd@nac.com";
		String picture = "picture";
		String name = "name";
		
		OAuthUserVO vo = new OAuthUserVO();
		vo.setEmail(email);
		vo.setPicture(picture);
		vo.setName(name);
		vo.setRole(Role.MEMBER);
		
		mapper.insert(vo);
		
		String expectedName = "exName";
		String expectedPicture = "exPicture";
		
		vo.setName(expectedName);
		vo.setPicture(expectedPicture);
		
		mapper.update(vo);
		
		OAuthUserVO updatedVO = mapper.findByEmail(email);
		
		log.info("EXPECTED NAME =========>" + updatedVO.getName());
		log.info("EXPECTED PICUTER =========>" + updatedVO.getPicture());
		log.info("EXPECTED ROLE ==========>" + updatedVO.getRole().getKey());
	}
	
	
	
	//mapper가 아무것도 찾을 수 없을때 에러가 뜨는지 확인하는 테스트
	//@Test
	public void exceptionTest(){
		
		log.info("===============>" + mapper.findByEmail("assdasfhgkdl"));
	}
	
	//@Test
	public void testInserNull() {
		String email = "thd@nac.com";
		String picture = null;
		String name = "name";
		
		OAuthUserVO vo = new OAuthUserVO();
		vo.setEmail(email);
		vo.setPicture(picture);
		vo.setName(name);
		vo.setRole(Role.MEMBER);
		
		mapper.insert(vo);
		
		String expectedName = "exName";
		String expectedPicture = "exPicture";
		
		vo.setName(expectedName);
		vo.setPicture(expectedPicture);
		
		mapper.update(vo);
		
		OAuthUserVO updatedVO = mapper.findByEmail(email);
		
		log.info("EXPECTED NAME =========>" + updatedVO.getName());
		log.info("EXPECTED PICUTER =========>" + updatedVO.getPicture());
		log.info("EXPECTED ROLE ==========>" + updatedVO.getRole().getKey());
	}
}
