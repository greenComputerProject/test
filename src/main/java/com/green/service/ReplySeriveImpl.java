package com.green.service;

import java.util.List;

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


@Service 
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
		System.out.println("댓글 데이터 하나 : " + list.get(0));
		return list;
	}

	
	  @Override public ReplyPageDTO getListWithPaging(Criteria cri, Long gno) {
	  System.out.println("댓글 서비스  페이지 단위로  목록 조회   :" + gno + "criteria " + cri );
	  return new ReplyPageDTO(mapper.getCountByBno(gno),
	  mapper.getListWithPaging(cri, gno)); }
	 

}
