package com.spring.ithrer.company.model.service;

import java.util.Map;

import com.spring.ithrer.company.model.vo.HRManager;

public interface CompanyService {

	Map<String, Object> selectCompanyOne(String compId);

	Map<String, Object> deleteHrManager(int no, String compId);

	int deleteHrManager(int no);

	Map<String, Object> insertHrManager(HRManager hrManager);

}
