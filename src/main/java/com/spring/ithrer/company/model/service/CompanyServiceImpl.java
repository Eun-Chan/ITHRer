package com.spring.ithrer.company.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.company.model.dao.CompanyDao;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Sales;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyDao companyDao;

	@Override
	public Map<String, Object> selectCompanyOne(String compId) {
		
		
		Company company = companyDao.selectCompanyOne(compId);
		
		List<HRManager> hrManagerList = companyDao.selectHRManagerList(compId);
		
		List<Sales> salesList = companyDao.selectSalesList(compId);
		
		
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("company",company);
		companyMap.put("hrManagerList",hrManagerList);
		companyMap.put("salesList",salesList);
		
		return companyMap;
	}

}
