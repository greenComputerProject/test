package com.green.oauth2.mapper;

import com.green.oauth2.domain.OAuthUserVO;

public interface OAuthUserMapper {

	public void insert(OAuthUserVO userVO);
	public OAuthUserVO findByEmail(String email );
	public void deleteAll();
	public void update(OAuthUserVO userVO);
}
