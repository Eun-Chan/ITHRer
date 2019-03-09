package com.spring.ithrer.index.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Profile;
import com.spring.ithrer.user.model.vo.Member;



@Repository
public class IndexDaoImpl implements IndexDao{
 
   @Autowired
   SqlSessionTemplate sqlSession;

   @Override
   public Recruitment selectOneRecruitment(Map<String, Object> map) {
      return sqlSession.selectOne("index.selectOneRecruitment",map);
   }

   @Override
   public Company selectoneCompany(String compId) {
      return sqlSession.selectOne("index.selectOneCompany", compId);
   }

   @Override
   public List<Member> selectStatistics(int recruitmentNo) {
      //맴버테이블과  , 지원테이블 조인해서 값 가져오기
      List<Member> map = sqlSession.selectList("index.selectStatistics", recruitmentNo);
         
      return map;
   }

   @Override
   public int insertLocation(Map<String, Object> map) {
      return sqlSession.insert("index.insertLocation", map);
   }

   @Override
   public List<Recruitment> selectListRecruitment(String memberId) {
      return sqlSession.selectList("index.selectListRecruitment",memberId);
   }

   @Override
   public Favorites selectOneFavorites(Map<String, Object> map) {
      return sqlSession.selectOne("index.selectOneFavorites", map);
   }

   @Override
   public int insertFavorites(Map<String, Object> map) {
      return sqlSession.insert("index.insertFavorites", map);
   }

   @Override
   public int deleteFavorites(Map<String, Object> map) {
      return sqlSession.delete("index.deleteFavorites", map);
   }

   @Override
   public int insertPortFolio(Map<String, Object> map) {
      return sqlSession.insert("index.insertPortFolio", map);
   }

   @Override
   public int updateMember(Map<String, Object> param) {
      return sqlSession.update("index.updateMember",param);
   }

   @Override
   public int insertCompanyApplication(Map<String, Object> map) {
      return sqlSession.insert("index.insertCompanyApplication", map);
   }

   @Override
   public int selectCountCompanyApplication(Map<String, Object> map) {
      return sqlSession.selectOne("index.selectCountCompanyApplication", map);
   }

   @Override
   public List<Recruitment> selectTopListRecruitment(String memberId) {
      return sqlSession.selectList("index.selectTopListRecruitment",memberId);
   }

   @Override
   public List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map, int ithrerNumPerPage,
         int ithrerCPage) {
      RowBounds rowBounds = new RowBounds((ithrerCPage-1)*ithrerNumPerPage, ithrerNumPerPage);
      return sqlSession.selectList("index.selectListSearchIthrer", map, rowBounds);
   }

   @Override
   public List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map) {
      return sqlSession.selectList("index.selectListSearchIthrer", map);
   }

   @Override
   public List<PortFolio> selectListPortFolio(String memberId) {
      return sqlSession.selectList("index.selectListPortFolio",memberId);
   }

   @Override
   public int deletePortFolio(int pfNo) {
      return sqlSession.delete("index.deletePortFolio", pfNo);
   }

   @Override
   public List<Recruitment> selectListRandomRecruitment(String memberId) {
      return sqlSession.selectList("index.selectListRandomRecruitment", memberId);
   }



   @Override
   public int selectCountFavorite(String memberId) {
      return sqlSession.selectOne("index.selectCountFavorite",memberId);
   }

   @Override
   public List<Favorites> selectListFavorites(String memberId, int cPage, int numPerPage) {
      RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
      return sqlSession.selectList("index.selectListFavorites", memberId,rowBounds);
   }

   @Override
   public List<Recruitment> selectListRecommendRecruitmentList(Map<String,Object> map) {
      return sqlSession.selectList("index.selectListRecommendRecruitmentList", map);
   }

   @Override
   public int deleteFavoritesList(Map<String, Object> map) {
      return sqlSession.delete("index.deleteFavoritesList", map);
   }

   @Override
   public List<Map<String, String>> selectListCharged() {
      // TODO Auto-generated method stub
      return sqlSession.selectList("index.selectListCharged");
   }

   @Override
   public Profile selectOneProfile(String memberId) {
      return sqlSession.selectOne("index.selectOneProfile", memberId);
   }

@Override
public Recruitment selectOneRecruitmentEndCheck(int recruitmentNo) {
	return sqlSession.selectOne("index.selectOneRecruitmentEndCheck", recruitmentNo);
}

@Override
public int updateProfile(Map<String, Object> param) {
	return sqlSession.update("index.updateProfile", param);
}

}

