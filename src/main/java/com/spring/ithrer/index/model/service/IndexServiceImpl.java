package com.spring.ithrer.index.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.dao.IndexDao;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Profile;
import com.spring.ithrer.user.model.vo.Member;

@Service
public class IndexServiceImpl implements IndexService{

   @Autowired
   IndexDao indexDao;

   @Override
   public Recruitment selectOneRecruitment(Map<String, Object> map) {
      return indexDao.selectOneRecruitment(map);
   }

   @Override
   public Company selectOneCompany(String compId) {
      return indexDao.selectoneCompany(compId);
   }

   @Override
   public List<Member> selectStatistics(int recruitmentNo) {
      List<Member> member = indexDao.selectStatistics(recruitmentNo);
      return member;
   }

   @Override
   public int insertLocation(Map<String, Object> map) {
      return indexDao.insertLocation(map);
   }

   @Override
   public List<Recruitment> selectListRecruitment(String memberId) {
      return indexDao.selectListRecruitment(memberId);
   }

   @Override
   public Favorites selectOneFavorites(Map<String, Object> map) {
      return indexDao.selectOneFavorites(map);
   }

   @Override
   public int insertFavorites(Map<String, Object> map) {
      return indexDao.insertFavorites(map);
   }

   @Override
   public int deleteFavorites(Map<String, Object> map) {
      return indexDao.deleteFavorites(map);
   }


   
   @Override
   public int insertPortFolio(Map<String, Object> map) {
      return indexDao.insertPortFolio(map);
   }

   @Override
   public int updateMember(Map<String, Object> param) {
      return indexDao.updateMember(param);
   }

   @Override
   public int insertCompanyApplication(Map<String, Object> map) {
      return indexDao.insertCompanyApplication(map);
   }

   @Override
   public int selectCountCompanyApplication(Map<String, Object> map) {
      return indexDao.selectCountCompanyApplication(map);
   }

   @Override
   public List<Recruitment> selectTopListRecruitment(String memberId) {
      return indexDao.selectTopListRecruitment(memberId);
   }

   @Override
   public List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map, int ithrerNumPerPage,
         int ithrerCPage) {
      return indexDao.selectListSearchIthrer(map, ithrerNumPerPage, ithrerCPage);
   }

   @Override
   public List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map) {
      return indexDao.selectListSearchIthrer(map);
   }

   @Override
   public PortFolio selectOnePortFolio(String memberId) {
      return indexDao.selectOnePortFolio(memberId);
   }



   @Override
   public List<Recruitment> selectListRandomRecruitment(String memberId) {
      return indexDao.selectListRandomRecruitment(memberId);
   }

   @Override
   public int selectCountFavorite(String memberId) {
      return indexDao.selectCountFavorite(memberId);
   }

   @Override
   public List<Favorites> selectListFavorites(String memberId, int cPage, int numPerPage) {
      return indexDao.selectListFavorites(memberId,cPage,numPerPage);
   }

   @Override
   public List<Recruitment> selectListRecommendRecruitmentList(Map<String, Object> map) {
      return indexDao.selectListRecommendRecruitmentList(map);
   }
   @Override
   public int deleteFavoritesList(Map<String, Object> map) {
      return indexDao.deleteFavoritesList(map);
   }

   @Override
   public List<Map<String, String>> selectListCharged() {
      return indexDao.selectListCharged();
   }

   @Override
   public Profile selectOneProfile(String memberId) {
      return indexDao.selectOneProfile(memberId);
   }

@Override
public Recruitment selectOneRecruitmentEndCheck(int recruitmentNo) {
	return indexDao.selectOneRecruitmentEndCheck(recruitmentNo);
}

@Override
public int updateProfile(Map<String, Object> param) {
	return indexDao.updateProfile(param);
}

@Override
public int deletePortFolio(int pfNo) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int deletePortFolio(String memberId) {
	 return indexDao.deletePortFolio(memberId);
}

@Override
public int selectCountCompanyapplication(String memberId) {
	return indexDao.selectCountCompanyapplication(memberId);
}

@Override
public List<Recruitment> selectListMemberCompanyApplicationList(String memberId, int cPage, int numPerPage) {
	return indexDao.selectListMemberCompanyApplicationList(memberId,cPage,numPerPage);
}

}

