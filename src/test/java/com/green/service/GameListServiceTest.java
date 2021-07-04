package com.green.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.utils.Criteria;
import com.green.utils.SortFilterSearch;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class GameListServiceTest {
	
	@Autowired
	private GameListService service;
	
	private final SortFilterSearch sort = SortFilterSearch.builder()
			.filterList(null)
			.keyword("Sims")
			.order("g.price")
			.direction("asc")
			.build();
	
	private final Criteria cri = new Criteria(1, 5);
	
	@Test
	public void 조건없음() {
		
		service.getList(cri, sort).forEach(i-> System.out.println(i));
	}
	
	@Test
	public void 총갯수세기() {
		System.out.println("==========> " + service.getCount(new Criteria(), null));
	}
}

