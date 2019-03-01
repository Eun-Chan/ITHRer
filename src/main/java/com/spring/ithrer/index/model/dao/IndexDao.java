package com.spring.ithrer.index.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.user.model.vo.Member;



public interface IndexDao {

	Recruitment selectOneRecruitment(Map<String, Object> map);

	Company selectoneCompany(String compId);

	List<Member> selectStatistics(int recruitmentNo);

	int insertLocation(Map<String, Object> map);

	List<Recruitment> selectListRecruitment(String memberId);

	Favorites selectOneFavorites(Map<String, Object> map);

	int insertFavorites(Map<String, Object> map);

	int deleteFavorites(Map<String, Object> map);

	List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map, int ithrerNumPerPage, int ithrerCPage);
	
	int insertPortFolio(PortFolio pf);

	int updateMember(Map<String, Object> param);

	int insertCompanyApplication(Map<String, Object> map);

	int selectCountCompanyApplication(Map<String, Object> map);

	List<Recruitment> selectTopListRecruitment(String memberId);

	List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map);

	List<PortFolio> selectListPortFolio(String memberId);

	int deletePortFolio(int pfNo);

}
