package com.green.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.service.NewsService;
import com.green.utils.Criteria;
import com.green.utils.PageMaker;
import com.green.domain.FileUploadVO;
import com.green.domain.NewsVO;
import com.green.oauth2.domain.SessionUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Controller
@RequestMapping("/news/*")
public class NewsController {

	@Setter(onMethod_=@Autowired)
	private NewsService service;
	
	@Autowired(required = false)
	private HttpSession session;
	
	
	@GetMapping("/list")
	public void getList(Criteria cri, Model model) {
		cri.setAmount(6);
		List<NewsVO> list = service.getListPaging(cri);
		model.addAttribute("news_list", list);
		int total = service.news_count();
		log.info("totoal : " + total);
		PageMaker pageMaker = new PageMaker(total, cri);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@GetMapping("/get")
	public void getOne(@RequestParam("nno") Long nno ,Model model) {
		log.info("getOne : " + service.getOne(nno));
		model.addAttribute("get", service.getOne(nno));
	}
	
	@GetMapping("/register")
	public void insertG(Model model) {
		log.info("insert page get");
	}
	
	@PostMapping("/register")
	public String insertP(NewsVO news) {
		log.info("insert page POST");
		service.insert(news);
		return "redirect:/news/list";
	}
	
	@GetMapping("/modify")
	public void updateG(@RequestParam("nno") Long nno, Model model) {
		log.info("update Get");
		model.addAttribute("get", service.getOne(nno));
	}
	
	@PostMapping("/modify")
	public String updateP(NewsVO news) {
		log.info("update page POST");
		service.update(news);
		return "redirect:/news/list";
	}
	
	@PostMapping("/delete")
	public String delete(Long nno, HttpServletRequest request) {
		log.info("delete page POST");
		String resourceSrc = request.getServletContext().getRealPath("/resources/");
		FileUploadVO getFile = service.getFile(nno);
		deleteFiles(getFile,resourceSrc);
		service.delete(nno);
		return "redirect:/news/list";
	}
	
	@GetMapping(value = "/getFileList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<FileUploadVO> getFileList(Long nno){
		log.info("이미지 확인" + nno);
		FileUploadVO getFile = service.getFile(nno);
		return new ResponseEntity<>(getFile, HttpStatus.OK);
	}
	
	
	
	//file upload
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<FileUploadVO>> uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest request) {
		log.info("uploadAjaxAction");
		List<FileUploadVO> list = new ArrayList<>();
		String uploadFolderPath = "/news";
		String resourceSrc = request.getServletContext().getRealPath("/resources/");
		log.info("resourceSrc : "+resourceSrc);
		File uploadPath = new File(resourceSrc, uploadFolderPath);
		log.info(uploadPath);
		log.info(uploadPath.exists());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		log.info("uploadFile: "+uploadFile);
		for (MultipartFile multipartFile : uploadFile) {
			log.info("multipartFile : "+multipartFile);
			FileUploadVO fileVO = new FileUploadVO();
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			fileVO.setFileName(uploadFileName);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				log.info("saveFile : " + saveFile);
				fileVO.setUuid(uuid.toString());
				fileVO.setUploadPath(uploadFolderPath);
				
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
				
				list.add(fileVO);
			} catch (Exception e) {
				e.printStackTrace();
				log.info(e);
			}
		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName , String uuid, HttpServletRequest request){
		log.info("컨트롤러 파일 삭제  : " +fileName);
		String resourceSrc = request.getServletContext().getRealPath("/resources/");
		File file;
		try {
			file = new File(resourceSrc + URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			//System.out.println("delete : "+resourceSrc + "news\\" + URLDecoder.decode(fileName,"UTF-8"));
//			Path file = Paths.get(resourceSrc+ "news\\" + uuid + "_" + fileName);
//			Files.deleteIfExists(file); //파일이 존재하면 삭제 
			
			String largeFileName= file.getAbsolutePath().replace("s_", "");				
			log.info("원본 파일 :" +  largeFileName);
			file= new File(largeFileName);
			file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("file delete ", HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, HttpServletRequest request){
		log.info("이미지 표시 컨트롤러 : 파일명 "+ fileName);
		String resourceSrc = request.getServletContext().getRealPath("/resources/");
		log.info(resourceSrc + fileName);
		File file = new File(resourceSrc + fileName);
		log.info("파일 : "+  file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type" , Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private void deleteFiles(FileUploadVO getFile, String resourceSrc) {
		if(getFile == null) return; //null일 경우 함수 종료
		log.info("컨트롤러에서의 첨부파일 삭제..............."   + getFile);
		try { //파일이나 데이터베이스에 접근시 항상 try ~ catch문 사용 
			Path file = Paths.get(resourceSrc + getFile.getUploadPath() + "\\" + getFile.getUuid() + "_" + getFile.getFileName());
			log.info(resourceSrc + getFile.getUploadPath() + "\\" + getFile.getUuid() + "_" + getFile.getFileName());
			Path thumbNail =Paths.get(resourceSrc+ getFile.getUploadPath()+"s_" + getFile.getUuid()+"_" + getFile.getFileName());
			Files.deleteIfExists(thumbNail);
			Files.deleteIfExists(file); //파일이 존재하면 삭제 
		} catch (Exception e) {
			log.error("파일 삭제시 오류:" + e.getMessage());
		}

	}
	
	
	
}
