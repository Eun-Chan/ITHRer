package com.spring.ithrer.user.model.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.user.model.dao.UserDao;
import com.spring.ithrer.user.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	UserDao userDao;

	@Override
	public int idCheck(String id) {
		return userDao.idCheck(id);
	}

	@Override
	public int emailCheck(String email) {
		return userDao.emailCheck(email);
	}

	@Override
	public int createMember(Member member) {
		return userDao.createMember(member);
	}

	@Override
	public Member memberCheck(Map<String, String> map) {
		return userDao.memberCheck(map);
	}

	@Override
	public Member kakaoLogin(String memberId) {
		return userDao.kakaoLogin(memberId);
	}

	@Override
	public Company companyCheck(Map<String, String> map) {
		return userDao.companyCheck(map);
	}

	@Override
	public int memberIdFindCheck(Map<String, String> member) {
		return userDao.memberIdFindCheck(member);
	}
}