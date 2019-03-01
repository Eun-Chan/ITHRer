package com.spring.ithrer.charged.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.util.IOUtils;
import com.spring.ithrer.charged.model.service.ChargedService;
import com.spring.ithrer.common.util.S3Util;
import com.spring.ithrer.common.util.UploadFileUtils;

@RestController
public class ChargedController {

	Logger logger = Logger.getLogger(getClass());
	
	String bucketName = "eunchan-origin";
	S3Util s3 = new S3Util();
	
	@Autowired
	ChargedService chargedService;
	
	@RequestMapping(value="/charedService.ithrer")
	public ModelAndView chargedService(ModelAndView mav) {
		
		//현재 결제 기간이 남아있는 리스트 찾기
		List<Map<String, String>> list = chargedService.selectListCharged();
		
		mav.addObject("chargedList", list);
		mav.setViewName("/chargedService/charged");
		return mav;
	} 
	
	@RequestMapping("/fileUpload.ithrer")
	public ModelAndView fileUpload(ModelAndView mav, HttpServletRequest request,
			@RequestParam(name="upFile", required=false) MultipartFile upFiles,@RequestParam("directory") String directory,
			@RequestParam(value="compId",required=false)String compId)  {
		
		logger.debug("originalName: " + upFiles.getOriginalFilename());
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
		logger.debug("path : "+path);
		//경로별로 분기해야됨.
		
		//db에 path 저장
		//directory로 분기하여 각자 기능 구현 할 수 있게 주의 할 것!
		if(directory == "images/banner") {
			String no = request.getParameter("charged");
			logger.debug("민우no"+no);
			int result = chargedService.updateFileName(no, path);
			
		}
		
		if(path!=null) {

		}
		
		mav.setViewName("redirect:/fileUpload.ithrer");
		
		return mav;
	}
	@SuppressWarnings("resource")
	@ResponseBody
	@RequestMapping("/displayFile.ithrer")
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName, @RequestParam("directory") String directory) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		logger.debug("FILE NAME: " + fileName);
		logger.debug("directory: "+directory);
		
		String inputDirectory = null;
		if(directory.equals("banner")) {
			inputDirectory = "images/banner";
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
	
	
	
	
	
}
