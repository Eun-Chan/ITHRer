package com.spring.ithrer.index.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.user.model.vo.Member;



public interface IndexService {


	Company selectOneCompany(String compId);

	List<Member> selectStatistics(int recruitmentNo);

	Recruitment selectOneRecruitment(int recruitmentNo);

	int insertLocation(Map<String, Object> map);

}
