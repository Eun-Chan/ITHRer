package com.spring.ithrer.index.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Profile;
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

	List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map, int ithrerNumPerPage, int ithrerCPage);
	
	int insertPortFolio(Map<String, Object> map);


   int updateMember(Map<String, Object> param);

   int insertCompanyApplication(Map<String, Object> map);

   int selectCountCompanyApplication(Map<String, Object> map);

   List<Recruitment> selectTopListRecruitment(String memberId);

   List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map);

   List<PortFolio> selectListPortFolio(String memberId);

   int deletePortFolio(int pfNo);

   List<Recruitment> selectListRandomRecruitment(String memberId);

   int selectCountFavorite(String memberId);

   List<Favorites> selectListFavorites(String memberId, int cPage, int numPerPage);

   List<Recruitment> selectListRecommendRecruitmentList(Map<String, Object> map);


   int deleteFavoritesList(Map<String, Object> map);

   List<Map<String, String>> selectListCharged();

   Profile selectOneProfile(String memberId);

	Recruitment selectOneRecruitmentEndCheck(int recruitmentNo);
	
	int updateProfile(Map<String, Object> param);

}