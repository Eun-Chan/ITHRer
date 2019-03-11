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

	@Override
	public int memberIdFindCheck(Map<String, String> member) {
		return sqlSession.selectOne("user.memberIdFindCheck", member);
	}

	@Override
	public Member memberIdView(Map<String, String> member) {
		return sqlSession.selectOne("user.memberIdView" , member);
	}

	@Override
	public Member findPasswordEmailAuth(Map<String, String> member) {
		return sqlSession.selectOne("user.findPasswordEmailAuth" , member);
	}

	@Override
	public Company compIdCheck(String compId) {
		return sqlSession.selectOne("user.compIdCheck" , compId);
	}

	@Override
	public int compEmailAuth(String email) {
		return sqlSession.selectOne("user.compEmailAuth" , email);
	}

	@Override
	public int createCompany(Company company) {
		return sqlSession.insert("user.createCompany", company);
	}

	@Override
	public int createKakaoUser(Map<String, String> user) {
		return sqlSession.insert("user.createKakaoUser" , user);
	}

	@Override
	public int memberPasswordUpdate(Member member) {
		return sqlSession.update("user.memberPasswordUpdate", member);
	}

	@Override
	public Company findCompanyId(Company company) {
		return sqlSession.selectOne("user.findCompanyId", company);
	}

	@Override
	public Company findPasswordEmailAuth2(Company company) {
		return sqlSession.selectOne("user.findPasswordEmailAuth2" , company);
	}

	@Override
	public int companyPasswordUpdate(Company company) {
		return sqlSession.update("user.companyPasswordUpdate", company);
	}
}
