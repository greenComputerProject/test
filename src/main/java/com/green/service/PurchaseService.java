package com.green.service;

import java.util.List;

import com.green.domain.PurchaseListVO;

public interface PurchaseService {

	public boolean purchase(String userid, Long gno);
	public List<PurchaseListVO> getList(String userid);
	public void refund(Long pno);
	public boolean isPurchased(String userid, Long gno);
}
