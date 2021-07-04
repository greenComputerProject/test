package com.green.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.WishlistVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class WishlistMapperTest {
	
	@Autowired
	private WishlistMapper mapper;
	
	@Test
	public void 등록() {
		
		String userid = "1";
		Long gno = 6L;
		
		WishlistVO vo = new WishlistVO();
		vo.setGno(gno);
		vo.setUserid(userid);
		
		mapper.insert(vo);
	}
	
	@Test
	public void 더미데이터삽입() {
		WishlistVO vo = new WishlistVO();
		for(Long i=0L ; i<5L; i++) {
			
			vo.setUserid("1");
			vo.setGno((long)(i+1));
			mapper.insert(vo);
		}
	}
	
	@Test
	public void 삭제() {
		
		Long wno = 5L;
		
		mapper.delete(wno);
	}
	
	@Test
	public void 목록불러오기() {
		
		mapper.getList("2").forEach(i-> System.out.println(i));
		log.info(mapper.getList("2"));
	}
	
	@Test
	public void 갯수세기() {
		
		log.info(mapper.count("1"));
	}
	
	@Test
	public void 중복확인() {
		
		String userid = "2";
		Long gno = 5L;
		
		log.info(mapper.checkIfExists(userid, gno));
	}
	
	@Test
	public void 게임넘버로삭제() {
		
		String userid = "2";
		Long gno = 5L;
		
		log.info(mapper.deleteWishlist(userid, gno));
	}
}
