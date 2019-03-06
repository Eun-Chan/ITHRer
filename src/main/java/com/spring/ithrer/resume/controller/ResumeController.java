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
import com.spring.ithrer.resume.model.vo.Certification;
import com.spring.ithrer.resume.model.vo.Education;
import com.spring.ithrer.resume.model.vo.Hopework;
import com.spring.ithrer.resume.model.vo.Intern;
import com.spring.ithrer.resume.model.vo.Language;
import com.spring.ithrer.resume.model.vo.Learn;
import com.spring.ithrer.resume.model.vo.Letter;
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

	/* 내이력서가기 */
	@RequestMapping(value="/resume/resumeView")
	public ModelAndView myResumeView(ModelAndView mav, @RequestParam("memberId") String memberId) {
		logger.info("memberId="+memberId);
		Award award = resumeService.awardView(memberId);
		logger.info("award="+award);
		Career career = resumeService.careerView(memberId);
		logger.info("career="+career);
		Certification certification = resumeService.certificateView(memberId);
		logger.info("certification="+certification);
		Hopework hopework = resumeService.hopeworkView(memberId);
		logger.info("hopework="+hopework);
		Intern intern = resumeService.internView(memberId);
		logger.info("intern="+intern);
		Language language = resumeService.languageView(memberId);
		logger.info("language="+language);
		Learn learn = resumeService.learnView(memberId);
		logger.info("learn="+learn);
		Overseas overseas = resumeService.overseasView(memberId);
		logger.info("overseas="+overseas);
		PortFolio portFolio = resumeService.portFolioView(memberId);
		logger.info("portFolio="+portFolio);
		Preference preference = resumeService.preferenceView(memberId);
		logger.info("preference="+preference);
		Profile profile = resumeService.profileView(memberId);
		logger.info("profile="+profile);
		Education education = resumeService.educationView(memberId);
		logger.info("education="+education);
		mav.addObject("award",award);
		mav.addObject("career",career);
		mav.addObject("certification",certification);
		mav.addObject("hopework",hopework);
		mav.addObject("intern",intern);
		mav.addObject("language",language);
		mav.addObject("learn",learn);
		mav.addObject("overseas",overseas);
		mav.addObject("portFolio",portFolio);
		mav.addObject("preference",preference);
		mav.addObject("profile",profile);
		mav.addObject("education",education);
		mav.setViewName("/resume/resumeView");
		return mav;
	}
	/* 자격증db에서 자격증명찾기 */
	@RequestMapping(value="/resume/certificateList.ithrer")
	@ResponseBody
	public List<Map<String,String>> certificateList(@RequestParam("certName") String certName) {
		List<Map<String,String>> list = resumeService.certificateList(certName);
		return list;
	}

	/* db저장용 */
	@RequestMapping(value="/resume/saveResume.ithrer")
	@ResponseBody
	public ModelAndView saveResume(ModelAndView mav,
								   Award award,Career career,Certification certification,
								   Hopework hopework, Intern intern,
								   Language language, Learn learn,
								   Overseas overseas, PortFolio portFolio,
								   Preference preference, Profile profile,
								   Education education, @RequestParam("memberIdHide") String memberIdHide,
								   Letter letter, MultipartHttpServletRequest req, MultipartFile file,HttpServletResponse res) {
		logger.info("award="+award);
		logger.info("career="+career);
		logger.info("certification="+certification);
		logger.info("education="+education);
		logger.info("hopework="+hopework);
		logger.info("intern="+intern);
		logger.info("language="+language);
		logger.info("learn="+learn);
		logger.info("overseas="+overseas);
		logger.info("portFolio="+portFolio);
		logger.info("preference="+preference);
		logger.info("profile="+profile);
		logger.info("letter="+letter);
		
		Map<String,Object> awardMap = new HashMap<>();
		awardMap.put("award", award);
		awardMap.put("memberIdHide", memberIdHide);
		Map<String,Object> careerMap = new HashMap<>();
		careerMap.put("career",career);
		careerMap.put("memberIdHide",memberIdHide);
		Map<String,Object> certificateMap = new HashMap<>();
		certificateMap.put("certification",certification);
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
		Map<String,Object> letterMap = new HashMap<>();
		letterMap.put("letter",letter);
		letterMap.put("memberIdHide",memberIdHide);
		
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
		try {
			int letterresult = resumeService.insertLetter(letterMap);			
		} catch(NullPointerException e1) {
			e1.printStackTrace();
		}
		
		mav.setViewName("redirect:/");
		return mav;	
	}
}
