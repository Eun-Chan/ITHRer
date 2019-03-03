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

	@Override
	public int insertCareer(Map<String, Object> careerMap) {
		return sqlSession.insert("resume.insertCareer",careerMap);
	}

	@Override
	public int insertCertificate(Map<String, Object> certificateMap) {
		return sqlSession.insert("resume.insertCertificate",certificateMap);
	}

	@Override
	public int insertHopework(Map<String, Object> hopeworkMap) {
		return sqlSession.insert("resume.insertHopework",hopeworkMap);
	}

	@Override
	public int insertIntern(Map<String, Object> internMap) {
		return sqlSession.insert("resume.insertIntern",internMap);
	}

	@Override
	public int insertLanguage(Map<String, Object> languageMap) {
		return sqlSession.insert("resume.insertLanguage",languageMap);
	}

	@Override
	public int insertLearn(Map<String, Object> learnMap) {
		return sqlSession.insert("resume.insertLearn",learnMap);
	}

	@Override
	public int insertOverseas(Map<String, Object> overseasMap) {
		return sqlSession.insert("resume.insertOverseas",overseasMap);
	}

	@Override
	public int insertPreference(Map<String, Object> preferenceMap) {
		return sqlSession.insert("resume.insertPreference",preferenceMap);
	}

	@Override
	public int insertProfile(Map<String, Object> profileMap) {
		return sqlSession.insert("resume.insertProfile",profileMap);
	}

	@Override
	public int insertEducation(Map<String, Object> educationMap) {
		return sqlSession.insert("resume.insertEducation",educationMap);
	}

	@Override
	public int insertPortFolio(Map<String, Object> portFolioMap) {
		return sqlSession.insert("resume.insertPortFolio",portFolioMap);
	}
}
