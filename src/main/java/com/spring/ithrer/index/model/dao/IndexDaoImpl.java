package com.spring.ithrer.index.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class IndexDaoImpl implements IndexDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
}
