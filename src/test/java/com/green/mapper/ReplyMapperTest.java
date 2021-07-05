package com.green.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.security.mapper.SecurityMemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReplyMapperTest {

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private SecurityMemberMapper memberMapper;
	
	@Test
	public void 리뷰_불러오기(){
		mapper.getList(1L).forEach(i -> log.info(i.toString()));
		memberMapper.getOne("thd@naver.com");
	}
}
