package com.green.mapper;

import java.util.ArrayList;
import java.util.List;

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
public class GameListMapperTest {
	
	@Autowired
	private GameListMapper mapper;
	
	@Test
	public void getListTest() {
		
		//given	
		List<String> filters = new ArrayList<String>();
//		filters.add("멀티플레이");
//		filters.add("fps");
		filters.add("N");
		String order = "g.regDate";
		String keyword = "Kart";
		String direction = "desc";
		
		Criteria criteria = new Criteria(1, 5);
		SortFilterSearch sort = SortFilterSearch
				.builder()
				.filterList(filters)
				.order(order)
				.keyword(null)
				.direction(direction)
				.build();
		
		//then
		mapper.getList(criteria, sort).forEach(i -> log.info(i));
		
	}
	
	@Test
	public void 인덱스목록조회() {
		
		mapper.getListForIndex().forEach(i -> log.info(i));
	}
	
	@Test
	public void 총갯수테스트() {
		
		log.info("==========>" + mapper.getCount(new Criteria(), null));
	}
	
	@Test
	public void Sort널일때() {
		
		log.info(mapper.getList(new Criteria(), new SortFilterSearch()));
		log.info(mapper.getCount(new Criteria(),  new SortFilterSearch()));
	}
}
