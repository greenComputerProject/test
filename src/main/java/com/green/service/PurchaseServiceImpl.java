package com.green.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.PurchaseListVO;
import com.green.domain.PurchaseVO;
import com.green.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService{

	@Autowired
	private PurchaseMapper mapper;
	
	@Override
	public boolean purchase(String userid, Long gno) {
		// TODO Auto-generated method stub
		PurchaseVO vo = new PurchaseVO();
		
		String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String random = String.valueOf((int) (Math.random() * 1000000));
		String orderId = currentDate + random;
		
		boolean isPurchased = isPurchased(userid, gno);
		
		if(isPurchased) {
			return false;
		}
		else {
			vo.setGno(gno);
			vo.setUserid(userid);
			vo.setOrderid(orderId);
			
			mapper.insert(vo);
			
			return true;
		}
	}

	@Override
	public List<PurchaseListVO> getList(String userid) {
		// TODO Auto-generated method stub
		return mapper.getList(userid);
	}

	@Override
	public void refund(Long pno) {
		// TODO Auto-generated method stub
		mapper.delete(pno);
	}

	@Override
	public boolean isPurchased(String userid, Long gno) {
		// TODO Auto-generated method stub
		return mapper.getCount(userid, gno) == 0 ? false : true;
	}

	@Override
	public int insert(PurchaseVO vo) { 
		// TODO Auto-generated method stub
		return 0;
	}

}
