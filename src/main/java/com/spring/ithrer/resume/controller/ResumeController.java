package com.spring.ithrer.resume.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
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
   @RequestMapping(value="/resume/resume.ithrer")
   public ModelAndView resumeView(ModelAndView mav) {
      mav.setViewName("resume/resume");
      return mav;
   }
	/* 자격증db에서 자격증명찾기 */
	@RequestMapping(value="/resume/certificateList.ithrer")
	@ResponseBody
	public List<Map<String,String>> certificateList(@RequestParam("certname") String certname) {
		List<Map<String,String>> list = resumeService.certificateList(certname);
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

   /* 내이력서가기 */
   @RequestMapping(value="/resume/resumeView.ithrer")
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
      Letter letter = resumeService.letterView(memberId);
      logger.info("letter="+letter);
      mav.addObject("award", award);
      mav.addObject("career", career);
      mav.addObject("certification", certification);
      mav.addObject("education", education);
      mav.addObject("hopework", hopework);
      mav.addObject("intern", intern);
      mav.addObject("language", language);
      mav.addObject("learn", learn);
      mav.addObject("letter", letter);
      mav.addObject("overseas", overseas);
      mav.addObject("portFolio", portFolio);
      mav.addObject("preference", preference);
      mav.addObject("profile", profile);
      try {
    	  int awardcnt = award.getAwardnameArr().length;
    	  mav.addObject("awardcnt", awardcnt);   
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int carrercnt = career.getCorpnameArr().length;
    	  mav.addObject("carrercnt", carrercnt);   
    	  System.out.println("carrercnt="+carrercnt);
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int certificationcnt = certification.getCertnameArr().length;
    	  mav.addObject("certificationcnt", certificationcnt);   
    	  System.out.println("certificationcnt="+certificationcnt);
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int interncnt = intern.getInterndivisionArr().length;
    	  mav.addObject("interncnt", interncnt);   
    	  System.out.println("interncnt="+interncnt);
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int learncnt = learn.getLearntitleArr().length;
    	  mav.addObject("learncnt", learncnt);   
    	  System.out.println("learncnt="+learncnt);
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int lettercnt = letter.getLettertextArr().length;
    	  mav.addObject("lettercnt", lettercnt);   
    	  System.out.println("lettercnt="+lettercnt);
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int overseascnt = overseas.getCountryArr().length;
    	  mav.addObject("overseascnt", overseascnt);   
    	  System.out.println("overseascnt="+overseascnt);
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  String portFoliorename = portFolio.getPRenamedFileName();
    	  mav.addObject("portFoliorename", portFoliorename);   
    	  System.out.println("portFoliocon="+portFoliorename);    	  
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int languagecnt = language.getLanguagedivisionArr().length;
    	  mav.addObject("languagecnt", languagecnt);  
    	  System.out.println("languagecnt="+languagecnt);    	   	    	  	  
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int ablitycnt = language.getSpeakingdivisionArr().length;
    	  mav.addObject("ablitycnt", ablitycnt);   
    	  System.out.println("ablitycnt="+ablitycnt);  
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int examcnt = language.getExamnameArr().length;
    	  mav.addObject("examcnt", examcnt);   
    	  System.out.println("examcnt="+examcnt);    
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int educationcnt = education.getGraduactionArr().length;
    	  mav.addObject("educationcnt", educationcnt);      	   
    	  System.out.println("educationcnt="+educationcnt);    	  
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int hschoolcnt = education.getHighgraduationdateArr().length;
    	  mav.addObject("hschoolcnt", hschoolcnt);      
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int uschoolcnt = education.getGraducationstateArr().length;
    	  mav.addObject("uschoolcnt", uschoolcnt);        
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      try {
    	  int gschoolcnt = education.getDegreeArr().length;
    	  mav.addObject("gschoolcnt", gschoolcnt);       
      } catch(NullPointerException e1) {
    	  e1.printStackTrace();
      }
      mav.setViewName("/resume/resumeView");
      return mav;
   }
   
   
   @RequestMapping(value="/uploadMemberPhoto.ithrer", produces="application/json")
   @ResponseBody
	public void fileUpload(ModelAndView mav, HttpServletRequest request,
			@RequestParam(name="upFile", required=false) MultipartFile upFiles,@RequestParam("directory") String directory,
			HttpServletResponse response) throws JsonIOException, IOException  {
		
		logger.info("originalName: " + upFiles.getOriginalFilename());
		logger.info("directory: " + directory);
		logger.info("originalName: " + upFiles.getOriginalFilename());
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
		logger.info("path : "+path);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(path,response.getWriter());
		
	}
   
   
}

