package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.domain.GameIndexVO;
import com.green.domain.GameListVO;
import com.green.utils.Criteria;
import com.green.utils.SortFilterSearch;

public interface GameListMapper {
	
	public List<GameListVO> getList(@Param("cri") Criteria cri,@Param("sort") SortFilterSearch sort);
	public List<GameIndexVO> getListForIndex();
	
	public Integer getCount(@Param("cri") Criteria cri,@Param("sort") SortFilterSearch sort);
}
