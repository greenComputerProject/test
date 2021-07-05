package com.green.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.green.domain.CompanyVO;
import com.green.domain.GamePictureVO;
import com.green.domain.GameResourceVO;
import com.green.domain.GameVO;
import com.green.domain.SpecVO;
import com.green.domain.TagVO;
@Service
public interface GameService {
	
	public GameVO read(String title);
	
	//public List<GameVO> getList(Criteria cri);
	
	public void register(CompanyVO company, GameVO game, TagVO tag, SpecVO spec, GameResourceVO resource, List<GamePictureVO> picture);
	
	public void modify(CompanyVO company, GameVO game, TagVO tag, SpecVO spec, GameResourceVO resource, List<GamePictureVO> picture);
	
	public GameVO news(Long nno);
	

}
