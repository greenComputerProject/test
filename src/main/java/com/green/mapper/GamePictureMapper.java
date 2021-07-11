package com.green.mapper;

import org.apache.ibatis.annotations.Param;

import com.green.domain.GamePictureVO;

public interface GamePictureMapper {

	public void register(GamePictureVO vo);
	public int modify(@Param("grno") Long grno, @Param("contentPicture") String contentPicture);
	public int deleteByGrno(Long grno);
}
