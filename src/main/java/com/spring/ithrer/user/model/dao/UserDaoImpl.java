package com.spring.ithrer.user.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.user.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("user.idCheck", id);
	}

	@Override
	public int emailCheck(String email) {
		return sqlSession.selectOne("user.emailCheck", email);
	}

	@Override
	public int createMember(Member member) {
		return sqlSession.insert("user.createMember", member);
	}

	@Override
	public Member memberCheck(Map<String, String> map) {
		return sqlSession.selectOne("user.memberCheck", map);
	}

	@Override
	public Member kakaoLogin(String memberId) {
		return sqlSession.selectOne("user.kakaoLogin", memberId);
	}

	@Override
	public Company companyCheck(Map<String, String> map) {
		return sqlSession.selectOne("user.companyCheck", map);
	}
}
