package com.spring.ithrer.charged.model.dao;

import java.util.List;
import java.util.Map;

public interface ChargedDao {

	List<Map<String, String>> selectListCharged();

	int updateFileName(String no, String path);

	int insertBannerRequest(Map<String, Object> map);

}
