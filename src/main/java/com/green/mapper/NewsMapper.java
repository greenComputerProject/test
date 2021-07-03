package com.green.mapper;

import java.util.List;

import com.green.domain.NewsVO;

public interface NewsMapper {
	
	public List<NewsVO> getList();
	public NewsVO getOne(Long nno);
	public void insert(NewsVO news);
	public int delete(Long nno);
	public int update(NewsVO news);
	public void insertSelectKey(NewsVO news);

}
