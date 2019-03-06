package com.spring.ithrer.resume.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.resume.model.vo.Award;
import com.spring.ithrer.resume.model.vo.Career;
import com.spring.ithrer.resume.model.vo.Certification;
import com.spring.ithrer.resume.model.vo.Education;
import com.spring.ithrer.resume.model.vo.Hopework;
import com.spring.ithrer.resume.model.vo.Intern;
import com.spring.ithrer.resume.model.vo.Language;
import com.spring.ithrer.resume.model.vo.Learn;
import com.spring.ithrer.resume.model.vo.Overseas;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Preference;
import com.spring.ithrer.resume.model.vo.Profile;

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

	Award awardView(String memberId);

	Career careerView(String memberId);

	Certification certificateView(String memberId);

	Hopework hopeworkView(String memberId);

	Intern internView(String memberId);

	Language languageView(String memberId);

	Learn learnView(String memberId);

	Overseas overseasView(String memberId);

	PortFolio portFolioView(String memberId);

	Preference preferenceView(String memberId);

	Profile profileView(String memberId);

	Education educationView(String memberId);

	int insertLetter(Map<String, Object> letterMap);


}
