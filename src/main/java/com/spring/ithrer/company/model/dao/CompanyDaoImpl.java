package com.spring.ithrer.company.model.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Sales;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	Logger logger = Logger.getLogger(getClass());
	
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

	@Override
	public int deleteHrManager(int no) {
		return sqlSession.delete("company.deleteHrManager",no);
	}

	@Override
	public int insertHrManager(HRManager hrManager) {
		return sqlSession.insert("company.insertHrManager",hrManager);
	}

	@Override
	public int updateHrManager(HRManager hrManager) {
		return sqlSession.update("company.updateHrManager",hrManager);
	}

	@Override
	public int updateCompany(Company company) {
		return sqlSession.update("company.updateCompany",company);
	}

	@Override
	public int updateSales(Sales sales) {
		return sqlSession.update("company.updateSales",sales);
	}

}
