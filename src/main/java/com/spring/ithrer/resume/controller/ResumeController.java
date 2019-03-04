package com.spring.ithrer.resume.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.common.util.UploadFileUtils;
import com.spring.ithrer.common.util.Utils;
import com.spring.ithrer.resume.model.service.ResumeService;
import com.spring.ithrer.resume.model.vo.Award;
import com.spring.ithrer.resume.model.vo.Career;
import com.spring.ithrer.resume.model.vo.Certificate;
import com.spring.ithrer.resume.model.vo.Education;
import com.spring.ithrer.resume.model.vo.Hopework;
import com.spring.ithrer.resume.model.vo.Intern;
import com.spring.ithrer.resume.model.vo.Language;
import com.spring.ithrer.resume.model.vo.Learn;
import com.spring.ithrer.resume.model.vo.Overseas;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Preference;
import com.spring.ithrer.resume.model.vo.Profile;



@Controller
public class ResumeController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ResumeService resumeService;

	/* 이력서가기 */
	@RequestMapping(value="/resume/resume")
	public ModelAndView resumeView(ModelAndView mav) {
		mav.setViewName("resume/resume");
		return mav;
	}

	/* 자격증db에서 자격증명찾기 */
	@RequestMapping(value="/resume/certificateList.do")
	@ResponseBody
	public List<Map<String,String>> certificateList(@RequestParam("certName") String certName) {
		List<Map<String,String>> list = resumeService.certificateList(certName);
		return list;
	}

	/* db저장용 */
	@RequestMapping(value="/resume/saveResume.do")
	@ResponseBody
	public ModelAndView saveResume(ModelAndView mav,
								   Award award,Career career,Certificate certificate,
								   Hopework hopework, Intern intern,
								   Language language, Learn learn,
								   Overseas overseas, PortFolio portFolio,
								   Preference preference, Profile profile,
								   Education education, @RequestParam("memberIdHide") String memberIdHide,
								   MultipartHttpServletRequest req, MultipartFile file,HttpServletResponse res) {
		logger.info("award="+award);
		logger.info("career="+career);
		logger.info("certificate="+certificate);
		logger.info("education="+education);
		logger.info("hopework="+hopework);
		logger.info("intern="+intern);
		logger.info("language="+language);
		logger.info("learn="+learn);
		logger.info("overseas="+overseas);
		logger.info("portFolio="+portFolio);
		logger.info("preference="+preference);
		logger.info("profile="+profile);
		
		Map<String,Object> awardMap = new HashMap<>();
		awardMap.put("award", award);
		awardMap.put("memberIdHide", memberIdHide);
		Map<String,Object> careerMap = new HashMap<>();
		careerMap.put("career",career);
		careerMap.put("memberIdHide",memberIdHide);
		Map<String,Object> certificateMap = new HashMap<>();
		certificateMap.put("certificate",certificate);
		certificateMap.put("memberIdHide",memberIdHide);
		Map<String,Object> hopeworkMap = new HashMap<>();
		hopeworkMap.put("hopework",hopework);
		hopeworkMap.put("memberIdHide",memberIdHide);
		Map<String,Object> internMap = new HashMap<>();
		internMap.put("intern",intern);
		internMap.put("memberIdHide",memberIdHide);
		Map<String,Object> languageMap = new HashMap<>();
		languageMap.put("language",language);
		languageMap.put("memberIdHide",memberIdHide);
		Map<String,Object> learnMap = new HashMap<>();
		learnMap.put("learn",learn);
		learnMap.put("memberIdHide",memberIdHide);
		Map<String,Object> overseasMap = new HashMap<>();
		overseasMap.put("overseas",overseas);
		overseasMap.put("memberIdHide",memberIdHide);
		Map<String,Object> preferenceMap = new HashMap<>();
		preferenceMap.put("preference",preference);
		preferenceMap.put("memberIdHide",memberIdHide);
		Map<String,Object> profileMap = new HashMap<>();
		profileMap.put("profile",profile);
		profileMap.put("memberIdHide",memberIdHide);
		Map<String,Object> educationMap = new HashMap<>();
		educationMap.put("education",education);
		educationMap.put("memberIdHide",memberIdHide);
		
		res.setCharacterEncoding("utf-8");
		/* file들어왔는지 확인용 */
		if(file != null) {
			logger.info("originalName:" + file.getOriginalFilename());
			logger.info("size:" + file.getSize());
			logger.info("ContentType:" + file.getContentType());
		}else {
			
			System.out.println("FILE IS NULL");
		}			    
		
	    //1.파일업로드 (업로드할 경로 찾기)
	    Iterator<String> itr = req.getFileNames();
	    if(itr.hasNext()) {
	 	   file = req.getFile(itr.next());
	    }
	    String saveDirectory = "resume/portfolio";
	    String o_fileName = "";
	    String r_fileName = "";
	    ResponseEntity<String> img_path = null;
	    try {
	    	if(!file.isEmpty()) {
	    		//오리지널 파일네임
	    		o_fileName = file.getOriginalFilename();
	    		
	    		//리네임해서 서버 저장용 
	    		r_fileName = Utils.getRenamedFileName(o_fileName);
	    		
	    		img_path = new ResponseEntity<>(
	    				UploadFileUtils.uploadFile(saveDirectory, o_fileName, file.getBytes()),
	    				HttpStatus.CREATED);
	    	}	    	
	    } catch (NullPointerException e1) {
	    	e1.printStackTrace();
	    } catch (IOException e1) {
			e1.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	   	//String path = (String)img_path.getBody();
		PortFolio pf = new PortFolio();
		pf.setPOriginalFileNameTest(o_fileName);
		pf.setPRenamedFileName(r_fileName);
		//pf.setUrl(path);
		pf.setUrl(portFolio.getUrl());
		Map<String,Object> portFolioMap = new HashMap<>();
		portFolioMap.put("pf",pf);
		portFolioMap.put("memberIdHide",memberIdHide);
		
		int awardresult = resumeService.insertAward(awardMap);
		int careerresult = resumeService.insertCareer(careerMap);
		int certificateresult = resumeService.insertCertificate(certificateMap);
		int hopeworkresult = resumeService.insertHopework(hopeworkMap);
		int internresult = resumeService.insertIntern(internMap);
		int languageresult = resumeService.insertLanguage(languageMap);
		int learnresult = resumeService.insertLearn(learnMap);
		int overseasresult = resumeService.insertOverseas(overseasMap);
		int preferenceresult = resumeService.insertPreference(preferenceMap);
		int profileresult = resumeService.insertProfile(profileMap);
		int educationresult = resumeService.insertEducation(educationMap);
		int portFolioresult = resumeService.insertPortFolio(portFolioMap);
		System.out.println(awardresult>0?"성공":"실패");
		//mav.setViewName("redirect:/");
		mav.setViewName("resume/resume");
		return mav;	
	}
}
