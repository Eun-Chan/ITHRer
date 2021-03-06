package com.spring.ithrer.resume.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.resume.model.dao.ResumeDao;
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
import com.spring.ithrer.user.model.vo.Member;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	
	ResumeDao resumeDao;

	@Override
	public List<Map<String, String>> certificateList(String certname) {
		List<Map<String,String>> list = resumeDao.certificateList(certname);
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

//	@Override
//	public int insertPortFolio(Map<String, Object> portFolioMap) {
//		int result = resumeDao.insertPortFolio(portFolioMap);
//		return result;
//	}
	
	@Override
	public Award awardView(String memberId) {
		Award award = resumeDao.awardView(memberId);
		return award;
	}

	@Override
	public Career careerView(String memberId) {
		Career career = resumeDao.careerView(memberId);
		return career;
	}

	@Override
	public Certification certificateView(String memberId) {
		Certification certification = resumeDao.certificateView(memberId);
		return certification;
	}

	@Override
	public Hopework hopeworkView(String memberId) {
		Hopework hopework = resumeDao.hopeworkView(memberId);
		return hopework;
	}

	@Override
	public Intern internView(String memberId) {
		Intern intern = resumeDao.internView(memberId);
		return intern;
	}

	@Override
	public Language languageView(String memberId) {
		Language language = resumeDao.languageView(memberId);
		return language;
	}

	@Override
	public Learn learnView(String memberId) {
		Learn learn = resumeDao.learnView(memberId);
		return learn;
	}

	@Override
	public Overseas overseasView(String memberId) {
		Overseas overseas = resumeDao.overseasView(memberId);
		return overseas;
	}

//	@Override
//	public PortFolio portFolioView(String memberId) {
//		PortFolio portFolio = resumeDao.portFolioView(memberId);
//		return portFolio;
//	}

	@Override
	public Preference preferenceView(String memberId) {
		Preference preference = resumeDao.preferenceView(memberId);
		return preference;
	}

	@Override
	public Profile profileView(String memberId) {
		Profile profile = resumeDao.profileView(memberId);
		return profile;
	}

	@Override
	public Education educationView(String memberId) {
		Education education = resumeDao.educationView(memberId);
		return education;
	}
	
	@Override
	public int insertLetter(Map<String, Object> letterMap) {
		int result = resumeDao.insertLetter(letterMap);
		return result;
	}

	@Override
	public Letter letterView(String memberId) {
		Letter letter = resumeDao.letterView(memberId);
		return letter;
	}

	@Override
	public int proUpdate(Map<String, Object> profileMap) {
		int result = resumeDao.proUpdate(profileMap);
		return result;
	}

	@Override
	public int awardUpdate(Map<String, Object> awardMap) {
		int result = resumeDao.awardUpdate(awardMap);
		return result;
	}

	@Override
	public int careerUpdate(Map<String, Object> careerMap) {
		int result = resumeDao.careerUpdate(careerMap);
		return result;
	}

	@Override
	public int certificateUpdate(Map<String, Object> certificateMap) {
		int result = resumeDao.certificateUpdate(certificateMap);
		return result;
	}

	@Override
	public int hopeworkUpdate(Map<String, Object> hopeworkMap) {
		int result = resumeDao.hopeworkUpdate(hopeworkMap);
		return result;
	}

	@Override
	public int internUpdate(Map<String, Object> internMap) {
		int result = resumeDao.internUpdate(internMap);
		return result;
	}

	@Override
	public int languageUpdate(Map<String, Object> languageMap) {
		int result = resumeDao.languageUpdate(languageMap);
		return result;
	}

	@Override
	public int learnUpdate(Map<String, Object> learnMap) {
		int result = resumeDao.learnUpdate(learnMap);
		return result;
	}

	@Override
	public int overseasUpdate(Map<String, Object> overseasMap) {
		int result = resumeDao.overseasUpdate(overseasMap);
		return result;
	}

	@Override
	public int preferenceUpdate(Map<String, Object> preferenceMap) {
		int result = resumeDao.preferenceUpdate(preferenceMap);
		return result;
	}

	@Override
	public int educationUpdate(Map<String, Object> educationMap) {
		int result = resumeDao.educationUpdate(educationMap);
		return result;
	}

	@Override
	public int letterUpdate(Map<String, Object> letterMap) {
		int result = resumeDao.letterUpdate(letterMap);
		return result;
	}

	@Override
	public int updateMember(Map<String, Object> profileMap) {
		int result = resumeDao.updateMember(profileMap);
		return result;
	}
}