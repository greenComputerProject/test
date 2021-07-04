package com.green.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.GamePictureVO;
import com.green.domain.GameResourceVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class GameResourceMapperTEst {

	@Autowired
	private GameResourceMapper resourceMapper;
	@Autowired
	private GamePictureMapper pictureMapper;
	
	@Test
	public void 게임_자료_등록() {
		
		//given
		
		GameResourceVO resource = new GameResourceVO();
		GamePictureVO picture = new GamePictureVO();
		List<GamePictureVO> pictureList = new ArrayList<GamePictureVO>();
		Long gno = 15L;
		String logo = "logo";
		String titlePicture = "titleP";
		String video = "video";
		String[] contentPictures = {"con1", "con2", "con3", "con4"};
		
		//when
		
		resource.setGno(gno);
		resource.setLogo(logo);
		resource.setTitlePicture(titlePicture);
		resource.setVideo(video);
		
		for(String con : contentPictures) {
			picture.setContentPicture(con);
			pictureList.add(picture);
		}
		
		//then 
		
		resourceMapper.register(resource);
		
		pictureList.forEach(i -> pictureMapper.register(picture));
		
		
		
	}
}
