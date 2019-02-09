package com.spring.ithrer.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.test.model.service.TestService;
import com.spring.ithrer.test.model.vo.Member;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
	@RequestMapping(value="/test/test.do")
	public ModelAndView test(ModelAndView mav) {
		
		List<Member> list = testService.selectMemberList();
		
		if(list != null) {
			System.out.println("성공");
			System.out.println("list = "+list);
		}
		else
			System.out.println("실패");
		
		mav.addObject("list", list);
		mav.setViewName("/common/test");
		return mav;
	}
	
}
