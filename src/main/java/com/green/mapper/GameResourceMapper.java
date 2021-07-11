package com.green.mapper;

import com.green.domain.GameResourceVO;

public interface GameResourceMapper {

	public int register(GameResourceVO vo);
	public int modify(GameResourceVO vo);
	public Long getGrno(Long gno);
}
