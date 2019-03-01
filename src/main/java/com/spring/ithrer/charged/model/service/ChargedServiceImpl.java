package com.spring.ithrer.charged.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.charged.model.dao.ChargedDao;

@Service
public class ChargedServiceImpl implements ChargedService {
	
	@Autowired
	ChargedDao chargedDao;

	@Override
	public List<Map<String, String>> selectListCharged() {
		// TODO Auto-generated method stub
		return chargedDao.selectListCharged();
	}

	@Override
	public int updateFileName(String no, String path) {
		return chargedDao.updateFileName(no, path);
		
	}
	
}
