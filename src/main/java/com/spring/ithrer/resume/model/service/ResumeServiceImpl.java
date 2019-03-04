package com.spring.ithrer.resume.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.resume.model.dao.ResumeDao;
import com.spring.ithrer.resume.model.vo.Award;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	
	ResumeDao resumeDao;

	@Override
	public List<Map<String, String>> certificateList(String certName) {
		List<Map<String,String>> list = resumeDao.certificateList(certName);
		return list;
	}

	@Override
	public int insertAward(Map<String, Object> awardMap) {
		int result = resumeDao.insertAward(awardMap);
		return result;
	}

	@Override
	public int insertCareer(Map<String, Object> careerMap) {
		int result = resumeDao.insertCareer(careerMap);
		return result;
	}

	@Override
	public int insertCertificate(Map<String, Object> certificateMap) {
		int result = resumeDao.insertCertificate(certificateMap);
		return result;
	}

	@Override
	public int insertHopework(Map<String, Object> hopeworkMap) {
		int result = resumeDao.insertHopework(hopeworkMap);
		return result;
	}

	@Override
	public int insertIntern(Map<String, Object> internMap) {
		int result = resumeDao.insertIntern(internMap);
		return result;
	}

	@Override
	public int insertLanguage(Map<String, Object> languageMap) {
		int result = resumeDao.insertLanguage(languageMap);
		return result;
	}

	@Override
	public int insertLearn(Map<String, Object> learnMap) {
		int result = resumeDao.insertLearn(learnMap);
		return result;
	}

	@Override
	public int insertOverseas(Map<String, Object> overseasMap) {
		int result = resumeDao.insertOverseas(overseasMap);
		return result;
	}

	@Override
	public int insertPreference(Map<String, Object> preferenceMap) {
		int result = resumeDao.insertPreference(preferenceMap);
		return result;
	}

	@Override
	public int insertProfile(Map<String, Object> profileMap) {
		int result = resumeDao.insertProfile(profileMap);
		return result;
	}

	@Override
	public int insertEducation(Map<String, Object> educationMap) {
		int result = resumeDao.insertEducation(educationMap);
		return result;
	}

	@Override
	public int insertPortFolio(Map<String, Object> portFolioMap) {
		int result = resumeDao.insertPortFolio(portFolioMap);
		return result;
	}

}
