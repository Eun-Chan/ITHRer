package com.spring.ithrer.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.company.model.service.CompanyService;
import com.spring.ithrer.company.model.vo.Area;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Computerabllity;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Job;
import com.spring.ithrer.company.model.vo.Location;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.company.model.vo.Sales;
import com.spring.ithrer.company.model.vo.SubwayStation;
import com.spring.ithrer.resume.model.service.ResumeService;
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

@RestController
@RequestMapping("/company")
@SessionAttributes("companyLoggedIn")
public class CompanyController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyService companyService;
	@Autowired
	ResumeService resumeService;
	
	@GetMapping("/info.ithrer")
	public ModelAndView info(@RequestParam("compId") String compId, ModelAndView mav) {
		
		// 회사, 인사담당자, 매출액 정보 가져오기
		Map<String, Object> companyMap = companyService.selectCompanyMap(compId);
		
		
		mav.addObject("companyMap",companyMap);
		
		mav.setViewName("company/companyInfo");
		
		return mav;
	}
	
	@DeleteMapping("/hrManager")
	public Map<String, Object> deleteHrManager(@RequestParam("no") int no, @RequestParam("compId") String compId){
		return companyService.deleteHrManager(no, compId);
	}
	
	@PostMapping("/hrManager")
	public Map<String, Object> insertHrManager(HRManager hrManager){
		return companyService.insertHrManager(hrManager);
	}
	
	@PutMapping("/hrManager")
	public Map<String, Object> updateHrManager(HRManager hrManager){
		logger.debug(""+hrManager);
		return companyService.updateHrManager(hrManager);
	}
	
	@PutMapping("/info")
	public Map<String, Object> updateCompany(Company company){
		logger.debug(""+company);
		return companyService.updateCompany(company);
	}
	
	@GetMapping("/info")
	public Map<String, Object> selectCompanyMap(@RequestParam("compId") String compId){
		return companyService.selectCompanyMap(compId);
	}
	
	@PutMapping("/sales")
	public Map<String, Object> updateSales(Sales sales){
		logger.debug(""+sales);
		return companyService.updateSales(sales);
	}
	
	@PostMapping("/sales")
	public Map<String, Object> insertSales(Sales sales){
		return companyService.insertSales(sales);
	}
	
	@DeleteMapping("/sales")
	public Map<String, Object> deleteSales(Sales sales){
		return companyService.deleteSales(sales);
	}
	
	@PostMapping("/location")
	public Map<String, Object> insertLocation(Location location){
		logger.debug(""+location);
		return companyService.insertLocation(location);
	}
	
	@DeleteMapping("/location")
	public Map<String, Object> deleteLocation(Location location){
		logger.debug(""+location);
		return companyService.deleteLocation(location);
	}
	
	@PutMapping("/location")
	public Map<String, Object> updateLocation(Location location){
		logger.debug(""+location);
		return companyService.updateLocation(location);
	}
	
	@GetMapping("/index.ithrer")
	public ModelAndView index(@RequestParam("compId") String compId, ModelAndView mav, HttpServletRequest req) {
		
		// 쿠키가져와서 멤버가져오기
		// 쿠키 관련
		// 오늘 본 지원자 쿠키 생성
		// 쿠키를 이용하여 상세보기한 지원자 추가
		Cookie[] cookies = req.getCookies();
		String applicantCookieVal = "";
		String applicantCookieStr = compId + "|applicantCookie";
		
		
		// Cookie객체는 반드시 null여부 검사 후 진행
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName(); // key와 동일
				String value = c.getValue();
				
				// applicantCookie인 경우
				if(applicantCookieStr.equals(name)) {
					applicantCookieVal = value;
				}
			}
		}
		
		// 회사, 인사담당자, 매출액 정보 가져오기
		Map<String, Object> companyMap = companyService.selectCompanyMap(compId);
		
		// 채용정보 가져오기
		List<Recruitment> rcrtList = companyService.selectRcrtList(compId);
		
		// 쿠키에서 오늘 본 지원자 아이디 가져와서 리스트 가져오기
		// 홀수 인덱스에 아이디가 담김
		String[] splitStr = applicantCookieVal.split("\\|");
		
		List<Profile> readAppList = new ArrayList<>();
		for(int i=0; i<splitStr.length; i++) {
			if(i%2 == 0) continue;
			
			Map<String,Object> map2 = new HashMap<>();
			map2.put("memberId", splitStr[i]);
			map2.put("compId", compId);
			Profile member = companyService.selectApplicant(map2);
			readAppList.add(member);
		}
		
		// 관심인재 리스트 가져오기
		List<Favorites> favoriteAppList = companyService.selectFavoriteAppList(compId);
		
		// 마감된 채용공고 리스트 가져오기
		List<Recruitment> rcrtEndList = companyService.selectRcrtEndList(compId);
		logger.debug("레드"+readAppList);
		for(int i=0; i<readAppList.size(); i++) {
			if(readAppList.get(i).getCareer() != null && readAppList.get(i).getCareer().getHireddate() != null && readAppList.get(i).getCareer().getRetireddate() != null) {
				
				// 총 경력 계산
				String[] hireddateArr = readAppList.get(i).getCareer().getHireddate().split(",");
				String[] retireddateArr = readAppList.get(i).getCareer().getRetireddate().split(",");
				
				String workingPeriod = "";
				int intWorkingPeriod = 0;
				for(int j=0; j<hireddateArr.length; j++) {
					String[] hiredDate = hireddateArr[j].split("\\.");
					Calendar hiredDateCal = new GregorianCalendar();
					hiredDateCal.set(Integer.parseInt(hiredDate[0]),Integer.parseInt(hiredDate[1]),1,0,0,0);
					
					String[] retiredDate = retireddateArr[j].split("\\.");
					Calendar retiredDateCal = new GregorianCalendar();
					retiredDateCal.set(Integer.parseInt(retiredDate[0]),Integer.parseInt(retiredDate[1]),1,0,0,0);
					
					Calendar result = Calendar.getInstance();
					result.setTimeInMillis(retiredDateCal.getTimeInMillis()-hiredDateCal.getTimeInMillis());
					
					intWorkingPeriod += (int)(result.getTimeInMillis()/1000/60/60/24/30);
					logger.debug(j+"커리어"+intWorkingPeriod);
					logger.debug(j+"커리어"+(int)result.getTimeInMillis());
				}
				if(intWorkingPeriod >= 12) {
					int year = intWorkingPeriod/12;
					int month = intWorkingPeriod%12;
					workingPeriod = year+"년 "+month+"개월";
				}
				else {
					workingPeriod = intWorkingPeriod+"개월";
				}
				readAppList.get(i).getCareer().setWorkingPeriod(workingPeriod);
				
			}
			
		}
		
		for(int i=0; i<favoriteAppList.size(); i++) {
			if(favoriteAppList.get(i).getCareer() != null && favoriteAppList.get(i).getCareer().getHireddate() != null && favoriteAppList.get(i).getCareer().getRetireddate() != null) {
				
				// 총 경력 계산
				String[] hireddateArr = favoriteAppList.get(i).getCareer().getHireddate().split(",");
				String[] retireddateArr = favoriteAppList.get(i).getCareer().getRetireddate().split(",");
				
				String workingPeriod = "";
				int intWorkingPeriod = 0;
				for(int j=0; j<hireddateArr.length; j++) {
					String[] hiredDate = hireddateArr[j].split("\\.");
					Calendar hiredDateCal = new GregorianCalendar();
					hiredDateCal.set(Integer.parseInt(hiredDate[0]),Integer.parseInt(hiredDate[1]),1,0,0,0);
					
					String[] retiredDate = retireddateArr[j].split("\\.");
					Calendar retiredDateCal = new GregorianCalendar();
					retiredDateCal.set(Integer.parseInt(retiredDate[0]),Integer.parseInt(retiredDate[1]),1,0,0,0);
					
					Calendar result = Calendar.getInstance();
					result.setTimeInMillis(retiredDateCal.getTimeInMillis()-hiredDateCal.getTimeInMillis());
					
					intWorkingPeriod += (int)(result.getTimeInMillis()/1000/60/60/24/30);
					logger.debug(j+"커리어"+intWorkingPeriod);
					logger.debug(j+"커리어"+(int)result.getTimeInMillis());
				}
				if(intWorkingPeriod >= 12) {
					int year = intWorkingPeriod/12;
					int month = intWorkingPeriod%12;
					workingPeriod = year+"년 "+month+"개월";
				}
				else {
					workingPeriod = intWorkingPeriod+"개월";
				}
				favoriteAppList.get(i).getCareer().setWorkingPeriod(workingPeriod);
				
			}
			
		}
		
		
		
		mav.addObject("companyMap",companyMap);
		mav.addObject("rcrtList",rcrtList);
		mav.addObject("rcrtEndList",rcrtEndList);
		mav.addObject("readAppList",readAppList);
		mav.addObject("favoriteAppList",favoriteAppList);
		
		mav.setViewName("company/companyIndex");
		
		return mav;
	}
	
	@RequestMapping("/logout.ithrer")
	public ModelAndView logout(ModelAndView mav, SessionStatus sessionStatus) {
		
		sessionStatus.setComplete();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@RequestMapping("/viewApplicant.ithrer")
	public ModelAndView viewApplicant(ModelAndView mav, @RequestParam("compId") String compId, @RequestParam("recruitmentNo") int recruitmentNo, @RequestParam("memberId") String memberId
									, HttpServletRequest req, HttpServletResponse res) {
		
		// 쿠키 관련
		// 오늘 본 지원자 쿠키 생성
		// 쿠키를 이용하여 상세보기한 지원자 추가
		Cookie[] cookies = req.getCookies();
		String applicantCookieVal = "";
		boolean hasRead = false;
		String applicantCookieStr = compId + "|applicantCookie";
		
		// 쿠키만료시간 자정으로 만들기
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);
		
		Calendar midnight = new GregorianCalendar();
		midnight.set(year,month,day+1,0,0,0);
		
		// 현재 ~ 다음날 자정까지 남은 시간 계산
		Calendar result = Calendar.getInstance();
		result.setTimeInMillis(midnight.getTimeInMillis()-now.getTimeInMillis());
		
		// 쿠키만료 시간 설정을 위하여 초단위로 만들기
		int remainTime = (int)result.getTimeInMillis()/1000;
		
		// Cookie객체는 반드시 null여부 검사 후 진행
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName(); // key와 동일
				String value = c.getValue();
				
				// applicantCookie인 경우
				if(applicantCookieStr.equals(name)) {
					applicantCookieVal = value;
					if(value.contains("|" + memberId + "|")) {
						hasRead = true;
						break;
					}
				}
			}
		}
		
		// 읽음여부에 따라 분기
		if(!hasRead) {
			// 쿠키를 새로 생성 : 오늘 본 지원자에 추가
			// 한 컴퓨터에서 여러 기업아이디를 사용할 수도 있으므로(극히 드물겠지만) cookie의 name값에 기업아이디 추가
			Cookie applicantCookie = new Cookie(compId+"|applicantCookie", applicantCookieVal + "|" + memberId + "|");
			applicantCookie.setMaxAge(remainTime); // -> 생략하면 영속 설정. 단위: 초
			applicantCookie.setPath("/"); // -> 생략하면 자동으로 현재 디렉토리 기준(/company)으로 설정됨
			res.addCookie(applicantCookie);
		}
		
		// 임시 회원 가져오기
		Map<String, Object> map = new HashMap<>();
		
		map.put("recruitmentNo", recruitmentNo);
		map.put("memberId", memberId);
		map.put("compId", compId);

		//Member profile = companyService.selectApplicant(map); 
		
		// 이력서 가져오기
		Education education = resumeService.educationView(memberId);
		Profile profile = companyService.selectApplicant(map);
	    Award award = resumeService.awardView(memberId);
	    Career career = resumeService.careerView(memberId);
	    Certification certification = resumeService.certificateView(memberId);
	    Hopework hopework = resumeService.hopeworkView(memberId);
	    Intern intern = resumeService.internView(memberId);
	    Language language = resumeService.languageView(memberId);
	    Learn learn = resumeService.learnView(memberId);
	    Overseas overseas = resumeService.overseasView(memberId);
