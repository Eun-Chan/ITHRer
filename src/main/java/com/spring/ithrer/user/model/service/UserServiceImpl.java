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

	@Override
	public Member memberIdView(Map<String, String> member) {
		return userDao.memberIdView(member);
	}

	@Override
	public Member findPasswordEmailAuth(Map<String, String> member) {
		return userDao.findPasswordEmailAuth(member);
	}

	@Override
	public Company compIdCheck(String compId) {
		return userDao.compIdCheck(compId);
	}

	@Override
	public int compEmailAuth(String email) {
		return userDao.compEmailAuth(email);
	}

	@Override
	public int createCompany(Company company) {
		return userDao.createCompany(company);
	}

	@Override
	public int createKakaoUser(Map<String, String> user) {
		return userDao.createKakaoUser(user);
	}

	@Override
	public int memberPasswordUpdate(Member member) {
		return userDao.memberPasswordUpdate(member);
	}

	@Override
	public Company findCompanyId(Company company) {
		return userDao.findCompanyId(company);
	}

	@Override
	public Company findPasswordEmailAuth2(Company company) {
		return userDao.findPasswordEmailAuth2(company);
	}

	@Override
	public int companyPasswordUpdate(Company company) {
		return userDao.companyPasswordUpdate(company);
	}
}
