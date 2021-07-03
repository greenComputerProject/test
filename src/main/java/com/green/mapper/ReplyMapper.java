package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.domain.Criteria;
import com.green.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno); //댓글 번호로 검색하여 댓글 객체 가져옴
	
	public int delete (Long rno); 
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("gno") Long gno);
	
	public int getCountByBno(Long gno);
	
	public List<ReplyVO> getList(Long gno);//게임 번호(gno)로 검색하여 댓글 전체 가져옴 
}
