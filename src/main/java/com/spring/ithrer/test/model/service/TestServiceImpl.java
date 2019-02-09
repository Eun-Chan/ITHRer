package com.spring.ithrer.test.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.test.model.dao.TestDao;
import com.spring.ithrer.test.model.vo.Member;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestDao testDao;

	@Override
	public List<Member> selectMemberList() {
		return testDao.selectMemberList();
	}
	
	
}
