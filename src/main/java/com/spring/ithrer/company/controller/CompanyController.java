package com.spring.ithrer.company.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.company.model.service.CompanyService;

@RestController
@RequestMapping("/company")
public class CompanyController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyService companyService;
	
	@GetMapping("/info.ithrer")
	public ModelAndView selectCompanyOne(@RequestParam("compId") String compId, ModelAndView mav) {
		
		// 회사, 인사담당자 정보 가져오기
		Map<String, Object> companyMap = companyService.selectCompanyOne(compId);
		
		
		mav.addObject("companyMap",companyMap);
		
		mav.setViewName("company/companyInfo");
		
		return mav;
	}
	
}
