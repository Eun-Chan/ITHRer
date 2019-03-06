package com.spring.ithrer.company.model.dao;

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
import com.spring.ithrer.index.model.vo.CompanyApplication;
import com.spring.ithrer.user.model.vo.Member;

public interface CompanyDao {

	Company selectCompanyOne(String compId);

	List<HRManager> selectHRManagerList(String compId);

	List<Sales> selectSalesList(String compId);

	int deleteHrManager(int no);

	int insertHrManager(HRManager hrManager);

	int updateHrManager(HRManager hrManager);

	int updateCompany(Company company);

	int updateSales(Sales sales);

	int insertSales(Sales sales);

	int deleteSales(Sales sales);

	List<Location> selectLocationList(String compId);

	int insertLocation(Location location);

	int deleteLocation(Location location);

	int updateLocation(Location location);

	List<CompanyApplication> selectCompanyAppList(String compId);

	Member selectApplicant(Map<String, Object> map);

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

	List<String> selectApplicantIdList(int recruitmentNo);

	Member selectApplicantWithAllInfo(Map<String, Object> paramMap);

	Recruitment selectRecruitmentOne(int recruitmentNo);

	List<Recruitment> selectRcrtListNotThis(Map<String, Object> paramMap);

	List<Recruitment> selectRcrtEndList(String compId);

	int updateRcrtEnd(int recruitmentNo);

	int updateCompanyLogo(Map<String, String> map);

	List<Member> selectAppList(int recruitmentNo);
	
	List<Area> selectLocationcodeList(int param);

}
