package com.spring.ithrer.index.model.service;

import java.util.List;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;



public interface IndexService {

	Recruitment selectOneRecruitment();

	Company selectOneCompany(String compId);

}
