package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.domain.CompanyVO;
import com.green.domain.Criteria;
import com.green.domain.GameVO;
import com.green.domain.SpecVO;
import com.green.domain.TagVO;

public interface GameMapper {
	public GameVO game(Long gno);
	
	public GameVO read(String title);
	
	public GameVO news(Long nno);
	
	public int register(GameVO game);
	
	public int modify(GameVO game);
	
	public int delete(Long gno);
	
	public List<GameVO> getList();
	
	public List<GameVO> getListWithPaging(Criteria cri); //추가 
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("gno")Long gno, @Param("amount")int amount);
	
	public Integer count(String title);
}
