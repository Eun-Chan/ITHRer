package com.spring.ithrer.charged.model.service;

import java.util.List;
import java.util.Map;

public interface ChargedService {

	List<Map<String, String>> selectListCharged();

	int updateFileName(String no, String path);

	int insertBannerRequest(Map<String, Object> map);

}
