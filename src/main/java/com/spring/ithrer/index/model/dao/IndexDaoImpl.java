package com.spring.ithrer.index.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;



@Repository
public class IndexDaoImpl implements IndexDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Recruitment selectOneRecruitment() {
		return sqlSession.selectOne("index.selectOneRecruitment");
	}

	@Override
	public Company selectoneCompany(String compId) {
		return sqlSession.selectOne("index.selectOneCompany", compId);
	}
}
