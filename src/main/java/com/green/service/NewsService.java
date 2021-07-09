package com.green.service;

import java.util.List;

import com.green.domain.FileUploadVO;
import com.green.domain.LikeVO;
import com.green.domain.NewsVO;
import com.green.utils.Criteria;

public interface NewsService {
	
	public List<NewsVO> getList();
	public NewsVO getOne(Long nno);
	public void insert(NewsVO news);
	public boolean delete(Long nno);
	public boolean update(NewsVO news);
	
	public FileUploadVO getFile(Long nno);
	
	public List<NewsVO> getListPaging(Criteria cri);
	public int news_count();
}