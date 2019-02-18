package com.spring.ithrer.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.calendar.model.dao.CalendarDao;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Autowired
	CalendarDao calendarDao;

	@Override
	public List<Map<String, String>> selectCalNotice() {
		// TODO Auto-generated method stub
		return calendarDao.selectCalNotice();
	}
	
	
}