//	    PortFolio portFolio = resumeService.portFolioView(memberId);
	    Preference preference = resumeService.preferenceView(memberId);
	    Letter letter = resumeService.letterView(memberId);
	    
	    // 지원자 read = Y 로 바꾸기
	    companyService.updateCARead(map);

	    
	    if(career != null) {
			
			// 총 경력 계산
			String[] hireddateArr = career.getHireddateArr();
			String[] retireddateArr = career.getRetireddateArr();
			
			String workingPeriod = "";
			int intWorkingPeriod = 0;
			for(int j=0; j<hireddateArr.length; j++) {
				String[] hiredDate = hireddateArr[j].split("\\.");
				Calendar hiredDateCal = new GregorianCalendar();
				hiredDateCal.set(Integer.parseInt(hiredDate[0]),Integer.parseInt(hiredDate[1]),1,0,0,0);
				
				String[] retiredDate = retireddateArr[j].split("\\.");
				Calendar retiredDateCal = new GregorianCalendar();
				retiredDateCal.set(Integer.parseInt(retiredDate[0]),Integer.parseInt(retiredDate[1]),1,0,0,0);
				
				Calendar result2 = Calendar.getInstance();
				result2.setTimeInMillis(retiredDateCal.getTimeInMillis()-hiredDateCal.getTimeInMillis());
				
				intWorkingPeriod += (int)(result2.getTimeInMillis()/1000/60/60/24/30);
				logger.debug(j+"커리어"+intWorkingPeriod);
				logger.debug(j+"커리어"+(int)result2.getTimeInMillis());
			}
			if(intWorkingPeriod >= 12) {
				int year2 = intWorkingPeriod/12;
				int month2 = intWorkingPeriod%12;
				workingPeriod = year2+"년 "+month2+"개월";
			}
			else {
				workingPeriod = intWorkingPeriod+"개월";
			}
			career.setWorkingPeriod(workingPeriod);
			logger.debug("워킹피리오드"+workingPeriod);
		}
	    
	    mav.addObject("profile",profile);
	    //mav.addObject("profile",profile);
	    mav.addObject("award",award);
	    mav.addObject("career",career);
	    mav.addObject("certification",certification);
	    mav.addObject("hopework",hopework);
	    mav.addObject("intern",intern);
	    mav.addObject("language",language);
	    mav.addObject("learn",learn);
	    mav.addObject("overseas",overseas);
