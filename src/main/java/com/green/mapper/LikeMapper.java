package com.green.mapper;

import org.apache.ibatis.annotations.Param;

import com.green.domain.LikeVO;

public interface LikeMapper {
	public void insert(@Param("rno") Long rno, @Param("userid") String userid);		//추가
	public void delete(@Param("rno") Long rno, @Param("userid") String userid);		//삭제
	public LikeVO read(@Param("rno") Long rno, @Param("userid") String userid);		//id와 게시물번호에 해당되는 것이 있는지 확인용
	public int like_count(Long rno);	//좋아요 갯수확인
}
