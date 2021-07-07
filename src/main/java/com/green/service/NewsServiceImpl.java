package com.green.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.domain.FileUploadVO;
import com.green.domain.LikeVO;
import com.green.domain.NewsVO;
import com.green.mapper.FileUploadMapper;
import com.green.mapper.LikeMapper;
import com.green.mapper.NewsMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NewsServiceImpl implements NewsService {

	@Setter(onMethod_=@Autowired)
	private NewsMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private FileUploadMapper filemapper;
	
	@Setter(onMethod_=@Autowired)
	private LikeMapper likemapper;
	
	@Override
	public List<NewsVO> getList() {
		log.info("service getList()");
		return mapper.getList();
	}

	@Override
	public NewsVO getOne(Long nno) {
		return mapper.getOne(nno);
	}

	@Transactional
	@Override
	public void insert(NewsVO news) {
		System.out.println("service insert 전");
		mapper.insertSelectKey(news);
		System.out.println("news.getGetFile()"+news.getGetFile());
		if(news.getGetFile() == null ){
			System.out.println("return전");
			return;
		}
		System.out.println("return 안되고 후");
		news.getGetFile().setNno(news.getNno());
		System.out.println(news.getNno());
		filemapper.insert(news.getGetFile());
		
	}
	
	@Transactional
	@Override
	public boolean delete(Long nno) {
		filemapper.deleteAll(nno);
		mapper.delete(nno);
		return mapper.delete(nno)==1;
	}

	@Override
	public boolean update(NewsVO news) {
		//먼저 전체의 첨부 파일 삭제함 
		filemapper.deleteAll(news.getNno());
		news.getGetFile().setNno(news.getNno());
		log.info("update : " + news.getGetFile());
		filemapper.insert(news.getGetFile());
		
		return mapper.update(news) == 1;
	}

	@Override
	public FileUploadVO getFile(Long nno) {
		System.out.println("서비스에서  첨부 파일은   게시글 번호 : " +nno);
		FileUploadVO fileList = filemapper.findByBno(nno);
		return fileList;
	}
	
}

