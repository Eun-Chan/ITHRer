package com.spring.ithrer.resume.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.resume.model.vo.Award;

public interface ResumeService {

	List<Map<String, String>> certificateList(String certName);

	int insertAward(Map<String, Object> awardMap);

	int insertCareer(Map<String, Object> careerMap);

	int insertCertificate(Map<String, Object> certificateMap);

	int insertHopework(Map<String, Object> hopeworkMap);

	int insertIntern(Map<String, Object> internMap);

	int insertLanguage(Map<String, Object> languageMap);

	int insertLearn(Map<String, Object> learnMap);

	int insertOverseas(Map<String, Object> overseasMap);

	int insertPreference(Map<String, Object> preferenceMap);

	int insertProfile(Map<String, Object> profileMap);

	int insertEducation(Map<String, Object> educationMap);

	int insertPortFolio(Map<String, Object> portFolioMap);


}
