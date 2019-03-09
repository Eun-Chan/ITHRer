package com.spring.ithrer.company.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Company selectCompanyOne(String compId) {
		return sqlSession.selectOne("company.selectCompanyOne",compId);
	}

	@Override
	public List<HRManager> selectHRManagerList(String compId) {
		return sqlSession.selectList("company.selectHRManagerList",compId);
	}

	@Override
	public List<Sales> selectSalesList(String compId) {
		return sqlSession.selectList("company.selectSalesList",compId);
	}

	@Override
	public int deleteHrManager(int no) {
		return sqlSession.delete("company.deleteHrManager",no);
	}

	@Override
	public int insertHrManager(HRManager hrManager) {
		return sqlSession.insert("company.insertHrManager",hrManager);
	}

	@Override
	public int updateHrManager(HRManager hrManager) {
		return sqlSession.update("company.updateHrManager",hrManager);
	}

	@Override
	public int updateCompany(Company company) {
		return sqlSession.update("company.updateCompany",company);
	}

	@Override
	public int updateSales(Sales sales) {
		return sqlSession.update("company.updateSales",sales);
	}

	@Override
	public int insertSales(Sales sales) {
		return sqlSession.insert("company.insertSales",sales);
	}

	@Override
	public int deleteSales(Sales sales) {
		return sqlSession.delete("company.deleteSales",sales);
	}

	@Override
	public List<Location> selectLocationList(String compId) {
		return sqlSession.selectList("company.selectLocationList",compId);
	}

	@Override
	public int insertLocation(Location location) {
		return sqlSession.insert("company.insertLocation",location);
	}

	@Override
	public int deleteLocation(Location location) {
		return sqlSession.delete("company.deleteLocation",location);
	}

	@Override
	public int updateLocation(Location location) {
		return sqlSession.update("company.updateLocation",location);
	}

	@Override
	public List<CompanyApplication> selectCompanyAppList(String compId) {
		return sqlSession.selectList("company.selectCompanyAppList",compId);
	}

	@Override
	public Member selectApplicant(Map<String, Object> map) {
		return sqlSession.selectOne("company.selectApplicant",map);
	}

	@Override
	public int deleteFavorite(Map<String, Object> map) {
		return sqlSession.delete("company.deleteFavorite",map);
	}

	@Override
	public int insertFavorite(Map<String, Object> map) {
		return sqlSession.insert("company.insertFavorite",map);
	}

	@Override
	public List<Favorites> selectFavoriteAppList(String compId) {
		return sqlSession.selectList("company.selectFavoriteAppList",compId);
	}

	@Override
	public List<Job> selectJobList() {
		return sqlSession.selectList("company.selectJobList");
	}

	@Override
	public List<Position> selectPositionList() {
		return sqlSession.selectList("company.selectPositionList");
	}

	@Override
	public List<Job> selectJobList2() {
		return sqlSession.selectList("company.selectJobList2");
	}

	@Override
	public List<Computerabllity> selectComputerAbllity() {
		return sqlSession.selectList("company.selectComputerAbllityList");
	}

	@Override
	public List<Computerabllity> selectComputerAbllity2() {
		return sqlSession.selectList("company.selectComputerAbllityList2");
	}

	@Override
	public int insertRecruitment(Recruitment rect) {
		return sqlSession.insert("company.insertRecruitment", rect);
	}

	@Override
	public List<SubwayStation> selectSubwayStation() {
		return sqlSession.selectList("company.selectSubwayStation");
	}

	@Override
	public List<SubwayStation> selectSubwayStationAll() {
		return sqlSession.selectList("company.selectSubwayStationAll");
	}


	public List<Recruitment> selectRcrtList(String compId) {
		return sqlSession.selectList("company.selectRcrtList",compId);
	}

	@Override
	public List<String> selectApplicantIdList(int recruitmentNo) {
		return sqlSession.selectList("company.selectApplicantIdList",recruitmentNo);
	}

	@Override
	public Member selectApplicantWithAllInfo(Map<String, Object> paramMap) {
		return sqlSession.selectOne("company.selectApplicantWithAllInfo",paramMap);
	}

	@Override
	public Recruitment selectRecruitmentOne(int recruitmentNo) {
		return sqlSession.selectOne("company.selectRecruitmentOne",recruitmentNo);
	}

	@Override
	public List<Recruitment> selectRcrtListNotThis(Map<String, Object> paramMap) {
		return sqlSession.selectList("company.selectRcrtListNotThis",paramMap);
	}

	@Override
	public List<Recruitment> selectRcrtEndList(String compId) {
		return sqlSession.selectList("company.selectRcrtEndList",compId);
	}

	@Override
	public int updateRcrtEnd(int recruitmentNo) {
		return sqlSession.update("company.updateRcrtEnd",recruitmentNo);
	}

	@Override
	public int updateCompanyLogo(Map<String,String> map) {
		return sqlSession.update("company.updateCompanyLogo",map);
	}

	@Override
	public List<Member> selectAppList(int recruitmentNo) {
		return sqlSession.selectList("company.selectAppList",recruitmentNo);
	}
	
	@Override
	public List<Area> selectLocationcodeList(int param) {
		return sqlSession.selectList("company.selectLocationcodeList",param);
	}

	@Override
	public Recruitment joinRecruitment(int no) {
		return sqlSession.selectOne("company.joinRecruitment", no);
	}

}
