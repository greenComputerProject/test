package com.green.mapper;

import java.util.List;

import com.green.domain.FileUploadVO;

public interface FileUploadMapper {
	public void insert(FileUploadVO vo);
	public void delete(String uuid);
	public FileUploadVO findByBno(Long bno);
	public void deleteAll(Long bno);
}