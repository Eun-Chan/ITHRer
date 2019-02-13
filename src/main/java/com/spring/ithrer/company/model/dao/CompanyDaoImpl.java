package com.spring.ithrer.company.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Sales;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Company selectCompanyOne(String compId) {
		return sqlSession.selectOne("company.selectCompanyOne",compId);
	}

	@Override
	public List<HRManager> selectHRManagerList(String compId) {
		return sqlSession.selectList("company.selectHRManagerList",compId);
	}

	@Override
	public List<Sales> selectSalesList(String compId) {
		return sqlSession.selectList("company.selectSalesList",compId);
	}

}
