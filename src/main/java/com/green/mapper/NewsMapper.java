package com.green.mapper;

import java.util.List;

import com.green.domain.NewsVO;
import com.green.utils.Criteria;

public interface NewsMapper {
	
	public List<NewsVO> getList();
	public NewsVO getOne(Long nno);
	public void insert(NewsVO news);
	public int delete(Long nno);
	public int update(NewsVO news);
	public void insertSelectKey(NewsVO news);
	
	public int news_count();
	public List<NewsVO> getListPaging(Criteria cri);

}
