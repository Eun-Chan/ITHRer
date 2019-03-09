package com.spring.ithrer.charged.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargedDaoImpl implements ChargedDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectListCharged() {
		
		return sqlSession.selectList("charged.selectListCharged");
	}

	@Override
	public int updateFileName(String no, String path) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		map.put("path", path);
		
		
		return sqlSession.update("charged.updateFileName", map);
		
	}

	@Override
	public int insertBannerRequest(Map<String, Object> map) {
		return sqlSession.insert("charged.insertBannerRequest", map);
	}
	
}
