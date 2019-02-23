package com.spring.ithrer.index.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.user.model.vo.Member;



public interface IndexService {


	Company selectOneCompany(String compId);

	List<Member> selectStatistics(int recruitmentNo);

	Recruitment selectOneRecruitment(Map<String, Object> map);

	int insertLocation(Map<String, Object> map);

	List<Recruitment> selectListRecruitment(String memberId);

	Favorites selectOneFavorites(Map<String, Object> map);

	int insertFavorites(Map<String, Object> map);

	int deleteFavorites(Map<String, Object> map);

	List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map);

}
