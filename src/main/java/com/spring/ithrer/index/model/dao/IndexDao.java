package com.spring.ithrer.index.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.user.model.vo.Member;



public interface IndexDao {

	Recruitment selectOneRecruitment(int recruitmentNo);

	Company selectoneCompany(String compId);

	List<Member> selectStatistics(int recruitmentNo);

}
