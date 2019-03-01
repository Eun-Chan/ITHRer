package com.spring.ithrer.resume.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.resume.model.vo.Award;

@Repository
public class ResumeDaoImpl implements ResumeDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> certificateList(String certName) {
		return sqlSession.selectList("resume.certificateList",certName);
	}

	@Override
	public int insertAward(Map<String, Object> awardMap) {
		return sqlSession.insert("resume.insertAward",awardMap);
	}
}
