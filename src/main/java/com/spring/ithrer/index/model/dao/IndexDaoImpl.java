package com.spring.ithrer.index.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
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
}
