package com.spring.ithrer.company.controller;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.company.model.service.CompanyService;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Location;
import com.spring.ithrer.company.model.vo.Sales;
import com.spring.ithrer.user.model.vo.Member;

@RestController
@RequestMapping("/company")
@SessionAttributes("company")
public class CompanyController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyService companyService;
	
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
		
		// 회사, 인사담당자, 매출액 정보 가져오기
		Map<String, Object> map = companyService.selectCompanyMap(compId);
		
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
		
		// 쿠키에서 오늘 본 지원자 아이디 가져오기
		// 홀수 인덱스에 아이디가 담김
		String[] splitStr = applicantCookieVal.split("\\|");
		
		List<Member> readApplicantList = new ArrayList<>();
		for(int i=0; i<splitStr.length; i++) {
			if(i%2 == 0) continue;
			
			Map<String,Object> map2 = new HashMap<>();
			map2.put("memberId", splitStr[i]);
			Member member = companyService.selectApplicant(map2);
			readApplicantList.add(member);
		}
		
		logger.debug(""+readApplicantList);
		
		mav.addObject("map",map);
		mav.addObject("readApplicantList",readApplicantList);
		
		mav.setViewName("company/companyIndex");
		
		return mav;
	}
	
	@RequestMapping("/login.ithrer")
	public ModelAndView login(ModelAndView mav) {
		
		// 회사 아이디 임시로 주기
		String compId = "audgnsdlsp";
		
		
		
		
		mav.addObject("company",companyService.selectCompanyOne(compId));
		
		
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@RequestMapping("/logout.ithrer")
	public ModelAndView logout(ModelAndView mav, SessionStatus sessionStatus) {
		
		sessionStatus.setComplete();
		
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@RequestMapping("/viewApplicant.ithrer")
	public ModelAndView viewApplicant(ModelAndView mav, @RequestParam("recruitmentNo") int recruitmentNo, @RequestParam("memberId") String memberId
									, HttpServletRequest req, HttpServletResponse res) {
		
		// 회사 아이디 임시로 주기
		String compId = "audgnsdlsp";
		mav.addObject("compId",compId);
		
		
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
		
		
		
		
		
		// 임시
		Map<String, Object> map = new HashMap<>();
		
		map.put("recruitmentNo", recruitmentNo);
		map.put("memberId", memberId);
		
		
		Member member = companyService.selectApplicant(map); 
		
		mav.addObject("member",member);
		
		mav.setViewName("company/viewApplicant");
		
		return mav;
	}
	
}