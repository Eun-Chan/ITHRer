package com.spring.ithrer.user.model.service;

import java.util.Map;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.user.model.vo.Member;

public interface UserService {

	int idCheck(String id);

	int emailCheck(String email);

	int createMember(Member member);

	Member memberCheck(Map<String, String> map);

	Member kakaoLogin(String memberId);

	Company companyCheck(Map<String, String> map);
}
