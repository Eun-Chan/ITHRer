package com.spring.ithrer.resume.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.resume.model.vo.Award;
import com.spring.ithrer.resume.model.vo.Career;
import com.spring.ithrer.resume.model.vo.Certification;
import com.spring.ithrer.resume.model.vo.Education;
import com.spring.ithrer.resume.model.vo.Hopework;
import com.spring.ithrer.resume.model.vo.Intern;
import com.spring.ithrer.resume.model.vo.Language;
import com.spring.ithrer.resume.model.vo.Learn;
import com.spring.ithrer.resume.model.vo.Letter;
import com.spring.ithrer.resume.model.vo.Overseas;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Preference;
import com.spring.ithrer.resume.model.vo.Profile;

@Repository
public class ResumeDaoImpl implements ResumeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> certificateList(String certname) {
		return sqlSession.selectList("resume.certificateList",certname);
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

	@Override
	public Award awardView(String memberId) {
		return sqlSession.selectOne("resume.awardView",memberId);
	}

	@Override
	public Career careerView(String memberId) {
		return sqlSession.selectOne("resume.careerView",memberId);
	}

	@Override
	public Certification certificateView(String memberId) {
		return sqlSession.selectOne("resume.certificateView",memberId);
	}

	@Override
	public Hopework hopeworkView(String memberId) {
		return sqlSession.selectOne("resume.hopeworkView",memberId);
	}

	@Override
	public Intern internView(String memberId) {
		return sqlSession.selectOne("resume.internView",memberId);
	}

	@Override
	public Language languageView(String memberId) {
		return sqlSession.selectOne("resume.languageView",memberId);
	}

	@Override
	public Learn learnView(String memberId) {
		return sqlSession.selectOne("resume.learnView",memberId);
	}

	@Override
	public Overseas overseasView(String memberId) {
		return sqlSession.selectOne("resume.overseasView",memberId);
	}

	@Override
	public PortFolio portFolioView(String memberId) {
		return sqlSession.selectOne("resume.portFolioView",memberId);
	}

	@Override
	public Preference preferenceView(String memberId) {
		return sqlSession.selectOne("resume.preferenceView",memberId);
	}

	@Override
	public Profile profileView(String memberId) {
		return sqlSession.selectOne("resume.profileView",memberId);
	}

	@Override
	public Education educationView(String memberId) {
		return sqlSession.selectOne("resume.educationView",memberId);
	}

	@Override
	public int insertLetter(Map<String, Object> letterMap) {
		return sqlSession.insert("resume.insertLetter",letterMap);
	}

	@Override
	public Letter letterView(String memberId) {
		return sqlSession.selectOne("resume.letterView",memberId);
	} 

}
