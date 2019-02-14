package com.spring.ithrer.company.model.dao;

import java.util.List;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Sales;

public interface CompanyDao {

	Company selectCompanyOne(String compId);

	List<HRManager> selectHRManagerList(String compId);

	List<Sales> selectSalesList(String compId);

}
