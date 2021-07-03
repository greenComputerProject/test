package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.domain.CompanyVO;
import com.green.domain.GameVO;
import com.green.domain.SpecVO;
import com.green.domain.TagVO;
import com.green.mapper.CompanyMapper;
import com.green.mapper.GameMapper;
import com.green.mapper.SpecMapper;
import com.green.mapper.TagMapper;

import lombok.Setter;

@Repository
public class GameServiceImpl implements GameService{

	@Setter(onMethod_=@Autowired)
	private CompanyMapper cmapper;
	
	@Setter(onMethod_=@Autowired)
	private GameMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private TagMapper tmapper;
	
	@Setter(onMethod_=@Autowired)
	private SpecMapper smapper;
		
	@Override
	public GameVO read(String title) {
		System.out.println("서비스에서 게임 조회 이름은 " + title );
		return mapper.read(title);
	}

	@Override
	public GameVO news(Long nno) {
		System.out.println("서비스에서 뉴스 조회 번호는 " + nno );
		return mapper.game(nno);
	}

	/*
	 * @Override public List<GameVO> getList(Criteria cri) {
	 * System.out.println("서비스에서 게임 목록 조회 "); return mapper.getList(); }
	 */

	@Override
	public void register(CompanyVO company, GameVO game, TagVO tag,  SpecVO spec) {
		System.out.println("서비스에서 게임 데이터 추가");
		// 
		cmapper.register(company);
		mapper.register(game);
		smapper.register(spec);
		tmapper.register(tag);
	}

	@Override
	public void modify(CompanyVO company, GameVO game, TagVO tag, SpecVO spec) {
		System.out.println("서비스에서 게임 데이터 수정");
		cmapper.modify(company);
		mapper.modify(game);
		smapper.modify(spec);
		tmapper.modify(tag);
		
	}

}
