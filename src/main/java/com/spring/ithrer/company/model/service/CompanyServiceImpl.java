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
		
		
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("company",company);
		companyMap.put("hrManagerList",hrManagerList);
		companyMap.put("salesList",salesList);
		
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

}
