package com.green.service;

import java.util.List;

import com.green.domain.Criteria;
import com.green.domain.ReplyPageDTO;
import com.green.domain.ReplyVO;

public interface ReplyService {
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);//댓글 번호 (rno)로 검색하여 댓글 객체 가져옴 
	
	public int delete(Long rno); 
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getList(Criteria cri, Long gno);
	
	public ReplyPageDTO getListWithPaging(Criteria cri , Long gno);
}
