package com.spring.ithrer.resume.model.dao;

import java.util.List;
import java.util.Map;

public interface ResumeDao {

	List<Map<String, String>> certificateList(String certName);

}
