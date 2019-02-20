package com.spring.ithrer.user.model.dao;

import java.util.Map;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.user.model.vo.Member;

public interface UserDao {

	int idCheck(String id);

	int emailCheck(String email);

	int createMember(Member member);

	Member memberCheck(Map<String, String> map);

	Member kakaoLogin(String memberId);

	Company companyCheck(Map<String, String> map);

	int memberIdFindCheck(Map<String, String> member);

	Member memberIdView(Map<String, String> member);

	Member findPasswordEmailAuth(Map<String, String> member);

	Company compIdCheck(String compId);

	int compEmailAuth(String email);

	int createCompany(Company company);
}
