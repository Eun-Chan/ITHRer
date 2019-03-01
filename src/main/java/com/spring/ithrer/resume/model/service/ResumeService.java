package com.spring.ithrer.resume.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.resume.model.vo.Award;

public interface ResumeService {

	List<Map<String, String>> certificateList(String certName);

	int insertAward(Map<String, Object> awardMap);


}
