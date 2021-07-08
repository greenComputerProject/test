package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Criteria;
import com.green.domain.QnaVO;
import com.green.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService{

	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	
	@Override
	public List<QnaVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(QnaVO qna) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QnaVO get(Long qna_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Long qna_no) {
		// TODO Auto-generated method stub
		return false;
	}

}
