package com.green.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@NoArgsConstructor
@Log4j
public class PurchaseServiceTest {

	@Autowired
	private PurchaseService service;
	
	@Test
	public void 구매() {
		
		String userid = "2";
		Long gno = 10L;
		
		log.info(service.purchase(userid, gno));
	}
	
	@Test
	public void 구매목록_조회() {
		
		String userid = "1";
		
		log.info(service.getList(userid));
	}
	
}
