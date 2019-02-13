package com.spring.ithrer.resume.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.resume.model.dao.ResumeDao;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	
	ResumeDao resumeDao;
}
