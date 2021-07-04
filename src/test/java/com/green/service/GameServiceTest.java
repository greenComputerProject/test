package com.green.service;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.CompanyVO;
import com.green.domain.GameVO;
import com.green.domain.SpecVO;
import com.green.domain.TagVO;
import com.green.mapper.GameMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class GameServiceTest {

	@Autowired
	private GameService service;
	
	@Autowired
	private GameMapper mapper;
	
	private static final String title = "title";
	
	
	@Test
	public void 게임_등록() {
		CompanyVO companyvo = new CompanyVO();
		GameVO gamevo = new GameVO();
		TagVO tagvo = new TagVO();
		SpecVO specvo = new SpecVO();
		
		companyvo.setCompany("epic");
		companyvo.setCountry("usa");
		gamevo.setTitle(title);
		gamevo.setAgeLimit("19");
		gamevo.setPrice(1231232L);
		gamevo.setContent("content");
		tagvo.setTagName("tag");
		specvo.setCpu("cpu");
		specvo.setGpu("gpu");
		specvo.setLanguage("eng");
		specvo.setOs("os");
		specvo.setRam("ram");
		
		service.register(companyvo, gamevo, tagvo, specvo);
		
		
	}

	@Test
	public void 게임_조회() {
		
		log.info(service.read(title).toString());
		
	}
	
	@Test
	public void 삭제() {
		
		Long gno = mapper.read(title).getGno();
		
		mapper.delete(gno);
	}
	
}
