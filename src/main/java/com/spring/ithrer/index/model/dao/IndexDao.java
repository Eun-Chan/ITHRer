package com.spring.ithrer.index.model.dao;

import java.util.List;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;



public interface IndexDao {

	Recruitment selectOneRecruitment();

	Company selectoneCompany(String compId);

}