//	    mav.addObject("portFolio",portFolio);
	    mav.addObject("preference",preference);
	    mav.addObject("education",education);
	    mav.addObject("letter",letter);
		
	    mav.addObject("recruitmentNo",recruitmentNo);
		
		mav.setViewName("company/viewApplicant");
		
		return mav;
	}
	
	@GetMapping("/recruitmentAdd")
	public ModelAndView recruitmentAddView(ModelAndView mav) {
		mav.setViewName("company/recruitmentAdd");
		
		return mav;
	}
	
	@DeleteMapping("/favorite")
	public Map<String, Object> deleteFavorite(@RequestParam("compId") String compId
			, @RequestParam("memberId") String memberId
			, @RequestParam(value="recruitmentNo",required=false,defaultValue="0") int recruitmentNo) {
		
		logger.debug("audgns"+compId);
		logger.debug(memberId);
		logger.debug(""+recruitmentNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("compId", compId);
		map.put("memberId", memberId);
		map.put("recruitmentNo", recruitmentNo);
		
		int result = companyService.deleteFavorite(map);
		
		Map<String, Object> map2 = new HashMap<>();
		
		if(result > 0) {
			map2.put("newCount",0);
			// 관심인재 리스트 가져오기
			List<Favorites> favoriteAppList = companyService.selectFavoriteAppList(compId);
			map2.put("favoriteAppList",favoriteAppList);
		}
		else {
			map2.put("newCount",1);
		}
		
		return map2;
	}
	
	@PostMapping("/favorite")
	public Map<String, Object> insertFavorite(@RequestParam(value="compId") String compId
			, @RequestParam("memberId") String memberId
			, @RequestParam(value="recruitmentNo",required=false,defaultValue="0") int recruitmentNo) {
		
		logger.debug("audgns"+compId);
		logger.debug(memberId);
		logger.debug(""+recruitmentNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("compId", compId);
		map.put("memberId", memberId);
		map.put("recruitmentNo", recruitmentNo);
		
		int result = companyService.insertFavorite(map);
		
		Map<String, Object> map2 = new HashMap<>();
		
		if(result > 0) {
			map2.put("newCount",1);
			// 관심인재 리스트 가져오기
			List<Favorites> favoriteAppList = companyService.selectFavoriteAppList(compId);
			map2.put("favoriteAppList",favoriteAppList);
		}
		else {
			map2.put("newCount",0);
		}
		
		return map2;
	}

	/**
	 * @박광준
	 * 채용공고등록 - 페이지 로드 시 필요한 데이터 로드
	 */
	@GetMapping("/recruitmentAddLoad.ithrer")
	@ResponseBody
	public void recruitmentAddLoad(HttpServletResponse response) {
		logger.debug("채용공고등록 페이지에 필요한 정보를 로드합니다.");
		
		//최종 정보
		List<Object> resultList = new ArrayList<>();
		
		//모집직종 정보-JOB1
		List<Job> jobList = new ArrayList<>();
		jobList = companyService.selectJobList();
		
		//모집직종 정보-JOB2
		List<Job> jobList2 = new ArrayList<>();
		jobList2 = companyService.selectJobList2();
		
		//컴퓨터활용능력-1
		List<Computerabllity> computerAbllityList = new ArrayList<>();
		computerAbllityList = companyService.selectComputerAbllity();
		
		//컴퓨터활용능력-1
		List<Computerabllity> computerAbllityList2 = new ArrayList<>();
		computerAbllityList2 = companyService.selectComputerAbllity2();
		
		//지하철노선도-라인
		List<SubwayStation> subwayStationLine = new ArrayList<>();
		subwayStationLine = companyService.selectSubwayStation();
		
		//지하철노선도-전체
		List<SubwayStation> subwayStationAll = new ArrayList<>();
		subwayStationAll = companyService.selectSubwayStationAll();
		
		//최종 정보 담기
		resultList.add(jobList);
		resultList.add(jobList2);
		resultList.add(computerAbllityList);
		resultList.add(computerAbllityList2);
		resultList.add(subwayStationLine);
		resultList.add(subwayStationAll);
		/* resultList.add(positionList); */
		
		try {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(resultList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @박광준
	 * 테스트용
	 */
	@RequestMapping("/testSend")
	public ModelAndView test(ModelAndView mav,
					 @RequestParam(defaultValue="", value="recruitmentTitle") String recruitmentTitle,
					 @RequestParam(defaultValue="", value="typeOfOccupation") String typeOfOccupation,
					 @RequestParam(defaultValue="", value="career") String career,
					 @RequestParam(defaultValue="", value="employment_type") String employment_type,
					 @RequestParam(defaultValue="0", value="recruitmentPersonnel") int recruitmentPersonnel,
					 @RequestParam(defaultValue="", value="asignedTask") String asignedTask,
					 @RequestParam(defaultValue="", value="resultDepartment") String resultDepartment,
					 @RequestParam(defaultValue="", value="jobGrade") String jobGrade,
					 @RequestParam(defaultValue="", value="education") String education,
					 @RequestParam(defaultValue="", value="major") String major,
					 @RequestParam(defaultValue="", value="foreLang") String foreLang,
					 @RequestParam(defaultValue="", value="certificate") String certificate,
					 @RequestParam(defaultValue="", value="computerLiteracy") String computerLiteracy,
					 @RequestParam(defaultValue="", value="employmentPreference") String employmentPreference,
					 @RequestParam(defaultValue="", value="applicantAge") String applicantAge,
					 @RequestParam(defaultValue="", value="genderCut") String genderCut,
					 @RequestParam(defaultValue="", value="etcQualificationRequirement") String etcQualificationRequirement,
					 @RequestParam(defaultValue="", value="nearbyStation") String nearbyStation,
					 @RequestParam(defaultValue="", value="payCondition") String payCondition,
					 @RequestParam(defaultValue="", value="salaryType") String salaryType,
					 @RequestParam(defaultValue="", value="welfare") String welfare,
					 @RequestParam(defaultValue="SYSDATE", value="openingDate") String openingDate,
					 @RequestParam(defaultValue="SYSDATE", value="closingDate") String closingDate,
					 @RequestParam(defaultValue="", value="applicationMethod") String applicationMethod,
					 @RequestParam(defaultValue="", value="applicationForm") String applicationForm,
					 @RequestParam(defaultValue="", value="recruitmentStage") String recruitmentStage,
					 @RequestParam(defaultValue="", value="summernoteHtml") String summernoteHtml,
					 @RequestParam(defaultValue="", value="workDay") String workDay,
					 @RequestParam(defaultValue="", value="compId") String compId,
					 @RequestParam(defaultValue="", value="locationCode") String locationCode,
					 @RequestParam(defaultValue="", value="location") String location)
	{
		/*frm1*/
		String result_recruitmentTitle = recruitmentTitle;
		String result_typeOfOccupation = typeOfOccupation.replaceAll("\\p{Z}", "");
		String result_career = career.replaceAll("\\p{Z}", "");
		String result_employmentType = employment_type.replaceAll("\\p{Z}", "");
		int result_recruitmentPersonnel = recruitmentPersonnel;
		String result_asignedTask = asignedTask;
		String result_department = resultDepartment;
		String result_position = jobGrade.replaceAll("\\p{Z}", "");
		
		/*frm2*/
		String result_education = education;
		String result_major = major.replaceAll("\\p{Z}", "");
		String result_foreLang = foreLang.replaceAll("\\p{Z}", "");
		String result_certificate = certificate;
		String result_computerLiteracy = computerLiteracy.replaceAll("\\p{Z}", "");
		String result_employmentPreference = employmentPreference.replaceAll("\\p{Z}", "");
		String result_applicantAge = applicantAge.replaceAll("\\p{Z}", "");
		String[] resultAge = result_applicantAge.split("/");
		
		
		String result_genderCut = genderCut;
		String result_etcQualificationRequirement = etcQualificationRequirement;
		
		Recruitment rect = new Recruitment();
		rect.setRecruitmentTitle(result_recruitmentTitle);
		rect.setTypeOfOccupation(result_typeOfOccupation);
		rect.setCareer(result_career);
		rect.setEmploymentType(result_employmentType);
		rect.setRecruitmentPersonnel(result_recruitmentPersonnel);
		rect.setAsignedTask(result_asignedTask);
		rect.setDepartment(result_department);
		rect.setPosition(result_position);
		if("연령제한".equals(resultAge[0]))
		{
			rect.setApplicantAgeStart(Integer.parseInt(resultAge[1]));
			rect.setApplicantAgeEnd(Integer.parseInt(resultAge[2]));
		}
		else //연령제한이 아닐 경우
		{
			rect.setApplicantAgeStart(0);
			rect.setApplicantAgeEnd(100);
		}
		
		/* frm2 */
		rect.setEducation(result_education);
		rect.setMajor(result_major);
		rect.setForeLang(result_foreLang);
		rect.setCertificate(result_certificate);
		rect.setComputerLiteracy(result_computerLiteracy);
		rect.setEmploymentPreference(result_employmentPreference);
		if(result_genderCut.equals("무관")) result_genderCut = " ";
		else if(result_genderCut.equals("남자")) result_genderCut = "M";
		else if(result_genderCut.equals("여자")) result_genderCut = "F";
		System.out.println("넣고있는 성별값 : " + result_genderCut);
		rect.setGenderCut(result_genderCut);
		rect.setEtcQualificationRequirement(result_etcQualificationRequirement);
		
		/* frm3 */
		nearbyStation.replace("- ", "/");
		rect.setLocation(location);
		rect.setLocationCode(locationCode);
		rect.setNearbyStation(nearbyStation);
		rect.setSalaryType(salaryType);
		rect.setPayCondition(payCondition+"만원");
		rect.setWelfare(welfare.replaceAll("\\p{Z}", ""));
		rect.setWorkDay(workDay);

		/* frm4 */
		rect.setOpeningDate(openingDate);
		rect.setClosingDate(closingDate);
		rect.setApplicationMethod(applicationMethod);
		rect.setApplicationForm(applicationForm);
		rect.setRecruitmentStage(recruitmentStage);
		rect.setSummernoteHtml(summernoteHtml.replaceAll("'", "\'"));
		
		/* frm5 */
		rect.setCompId(compId);
		
		int insertResult = companyService.insertRecruitment(rect);
		System.out.println("rect:"+rect);
		System.out.println(insertResult);
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@GetMapping("/viewApplicantList.ithrer")
	public ModelAndView viewApplicantList(ModelAndView mav, @RequestParam("recruitmentNo") int recruitmentNo, @RequestParam("compId") String compId){
		
		// 채용공고번호로 지원자 리스트 가져오기
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("recruitmentNo", recruitmentNo);
		paramMap.put("compId", compId);
		List<Profile> applicantList = companyService.selectAppList(recruitmentNo);
		
		logger.debug("지원자 리스트 | "+applicantList);
		
		for(int i=0; i<applicantList.size(); i++) {
			if(applicantList.get(i).getEducation() != null) {
				
				// 최종 학교이름 추출
				if(applicantList.get(i).getEducation().getSchoolname() != null) {
					String[] schoolName = applicantList.get(i).getEducation().getSchoolname().split(",");
					applicantList.get(i).getEducation().setSchoolname(schoolName[schoolName.length-1]);
				}
				
				// 최종 학점 추출
				if(applicantList.get(i).getEducation().getScore() != null) {
					String[] score = applicantList.get(i).getEducation().getScore().split(",");
					applicantList.get(i).getEducation().setScore(score[score.length-1]);
				}
				
				// 최종 학점 만점 추출
				if(applicantList.get(i).getEducation().getTotalscore() != null) {
					String[] totalScore = applicantList.get(i).getEducation().getTotalscore().split(",");
					applicantList.get(i).getEducation().setTotalscore(totalScore[totalScore.length-1]);
				}
			}
			if(applicantList.get(i).getCareer() != null && applicantList.get(i).getCareer().getHireddate() != null && applicantList.get(i).getCareer().getRetireddate() != null) {
				
				// 총 경력 계산
				String[] hireddateArr = applicantList.get(i).getCareer().getHireddate().split(",");
				String[] retireddateArr = applicantList.get(i).getCareer().getRetireddate().split(",");
				
				String workingPeriod = "";
				int intWorkingPeriod = 0;
				for(int j=0; j<hireddateArr.length; j++) {
					String[] hiredDate = hireddateArr[j].split("\\.");
					Calendar hiredDateCal = new GregorianCalendar();
					hiredDateCal.set(Integer.parseInt(hiredDate[0]),Integer.parseInt(hiredDate[1]),1,0,0,0);
					
					String[] retiredDate = retireddateArr[j].split("\\.");
					Calendar retiredDateCal = new GregorianCalendar();
					retiredDateCal.set(Integer.parseInt(retiredDate[0]),Integer.parseInt(retiredDate[1]),1,0,0,0);
					
					Calendar result = Calendar.getInstance();
					result.setTimeInMillis(retiredDateCal.getTimeInMillis()-hiredDateCal.getTimeInMillis());
					
					intWorkingPeriod += (int)(result.getTimeInMillis()/1000/60/60/24/30);
					logger.debug(j+"커리어"+intWorkingPeriod);
					logger.debug(j+"커리어"+(int)result.getTimeInMillis());
				}
				if(intWorkingPeriod >= 12) {
					int year = intWorkingPeriod/12;
					int month = intWorkingPeriod%12;
					workingPeriod = year+"년 "+month+"개월";
				}
				else {
					workingPeriod = intWorkingPeriod+"개월";
				}
				applicantList.get(i).getCareer().setWorkingPeriod(workingPeriod);
				
			}
			
			
		}
		
		
		// 해당 채용공고 가져오기
		Recruitment recruitment = companyService.selectRecruitmentOne(recruitmentNo);
		// 해당 채용공고를 제외한 마감되지 않은 채용공고리스트 가져오기
		List<Recruitment> rcrtList = companyService.selectRcrtListNotThis(paramMap);
		
		logger.debug("recruitment | "+recruitment);
		logger.debug("rcrtList | "+rcrtList);
		
		mav.addObject("applicantList",applicantList);
		logger.debug("앱"+applicantList);
		mav.addObject("recruitment",recruitment);
		mav.addObject("rcrtList",rcrtList);
		
		mav.setViewName("company/viewApplicantList");
		return mav;
	}
	
	@PutMapping("/rcrtEnd")
	public Map<String,Object> updateRcrtEnd(@RequestParam("recruitmentNo") int recruitmentNo, @RequestParam("compId") String compId) {
		Map<String,Object> map = new HashMap<>();
		
		int result = companyService.updateRcrtEnd(recruitmentNo);
		
		String resultStr = "";
		
		if(result > 0) {
			resultStr = "마감 성공!";
			// 채용정보 가져오기
			List<Recruitment> rcrtList = companyService.selectRcrtList(compId);
			// 마감된 채용공고 리스트 가져오기
			List<Recruitment> rcrtEndList = companyService.selectRcrtEndList(compId);
			
			map.put("rcrtList",rcrtList);
			map.put("rcrtEndList",rcrtEndList);
			map.put("recruitmentNo",recruitmentNo);
		}
		else {
			resultStr = "마감 실패!";
		}
		
		map.put("result", resultStr);
		
		return map;
	}
	
	/**
	 * @박광준
	 * 채용공고등록 - 페이지 로드 시 필요한 데이터 로드 (지역코드 정보)
	 */
	@GetMapping("/recruitmentLoadLocation.ithrer")
	@ResponseBody
	public void recruitmentLoadLocation(HttpServletResponse response, HttpServletRequest request) {
		logger.debug("채용공고등록 페이지에 필요한 정보를 로드합니다. - 지역코드");
		int param = Integer.parseInt(request.getParameter("targetLocation"));
		List<Area> locationList = companyService.selectLocationcodeList(param);
		
		try {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(locationList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @박광준
	 * 채용공고 - 수정버튼 클릭 시 페이지 연결 (페이지 정보 로드)
	 */
	@RequestMapping("/joinRecruitment")
	@ResponseBody
	public ModelAndView joinRecruitment(@RequestParam("no") int no, ModelAndView mav) {
		Recruitment loadRecruitmentInfo = companyService.joinRecruitment(no);
		mav.addObject("rect",loadRecruitmentInfo);
		mav.setViewName("company/recruitmentUpdate");
		return mav;
	}
	
	/**
	 * @박광준
	 * 채용공고 Update
	 */
	@RequestMapping("/updateSend")
	public ModelAndView updateSend(ModelAndView mav,
			 @RequestParam(defaultValue="", value="recruitmentTitle") String recruitmentTitle,
			 @RequestParam(defaultValue="", value="typeOfOccupation") String typeOfOccupation,
			 @RequestParam(defaultValue="", value="career") String career,
			 @RequestParam(defaultValue="", value="employment_type") String employmentType,
			 @RequestParam(defaultValue="0", value="recruitmentPersonnel") int recruitmentPersonnel,
			 @RequestParam(defaultValue="", value="asignedTask") String asignedTask,
			 @RequestParam(defaultValue="", value="resultDepartment") String department,
			 @RequestParam(defaultValue="", value="jobGrade") String position,
			 @RequestParam(defaultValue="", value="education") String education,
			 @RequestParam(defaultValue="", value="major") String major,
			 @RequestParam(defaultValue="", value="foreLang") String foreLang,
			 @RequestParam(defaultValue="", value="certificate") String certificate,
			 @RequestParam(defaultValue="", value="computerLiteracy") String computerLiteracy,
			 @RequestParam(defaultValue="", value="employmentPreference") String employmentPreference,
			 @RequestParam(defaultValue="", value="applicantAge") String applicantAge,
			 @RequestParam(defaultValue="", value="genderCut") String genderCut,
			 @RequestParam(defaultValue="", value="etcQualificationRequirement") String etcQualificationRequirement,
			 @RequestParam(defaultValue="", value="nearbyStation") String nearbyStation,
			 @RequestParam(defaultValue="", value="payCondition") String payCondition,
			 @RequestParam(defaultValue="", value="salaryType") String salaryType,
			 @RequestParam(defaultValue="", value="welfare") String welfare,
			 @RequestParam(defaultValue="SYSDATE", value="openingDate") String openingDate,
			 @RequestParam(defaultValue="SYSDATE", value="closingDate") String closingDate,
			 @RequestParam(defaultValue="", value="applicationMethod") String applicationMethod,
			 @RequestParam(defaultValue="", value="applicationForm") String applicationForm,
			 @RequestParam(defaultValue="", value="recruitmentStage") String recruitmentStage,
			 @RequestParam(defaultValue="", value="summernoteHtml") String summernoteHtml,
			 @RequestParam(defaultValue="", value="workDay") String workDay,
			 @RequestParam(defaultValue="", value="compId") String compId,
			 @RequestParam(defaultValue="", value="locationCode") String locationCode,
			 @RequestParam(defaultValue="", value="location") String location,
			 @RequestParam(defaultValue="", value="recruitmentNo") int recruitmentNo) {
		
		Recruitment rect = new Recruitment();
		rect.setRecruitmentTitle(recruitmentTitle);
		rect.setTypeOfOccupation(typeOfOccupation.replaceAll("\\p{Z}", ""));
		rect.setCareer(career.replaceAll("\\p{Z}", ""));
		rect.setEmploymentType(employmentType.replaceAll("\\p{Z}", ""));
		rect.setRecruitmentPersonnel(recruitmentPersonnel);
		rect.setAsignedTask(asignedTask);
		rect.setDepartment(department);
		String result_position = position.replaceAll("\\p{Z}", "");
		rect.setPosition(result_position);
		rect.setEducation(education);
		rect.setMajor(major.replaceAll("\\p{Z}", ""));
		rect.setForeLang(foreLang.replaceAll("\\p{Z}", ""));
		rect.setCertificate(certificate);
		rect.setComputerLiteracy(computerLiteracy.replaceAll("\\p{Z}", ""));
		rect.setEmploymentPreference(employmentPreference.replaceAll("\\p{Z}", ""));
		String[] resultAge = applicantAge.split("/");
		if("연령제한".equals(resultAge[0]))
		{
			rect.setApplicantAgeStart(Integer.parseInt(resultAge[1]));
			rect.setApplicantAgeEnd(Integer.parseInt(resultAge[2]));
		}
		else //연령제한이 아닐 경우
		{
			rect.setApplicantAgeStart(0);
			rect.setApplicantAgeEnd(100);
		}
		if(genderCut.equals("무관")) genderCut = " ";
		else if(genderCut.equals("남자")) genderCut = "M";
		else if(genderCut.equals("여자")) genderCut = "F";
		rect.setGenderCut(genderCut);
		rect.setEtcQualificationRequirement(etcQualificationRequirement);
		rect.setNearbyStation(nearbyStation.replace("- ", "/"));
		rect.setPayCondition(payCondition+"만원");
		rect.setSalaryType(salaryType);
		rect.setWelfare(welfare.replaceAll("\\p{Z}", ""));
		rect.setOpeningDate(openingDate);
		rect.setClosingDate(closingDate);
		rect.setApplicationMethod(applicationMethod);
		rect.setApplicationForm(applicationForm);
		rect.setRecruitmentStage(recruitmentStage);
		rect.setSummernoteHtml(summernoteHtml.replaceAll("'", "\'"));
		rect.setWorkDay(workDay);
		rect.setCompId(compId);
		rect.setLocationCode(locationCode);
		rect.setLocation(location);
		rect.setRecruitmentNo(recruitmentNo);
		
		int result = companyService.updateRecruitment(rect);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+rect.getSummernoteHtml());
		mav.addObject("compId", compId);
		mav.setViewName("redirect:index.ithrer");
		
		return mav;
	}
	
}