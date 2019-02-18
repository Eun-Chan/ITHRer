package com.spring.ithrer.company.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.company.model.dao.CompanyDao;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Location;
import com.spring.ithrer.company.model.vo.Sales;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CompanyDao companyDao;

	@Override
	public Map<String, Object> selectCompanyOne(String compId) {
		
		
		Company company = companyDao.selectCompanyOne(compId);
		
		List<HRManager> hrManagerList = companyDao.selectHRManagerList(compId);
		
		List<Sales> salesList = companyDao.selectSalesList(compId);
		
		List<Location> locationList = companyDao.selectLocationList(compId);
		
		
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("company",company);
		companyMap.put("hrManagerList",hrManagerList);
		companyMap.put("salesList",salesList);
		companyMap.put("locationList",locationList);
		
		return companyMap;
	}

	@Override
	public Map<String, Object> deleteHrManager(int no, String compId) {
		
		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.deleteHrManager(no);
		
		String msg = "";
		List<HRManager> hrManagerList = null;
		
		if(result > 0) {
			msg = "삭제 성공!";
			hrManagerList = companyDao.selectHRManagerList(compId);
		}
		else {
			msg = "삭제 실패!";
		}
		
		map.put("msg", msg);
		if(hrManagerList != null)
			map.put("hrManagerList",hrManagerList);
		
		return map;
	}

	@Override
	public int deleteHrManager(int no) {
		return companyDao.deleteHrManager(no);
	}

	@Override
	public Map<String, Object> insertHrManager(HRManager hrManager) {
		
		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.insertHrManager(hrManager);
		
		String msg = "";
		List<HRManager> hrManagerList = null;
		
		if(result > 0) {
			msg = "등록 성공!";
			hrManagerList = companyDao.selectHRManagerList(hrManager.getCompId());
		}
		else {
			msg = "등록 실패!";
		}
		
		map.put("msg", msg);
		if(hrManagerList != null)
			map.put("hrManagerList",hrManagerList);
		
		return map;
	}

	@Override
	public Map<String, Object> updateHrManager(HRManager hrManager) {

		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.updateHrManager(hrManager);
		
		String msg = "";
		List<HRManager> hrManagerList = null;
		
		if(result > 0) {
			msg = "수정 성공!";
			hrManagerList = companyDao.selectHRManagerList(hrManager.getCompId());
		}
		else {
			msg = "수정 실패!";
		}
		
		map.put("msg", msg);
		
		if(hrManagerList != null)
			map.put("hrManagerList",hrManagerList);
		
		return map;
	}

	@Override
	public Map<String, Object> updateCompany(Company company) {
		
		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.updateCompany(company);
		
		String msg = "";
		
		if(result > 0) {
			msg = "수정 성공!";
		}
		else {
			msg = "수정 실패!";
		}
		
		map.put("msg", msg);
		
		return map;
	}

	@Override
	public Map<String, Object> updateSales(Sales sales) {
		
		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.updateSales(sales);
		
		String msg = "";
		
		if(result > 0) {
			msg = "수정 성공!";
		}
		else {
			msg = "수정 실패!";
		}
		
		map.put("msg", msg);
		
		return map;
	}

	@Override
	public Map<String, Object> insertSales(Sales sales) {

		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.insertSales(sales);
		List<Sales> salesList = null;
		
		String msg = "";
		
		if(result > 0) {
			msg = "등록 성공!";
			salesList = companyDao.selectSalesList(sales.getCompId());
		}
		else {
			msg = "등록 실패!";
		}
		
		map.put("msg", msg);
		
		if(salesList != null)
			map.put("salesList",salesList);
		
		return map;
	}

	@Override
	public Map<String, Object> deleteSales(Sales sales) {

		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.deleteSales(sales);
		List<Sales> salesList = null;
		
		String msg = "";
		
		if(result > 0) {
			msg = "삭제 성공!";
			salesList = companyDao.selectSalesList(sales.getCompId());
		}
		else {
			msg = "삭제 실패!";
		}
		
		map.put("msg", msg);
		
		if(salesList != null)
			map.put("salesList",salesList);
		
		return map;
	}

	@Override
	public Map<String, Object> insertLocation(Location location) {

		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.insertLocation(location);
		List<Location> locationList = null;
		
		String msg = "";
		
		if(result > 0) {
			msg = "등록 성공!";
			locationList = companyDao.selectLocationList(location.getCompId());
		}
		else {
			msg = "등록 실패!";
		}
		
		map.put("msg", msg);
		
		if(locationList != null)
			map.put("locationList",locationList);
		
		return map;
	}

	@Override
	public Map<String, Object> deleteLocation(Location location) {

		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.deleteLocation(location);
		List<Location> locationList = null;
		
		String msg = "";
		
		if(result > 0) {
			msg = "삭제 성공!";
			locationList = companyDao.selectLocationList(location.getCompId());
			logger.debug(""+locationList);
		}
		else {
			msg = "삭제 실패!";
		}
		
		map.put("msg", msg);
		
		if(locationList != null)
			map.put("locationList",locationList);
		
		return map;
	}

	@Override
	public Map<String, Object> updateLocation(Location location) {

		Map<String, Object> map = new HashMap<>();
		
		int result = companyDao.updateLocation(location);
		
		String msg = "";
		
		if(result > 0) {
			msg = "수정 성공!";
		}
		else {
			msg = "수정 실패!";
		}
		
		map.put("msg", msg);
		
		return map;
	}

}
