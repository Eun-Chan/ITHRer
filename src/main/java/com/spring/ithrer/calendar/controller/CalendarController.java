package com.spring.ithrer.calendar.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.ithrer.calendar.model.service.CalendarService;

@RestController
public class CalendarController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CalendarService calendarService;
	
	@RequestMapping("/calendar.ithrer")
	public ModelAndView moveCalendar(ModelAndView mav) {

		mav.setViewName("/notice/noticeCalendar");
		return mav;
	}

	@PostMapping("/calendarView.ithrer")
	public void selectCalNotice(ModelAndView mav, HttpServletResponse response) {

		List<Map<String, String>>list = calendarService.selectCalNotice();
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		logger.debug("json: "+json);
		
		
		try {
			
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(list, response.getWriter());
			
			
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//mav.addObject("json", json);
		//mav.setViewName("/notice/noticeCalendar");
		
		//return mav;
	}
	
}
