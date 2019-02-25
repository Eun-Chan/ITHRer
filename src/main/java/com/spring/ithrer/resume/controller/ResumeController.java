package com.spring.ithrer.resume.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.resume.model.service.ResumeService;
import com.spring.ithrer.resume.model.vo.Award;
import com.spring.ithrer.resume.model.vo.Career;


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
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Profile profile) {
	//	logger.info("profile="+profile);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Education education) {
	//	logger.info("education="+education);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Hopework hopework) {
	//	logger.info("hopework="+hopework);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Intern intern) {
	//	logger.info("intern="+intern);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Learn learn) {
	//	logger.info("learn="+learn);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Certificate certificate) {
	//	logger.info("certificate="+certificate);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Award award) {
	//	logger.info("award="+award);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Overseas overseas) {
	//	logger.info("overseas="+overseas);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Language language) {
	//	logger.info("language="+language);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	//@RequestMapping(value="/resume/saveResume.do")
	//public ModelAndView saveResume(ModelAndView mav,Preference preference) {
	//	logger.info("preference="+preference);
	//	mav.setViewName("redirect:/");
	//	return mav;	
	//}
	@RequestMapping(value="/resume/saveResume.do")
	public ModelAndView saveResume(ModelAndView mav,Career career,Award award) {
		logger.debug("career="+career);
		logger.debug("award="+award);
		mav.setViewName("redirect:/");
		return mav;	
	}
}
