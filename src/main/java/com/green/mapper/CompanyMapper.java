package com.green.mapper;

import com.green.domain.CompanyVO;

public interface CompanyMapper {
	public void register(CompanyVO company);
	public void modify(CompanyVO company);
	public Integer count(String company);
}
