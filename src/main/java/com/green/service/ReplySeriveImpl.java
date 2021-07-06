package com.green.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.mapper.GameMapper;
import com.green.mapper.ReplyMapper;
import com.green.domain.Criteria;
import com.green.domain.ReplyPageDTO;
//import com.green.domain.ReplyPageDTO;
import com.green.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service 
@Log4j
public class ReplySeriveImpl implements ReplyService{
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private GameMapper gameMapper;
	
	@Transactional
	@Override
	public int insert(ReplyVO vo) {
		System.out.println("댓글 서비스 등록 : " +vo);
		//gameMapper.updateReplyCnt(vo.getGno(),1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO read(Long rno) {
		System.out.println("댓글 서비스 데이터 하나 조회 :" +rno);
		return mapper.read(rno);
	}
	@Transactional
	@Override
	public int delete(Long rno) {
		System.out.println("댓글 서비스  삭제  :" +rno);
		ReplyVO vo = mapper.read(rno);
		//gameMapper.updateReplyCnt(vo.getRno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		System.out.println("댓글 서비스  수정   :" + vo);
		return mapper.update(vo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long gno) {
		System.out.println("댓글 서비스  전체 목록 조회    게시글 번호  :" + gno + "criteria " + cri );
		List<ReplyVO> list = mapper.getListWithPaging(cri, gno);
		
		return list;
	}

	private ReplyVO changeDateFormat(ReplyVO replyVO) {
		
		Date formattedDate = null;
		try {
			formattedDate = new SimpleDateFormat("MMdd").parse(new SimpleDateFormat("MMdd").format(replyVO.getRegDate()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		replyVO.setRegDate(formattedDate);
		return replyVO;
	}

	
	  @Override 
	  public ReplyPageDTO getListWithPaging(Criteria cri, Long gno) {
		  
	  System.out.println("댓글 서비스  페이지 단위로  목록 조회   :" + gno + "criteria " + cri );
	  
	  List<ReplyVO> list =  mapper.getListWithPaging(cri, gno);
	  
	  return new ReplyPageDTO(mapper.getCountByBno(gno),list); 
	  }
	 

}
