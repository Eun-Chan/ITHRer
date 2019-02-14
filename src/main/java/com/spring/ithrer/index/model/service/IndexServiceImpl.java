package com.spring.ithrer.index.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.dao.IndexDao;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	IndexDao indexDao;

	@Override
	public Recruitment selectOneRecruitment() {
		return indexDao.selectOneRecruitment();
	}

	@Override
	public Company selectOneCompany(String compId) {
		return indexDao.selectoneCompany(compId);
	}
}
