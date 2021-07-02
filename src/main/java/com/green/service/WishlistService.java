package com.green.service;

import java.util.List;

import com.green.domain.WishlistListVO;
import com.green.domain.WishlistVO;

public interface WishlistService {

	public void addWishlist(WishlistVO vo);
	
	public List<WishlistListVO> getList(String userid);
	
	public void delete(Long wno);
	
	public Integer getCount(String userid);
	
	public Boolean checkIfExists(String userid, Long gno);
	public Integer deleteWithGno(String userid, Long gno);
}
