package com.green.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.CompanyVO;
import com.green.domain.GamePictureVO;
import com.green.domain.GameResourceVO;
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
		
		//given
		
		CompanyVO companyvo = new CompanyVO();
		GameVO gamevo = new GameVO();
		TagVO tagvo = new TagVO();
		SpecVO specvo = new SpecVO();
		GameResourceVO resourcevo = new GameResourceVO();
		GamePictureVO picturevo = new GamePictureVO();
		
		List<GamePictureVO> pictureList = new ArrayList<GamePictureVO>();
		pictureList.add(picturevo);
		
		//when
		
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
		resourcevo.setLogo("logo");
		resourcevo.setTitlePicture("titlePicture");
		resourcevo.setVideo("video");
		picturevo.setContentPicture("contentPicture");
		
		//then
		
		service.register(companyvo, gamevo, tagvo, specvo, resourcevo, pictureList);
		
		
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
