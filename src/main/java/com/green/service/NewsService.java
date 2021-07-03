package com.green.service;

import java.util.List;

import com.green.domain.FileUploadVO;
import com.green.domain.LikeVO;
import com.green.domain.NewsVO;

public interface NewsService {
	
	public List<NewsVO> getList();
	public NewsVO getOne(Long nno);
	public void insert(NewsVO news);
	public boolean delete(Long nno);
	public boolean update(NewsVO news);
	
	public FileUploadVO getFile(Long nno);
	
	public void like_insert(Long nno, String userid);	
	public void like_delete(Long nno, String userid);	
	public LikeVO like_check(Long nno, String userid);		
	public int like_count(Long nno);	
	
}