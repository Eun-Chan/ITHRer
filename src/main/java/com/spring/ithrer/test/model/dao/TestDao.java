package com.spring.ithrer.test.model.dao;

import java.util.List;

import com.spring.ithrer.test.model.vo.Member;

public interface TestDao {

	List<Member> selectMemberList();
}
