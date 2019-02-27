package com.spring.ithrer.resume.controller;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
	
	@RequestMapping(value="/resume/resume")
	public ModelAndView resumeView(ModelAndView mav) {
		mav.setViewName("resume/resume");
		return mav;
	}
	@RequestMapping(value="/resume/certificateList.do")
	@ResponseBody
	public List<Map<String,String>> certificateList(@RequestParam("certName") String certName) {
		List<Map<String,String>> list = resumeService.certificateList(certName);
		return list;
	}
	@RequestMapping(value="/resume/saveResume.do")
	public ModelAndView saveResume(ModelAndView mav,
								   Award award,
								   Career career,
								   Certificate certificate,
								   Education education,
								   Hopework hopework,
								   Intern intern,
								   Language language,
								   Learn learn,
								   Overseas overseas,
								   PortFolio portFolio,
								   Preference preference,
								   Profile profile) {
		logger.info("award="+award);
		logger.info("career="+career);
		logger.info("certificate="+certificate);
		logger.info("education="+education);
		logger.info("hopework="+hopework);
		logger.info("intern="+intern);
		logger.info("language="+language);
		logger.info("award="+award);
		logger.info("award="+award);
		logger.info("award="+award);
		logger.info("award="+award);
		logger.info("award="+award);
		
		
		mav.setViewName("redirect:/");
		return mav;	
	}
}
