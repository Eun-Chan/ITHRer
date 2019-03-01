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

	/*
	 * @Override public List<Map<String, String>> selectListSearchIthrer(Map<String,
	 * Object> map) {
	 * 
	 * return indexDao.selectListSearchIthrer(map); }
	 */
	
	@Override
	public int insertPortFolio(PortFolio pf) {
		return indexDao.insertPortFolio(pf);
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
	public List<PortFolio> selectListPortFolio(String memberId) {
		return indexDao.selectListPortFolio(memberId);
	}

	@Override
	public int deletePortFolio(int pfNo) {
		return indexDao.deletePortFolio(pfNo);
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



}
