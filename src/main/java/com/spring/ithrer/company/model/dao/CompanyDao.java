package com.spring.ithrer.company.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Location;
import com.spring.ithrer.company.model.vo.Sales;

public interface CompanyDao {

	Company selectCompanyOne(String compId);

	List<HRManager> selectHRManagerList(String compId);

	List<Sales> selectSalesList(String compId);

	int deleteHrManager(int no);

	int insertHrManager(HRManager hrManager);

	int updateHrManager(HRManager hrManager);

	int updateCompany(Company company);

	int updateSales(Sales sales);

	int insertSales(Sales sales);

	int deleteSales(Sales sales);

	List<Location> selectLocationList(String compId);

	int insertLocation(Location location);

	int deleteLocation(Location location);

	int updateLocation(Location location);

}
