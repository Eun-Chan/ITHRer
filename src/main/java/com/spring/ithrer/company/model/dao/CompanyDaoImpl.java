package com.spring.ithrer.company.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.company.model.vo.Company;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Company selectCompanyOne(String compId) {
		return sqlSession.selectOne("company.selectCompanyOne",compId);
	}

}
