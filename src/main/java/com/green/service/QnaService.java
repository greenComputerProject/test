package com.green.service;

import java.util.List;

import com.green.domain.QnaVO;
import com.green.domain.Criteria;

public interface QnaService {

	public List<QnaVO> getList(Criteria cri);
	public void register(QnaVO qna); // insert 
	public QnaVO get(Long qna_no); //read 
	public boolean remove(Long qna_no); //delete
}
