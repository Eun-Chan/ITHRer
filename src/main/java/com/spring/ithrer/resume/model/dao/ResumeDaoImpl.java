package com.spring.ithrer.resume.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDaoImpl implements ResumeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
}
