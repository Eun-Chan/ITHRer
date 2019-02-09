package com.spring.ithrer.test.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.test.model.vo.Member;

@Repository
public class TestDaoImpl implements TestDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Member> selectMemberList() {
		return sqlSession.selectList("test.selectMemberList");
	}
}
