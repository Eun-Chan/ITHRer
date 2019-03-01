package com.spring.ithrer.resume.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.resume.model.dao.ResumeDao;
import com.spring.ithrer.resume.model.vo.Award;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	
	ResumeDao resumeDao;

	@Override
	public List<Map<String, String>> certificateList(String certName) {
		List<Map<String,String>> list = resumeDao.certificateList(certName);
		return list;
	}

	@Override
	public int insertAward(Map<String, Object> awardMap) {
		int result = resumeDao.insertAward(awardMap);
		return result;
	}

}
