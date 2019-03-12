package com.spring.ithrer.charged.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.util.IOUtils;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.ithrer.charged.model.service.ChargedService;
import com.spring.ithrer.common.util.S3Util;
import com.spring.ithrer.common.util.UploadFileUtils;
import com.spring.ithrer.company.model.service.CompanyService;

@RestController
public class ChargedController {

	Logger logger = Logger.getLogger(getClass());
	
	String bucketName = "eunchan-origin";
	S3Util s3 = new S3Util();
	
	@Autowired
	ChargedService chargedService;
	@Autowired
	CompanyService companyService;
	@Autowired
	private JavaMailSender mailSender2;
	
	@RequestMapping(value="/charedService.ithrer")
	public ModelAndView chargedService(ModelAndView mav) {
		
		//현재 결제 기간이 남아있는 리스트 찾기
		List<Map<String, String>> list = chargedService.selectListCharged();
		
		mav.addObject("chargedList", list);
		mav.setViewName("/chargedService/charged");
		return mav;
	} 
	
	@RequestMapping(value="/fileUpload.ithrer", produces="application/json")
	public int fileUpload(ModelAndView mav, HttpServletRequest request,
			@RequestParam(name="upFile", required=false) MultipartFile upFiles,@RequestParam("directory") String directory,
			@RequestParam(value="compId",required=false) String compId, HttpServletResponse response)  {
		
		//logger.info("originalName: " + upFiles.getOriginalFilename());
		//logger.info("directory: " + directory);
		//logger.info("originalName: " + upFiles.getOriginalFilename());
		//uploadpath 예시 : "images/banner"
		String uploadpath = directory;
		

		ResponseEntity<String> img_path = null;
		try {
			img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadpath, upFiles.getOriginalFilename(), upFiles.getBytes()),
					HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String path = (String) img_path.getBody();
		//logger.info("path : "+path);
		//경로별로 분기해야됨.
		
		//db에 path 저장
		//directory로 분기하여 각자 기능 구현 할 수 있게 주의 할 것!
		
		int result=0;
		if("images/banner".equals(directory.trim())) {
			String no = request.getParameter("charged");
			//logger.info("민우no"+no);
			result = chargedService.updateFileName(no, path);
			
		}
		else if("images/compLogo".equals(directory.trim())) {
			//logger.debug("image/compLogo");
			result = companyService.updateCompanyLogo(path, compId);
		}
		
		
		if(path!=null) {

		}
		
		
		return result;
	}
	@SuppressWarnings("resource")
	@ResponseBody
	@RequestMapping("/displayFile.ithrer")
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName, @RequestParam("directory") String directory) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		//logger.debug("FILE NAME: " + fileName);
		//logger.debug("directory: "+directory);
		
		String inputDirectory = null;
		if(directory.equals("banner")) {
			inputDirectory = "images/banner";
		}
		else if(directory.equals("compLogo")) {
			inputDirectory = "images/compLogo";
		}
		else if(directory.equals("memberPhoto")) {
			inputDirectory = "images/memberPhoto";
		}else if(directory.equals("summernote")) {
			fileName = fileName.replaceAll("'", "");
			inputDirectory = "images/summernote";
		}
		
		
//		else if(directory.equals("certificate")) {
//			inputDirectory = "almom/certificate";
//		}else {
//			inputDirectory = "almom/coverImage";
//		}



		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;
			try {
				url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream(); // 이미지를 불러옴
			} catch (Exception e) {
				url = new URL(s3.getFileURL(bucketName, "default.jpg"));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream();
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		
		
		return entity;
	}
	
	
	/**
	 * @박광준
	 * 파일업로드 (서머노트용)
	 * 업로드 순간에 패스정보가 필요하기에 부득이하게 중복으로 생성..
	 */
	@RequestMapping(value="/fileUploadSummernote.ithrer", produces="application/json")
	public void fileUploadSummernote(ModelAndView mav, HttpServletRequest request,
			@RequestParam(name="upFile", required=false) MultipartFile upFiles,@RequestParam("directory") String directory,
			@RequestParam(value="compId",required=false)String compId, HttpServletResponse response)  {
		
		//logger.info("originalName: " + upFiles.getOriginalFilename());
		//logger.info("directory: " + directory);
		//logger.info("originalName: " + upFiles.getOriginalFilename());
		
		String uploadpath = directory;
		

		ResponseEntity<String> img_path = null;
		try {
			img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadpath, upFiles.getOriginalFilename(), upFiles.getBytes()),
					HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String path = (String) img_path.getBody();
		//logger.info("path : "+path);

		List<String> result = new ArrayList<>();
		result.add(path);
		
		response.setContentType("application/json; charset=utf-8");
		try {
			new Gson().toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}

	}
	/*
	 * 배너 등록을 위한 페이지 이동
	 */
	@RequestMapping("/insertBanner.ithrer")
	public ModelAndView insertBanner(ModelAndView mav) {
		
		mav.setViewName("/chargedService/insertBanner");
		return mav;
	}
	
	@PostMapping("/mailAndInsertBanner.ithrer")
	public int mailAndInsertBanner(@RequestParam(name="upFile") MultipartFile upFile,
								   @RequestParam(name="compId") String compId,
								   @RequestParam(name="bannerStartDate") Date bannerStartDate,
								   @RequestParam(name="compEmail") String compEmail,
								   @RequestParam(name="compName") String compName,
								   HttpServletRequest request) {
		int result = 0;
		
		
		//logger.info("upFile NAME: " + upFile.getOriginalFilename());
		//logger.info("compId: "+compId);
		//logger.info("bannerStartDate: "+bannerStartDate.toString());
		//logger.info("compEmail: "+compEmail);
		
		//톰캣 버서에 임시 파일 업로드 시켜 이 경로를 통해 이메일 첨부에 사용
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload");
		logger.info(saveDirectory);
		
		String originalFileName = upFile.getOriginalFilename();
		File tempFile = new File(saveDirectory+"/"+originalFileName);
		
		try {
			upFile.transferTo(tempFile);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		String setfrom = compEmail;         	//회사 이메일로 보내려 했으나 bean에서 생성된 것으로만 보내짐; 그렇다고 없애면 발송이 안됨
	    String tomail = "2019.khproject@gmail.com";    // 받는 사람 이메일 ||2019.khproject@gmail.com 비밀번호: 어드민1234!
	    String title = compName+" 배너 요청";     					// 보내는 사람 이메일
	    String content = "배너 첨부";  					// 보내는 사람 이메일
	    String filename = saveDirectory+"/"+originalFileName; // 파일 경로.
	   
	    //logger.info("filename: "+ filename);
	    
	    try {
	      MimeMessage message = mailSender2.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);   // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);      // 받는사람 이메일
	      messageHelper.setSubject(title);  // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);   // 메일 내용
	     
	      // 파일첨부
	      FileSystemResource fsr = new FileSystemResource(filename);
	      messageHelper.addAttachment(originalFileName, fsr);
	     
	      mailSender2.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
		
	    //임시로 톰캣서버에 저장한 파일 삭제
	    tempFile.delete();
	    
	    //chargedService DB 테이블에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("compId", compId);
	    map.put("bannerStartDate", bannerStartDate);
	    result = chargedService.insertBannerRequest(map);
	    
	    
		return result;
	}
	
}
