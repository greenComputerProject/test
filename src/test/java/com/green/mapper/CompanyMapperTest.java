package com.green.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.CompanyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class CompanyMapperTest {
	
	@Autowired
	private CompanyMapper mapper;
	
	@Test
	public void 회사_등록_테스트() {
		
		//given
		CompanyVO vo = new CompanyVO();
		vo.setCompany("EpicGames");
		vo.setCountry("USA");
		
		//then
		mapper.register(vo);
	}

}
