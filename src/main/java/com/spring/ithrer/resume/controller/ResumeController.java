package com.spring.ithrer.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.resume.model.service.ResumeService;

@Controller
public class ResumeController {

	@Autowired
	ResumeService resumeService;
	
	@RequestMapping(value="/resume/resume")
	public ModelAndView resumeView(ModelAndView mav) {
		mav.setViewName("resume/resume");
		return mav;
	}
}
