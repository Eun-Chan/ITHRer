package com.spring.ithrer.index.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.dao.IndexDao;
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
	public List<Map<String, String>> selectListSearchIthrer(Map<String, Object> map) {
		
		return indexDao.selectListSearchIthrer(map);
	}

}
