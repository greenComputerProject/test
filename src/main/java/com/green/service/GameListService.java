package com.green.service;

import java.util.List;

import com.green.domain.GameIndexVO;
import com.green.domain.GameListVO;
import com.green.utils.Criteria;
import com.green.utils.SortFilterSearch;

public interface GameListService {
	
	public List<GameListVO> getList(Criteria cri , SortFilterSearch sort);
	
	public List<GameIndexVO> getListForIndex();
	
	public Integer getCount(Criteria cri, SortFilterSearch sort);
}
