package com.spring.ithrer.index.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.dao.IndexDao;
import com.spring.ithrer.user.model.vo.Member;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	IndexDao indexDao;

	@Override
	public Recruitment selectOneRecruitment(int recruitmentNo) {
		return indexDao.selectOneRecruitment(recruitmentNo);
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
}
