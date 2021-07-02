package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.domain.WishlistListVO;
import com.green.domain.WishlistVO;

public interface WishlistMapper {
	
	public void insert(WishlistVO vo);
	//원래 유저 이메일을 userid로 쓰려고 했으나
	//페이스북에서 이메일을 가져오지 못함... 추후에 해결 예정
	public List<WishlistListVO> getList(String userid);
	public int delete(Long wno);
	
	public Integer count(String userid);
	
	//중복 확인
	public Integer checkIfExists(@Param("userid") String userid,@Param("gno") Long gno);
	//userid 와 gno 로 삭제
	public Integer deleteWishlist(@Param("userid") String userid,@Param("gno") Long gno);
}	
