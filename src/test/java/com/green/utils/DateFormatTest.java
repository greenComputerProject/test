package com.green.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.ReplyVO;
import com.green.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class DateFormatTest {

	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void 시간_포맷_테스트() throws ParseException {
		
		ReplyVO vo = mapper.read(12L);
		
		Date date = vo.getRegDate();
		
	}
}
