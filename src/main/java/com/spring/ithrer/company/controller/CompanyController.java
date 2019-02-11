package com.spring.ithrer.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.company.model.service.CompanyService;
import com.spring.ithrer.company.model.vo.Company;

@RestController
@RequestMapping("/company")
public class CompanyController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyService companyService;
	
	@GetMapping("/info")
	public ModelAndView selectCompanyOne(@RequestParam("compId") String compId, ModelAndView mav) {
		
		Company company = null;
		
		company = companyService.selectCompanyOne(compId);
		
		mav.addObject("company",company);
		
		mav.setViewName("company/companyInfo");
		
		return mav;
	}
	
}
