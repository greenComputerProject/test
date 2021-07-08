package com.green.mapper;

import com.green.domain.RatingVO;

public interface RatingMapper {
	public void insert(RatingVO rating);		//추가
	public void update(RatingVO rating);		//업데이트
	public RatingVO read(RatingVO rating);		//id와 게시물번호에 해당되는 것이 있는지 확인용
	public float rating_avg(Long gno);												//평균
}
