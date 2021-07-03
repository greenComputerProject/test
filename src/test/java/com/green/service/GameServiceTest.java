package com.green.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.CompanyVO;
import com.green.domain.GameVO;
import com.green.domain.SpecVO;
import com.green.domain.TagVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class GameServiceTest {

	@Autowired
	private GameService service;
	
	@Test
	private void 게임_등록() {
		CompanyVO companyvo = new CompanyVO();
		GameVO gamevo = new GameVO();
		TagVO tagvo = new TagVO();
		SpecVO specvo = new SpecVO();
		
		String company = "EpicGames";
		String country = "usa";
		gamevo.setTitle(country);
		gamevo.setAgeLimit(country);
		gamevo.setPrice(1231232L);
		gamevo.setContent(country);
		
	}
}
