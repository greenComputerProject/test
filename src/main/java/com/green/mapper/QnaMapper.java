package com.green.mapper;

import java.util.List;

import com.green.domain.Criteria;
import com.green.domain.QnaVO;

public interface QnaMapper {
	public List<QnaVO> getList(Criteria cri);
	public void insert(QnaVO qna); // insert 
	public QnaVO read(Long qna_no); //read 
	public int delete(Long qna_no); //delete
	public int getTotalCount(Criteria cri);
}
