package com.spring.ithrer.company.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.vo.Area;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Computerabllity;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Job;
import com.spring.ithrer.company.model.vo.Location;
import com.spring.ithrer.company.model.vo.Position;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.company.model.vo.Sales;
import com.spring.ithrer.company.model.vo.SubwayStation;
import com.spring.ithrer.resume.model.vo.Profile;
import com.spring.ithrer.user.model.vo.Member;

public interface CompanyService {

	Map<String, Object> selectCompanyMap(String compId);

	Map<String, Object> deleteHrManager(int no, String compId);

	int deleteHrManager(int no);

	Map<String, Object> insertHrManager(HRManager hrManager);

	Map<String, Object> updateHrManager(HRManager hrManager);

	Map<String, Object> updateCompany(Company company);

	Map<String, Object> updateSales(Sales sales);

	Map<String, Object> insertSales(Sales sales);

	Map<String, Object> deleteSales(Sales sales);

	Map<String, Object> insertLocation(Location location);

	Map<String, Object> deleteLocation(Location location);

	Map<String, Object> updateLocation(Location location);

	Company selectCompanyOne(String compId);

	Profile selectApplicant(Map<String, Object> map);

	int deleteFavorite(Map<String, Object> map);

	int insertFavorite(Map<String, Object> map);

	List<Favorites> selectFavoriteAppList(String compId);
	
	List<Job> selectJobList();

	List<Position> selectPositionList();

	List<Job> selectJobList2();

	List<Computerabllity> selectComputerAbllity();

	List<Computerabllity> selectComputerAbllity2();

	int insertRecruitment(Recruitment rect);

	List<SubwayStation> selectSubwayStation();

	List<SubwayStation> selectSubwayStationAll();

	List<Recruitment> selectRcrtList(String compId);

	List<Profile> selectAppList(int recruitmentNo);

	Recruitment selectRecruitmentOne(int recruitmentNo);

	List<Recruitment> selectRcrtListNotThis(Map<String, Object> paramMap);

	List<Recruitment> selectRcrtEndList(String compId);

	int updateRcrtEnd(int recruitmentNo);

	int updateCompanyLogo(String path, String compId);
	
	List<Area> selectLocationcodeList(int param);

	Recruitment joinRecruitment(int no);

	void updateCARead(Map<String, Object> map);

	int updateRecruitment(Recruitment rect);

}
