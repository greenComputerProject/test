package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.WishlistListVO;
import com.green.domain.WishlistVO;
import com.green.mapper.WishlistMapper;

@Service
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	private WishlistMapper mapper;
	
	@Override
	public void addWishlist(WishlistVO vo) {
		mapper.insert(vo);
	}
	
	@Override
	public List<WishlistListVO> getList(String userid){
		
		return mapper.getList(userid);
	}
	
	@Override
	public void delete(Long wno) {
		
		mapper.delete(wno);
	}
	
	@Override
	public Integer getCount(String userid) {
		return mapper.count(userid);
	}

	@Override
	public Boolean checkIfExists(String userid, Long gno) {
		// TODO Auto-generated method stub
		return mapper.checkIfExists(userid, gno) == 1 ? true: false;
	}

	@Override
	public Integer deleteWithGno(String userid, Long gno) {
		// TODO Auto-generated method stub
		return mapper.deleteWishlist(userid, gno);
	}
	

}
