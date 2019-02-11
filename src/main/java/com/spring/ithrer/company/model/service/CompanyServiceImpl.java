package com.spring.ithrer.company.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.company.model.dao.CompanyDao;
import com.spring.ithrer.company.model.vo.Company;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyDao companyDao;

	@Override
	public Company selectCompanyOne(String compId) {
		return companyDao.selectCompanyOne(compId);
	}

}
