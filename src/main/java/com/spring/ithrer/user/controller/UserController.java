package com.spring.ithrer.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.user.model.service.UserService;
import com.spring.ithrer.user.model.vo.Member;

@Controller
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	UserService userService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 인증번호로 사용할 변수
	private static int authNum;
	// 랜덤번호 생성 메서드
	private static int getAuthNum() {return (int)(Math.random()*100000);};
	private String from = "2019.khproject@gmail.com";
	
	@RequestMapping("/user/signUpGoing")
	public ModelAndView signUpGoing(ModelAndView mav) {
			
		mav.setViewName("user/signUp");
		
		return mav;
	}
	
	/**
	 * 회원가입 - 아이디 중복
	 */
	@RequestMapping("/user/idCheck")
	@ResponseBody
	public Map<String,Integer> idCheck(@RequestParam(name="id") String id) {
		System.out.println("id = "+id);
		int result = userService.idCheck(id);
		if(result > 0) {
			System.out.println("아이디 중복");
		}
		else
			System.out.println("아이디 사용 가능");
		Map<String,Integer> test = new HashMap<String,Integer>();
		test.put("result", result);
		return test;
	}
	
	/**
	 * 회원가입 - 이메일 인증
	 */
	@RequestMapping("/user/emailAuth")
	@ResponseBody
	public Map<String, String> emailAuth(@RequestParam(name="memberEmail") String email) throws MessagingException {
		// 0. 리턴한 HashMap
		Map<String, String> test = new HashMap<String, String>();
		
		// 1. 인증번호를 보내기전 이미 가입된 이메일인지 확인
		System.out.println("사용자 E-mail = "+email);
		int result = userService.emailCheck(email);
		if(result > 0) {
			System.out.println("이메일 중복");
			test.put("result" , "false");
			return test;
		}
		System.out.println("회원가입 가능한 이메일");
		System.out.println("mailSender = "+mailSender);
		// 2. 이메일 보내기
		// 인증번호 생성
		authNum = getAuthNum();
		// 보낼 이메일 주소		
		String to = email;
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setTo(new InternetAddress(to));
		messageHelper.setText(String.valueOf(authNum));
		messageHelper.setFrom(new InternetAddress(from));
		messageHelper.setSubject("회원가입 인증번호 입니다.");
		
		mailSender.send(message);
		
		test.put("result" , String.valueOf(authNum));
		
		return test;
	}
	
	/**
	 * 개인회원 회원가입
	 */
	@RequestMapping(value = "/user/createMember" , method=RequestMethod.POST)
	public ModelAndView createMember(Member member, ModelAndView mav) {
		// 0. 회원가입하러 가즈아 ! 서비스로
		System.out.println("암호화전: "+member.getPassword());
		String temp = member.getPassword();
		//BCrypt 방식 암호화
		member.setPassword(bcryptPasswordEncoder.encode(temp));
		System.out.println("암호화후: "+member.getPassword());
		
		System.out.println("member = "+member);
		int result = userService.createMember(member);
		
		
		if(result> 0) {
			System.out.println("회원가입 성공");
		}
		else {
			System.out.println("회원가입 실패");
		}
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	/**
	 * header.jsp 로그인 처리(개인회원)
	 */
	@RequestMapping(value="/user/memberLogin")
	@ResponseBody
	public Map<String,String> memberLogin(ModelAndView mav , 
			@RequestParam(name="memberId") String memberId , 
			@RequestParam(name="memberPassword") String memberPassword, 
			@RequestParam(name="memberSaveId") String memberSaveId,
			HttpServletResponse res,
			HttpServletRequest req){
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("member_Id" , memberId);
		map.put("password" , memberPassword);
		
		Member member = userService.memberCheck(map);
		
		Map<String,String> test = new HashMap<String, String>();
		if(member != null) {
			// 비밀번호가 맞는지 확인
			if(!bcryptPasswordEncoder.matches(memberPassword, member.getPassword())){
				System.out.println("비밀번호 틀림!");
				test.put("result" , "false");
				return test;
			}
			
			System.out.println("로긴 성공");
			// (아이디 저장 체크시) 쿠키 생성
			if(memberSaveId.equals("true")) {
				Cookie c = new Cookie("memberSaveId", memberId);
				// 쿠키 유효시간 1일 , 
				c.setMaxAge(24*60*60);
				c.setPath("/");
				res.addCookie(c);
			}
			else {
				Cookie c = new Cookie("memberSaveId", memberId);
				c.setMaxAge(0);
				c.setPath("/");
				res.addCookie(c);
			}
			
			// 로그인 한 유저 세션에 넣기
			HttpSession session = req.getSession();
			
			session.setMaxInactiveInterval(60*10);
			session.setAttribute("member", member);
			
			test.put("result" , "true");
		}
		else {
			System.out.println("로긴 실패");
			test.put("result" , "false");
		}
		
		return test;
	}
	
	/**
	 * header.jsp 로그인 처리(기업회원)
	 */
	@RequestMapping(value="/user/companyLogin")
	@ResponseBody
	public Map<String,String> companyLogin(ModelAndView mav , 
			@RequestParam(name="companyId") String companyId , 
			@RequestParam(name="companyPassword") String companyPassword, 
			@RequestParam(name="companySaveId") String companySaveId,
			HttpServletResponse res,
			HttpServletRequest req){
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("companyId" , companyId);
		map.put("password" , companyPassword);
		Company company = userService.companyCheck(map);
		
		Map<String,String> test = new HashMap<String, String>();
		if(company != null) {
			System.out.println("로긴 성공");
			
			// (아이디 저장 체크시) 쿠키 생성
			if(companySaveId.equals("true")) {
				Cookie c = new Cookie("companySaveId", companyId);
				// 쿠키 유효시간 1일 , 
				c.setMaxAge(24*60*60);
				c.setPath("/");
				res.addCookie(c);
			}
			else {
				Cookie c = new Cookie("companySaveId", companyId);
				c.setMaxAge(0);
				c.setPath("/");
				res.addCookie(c);
			}
			
			// 로그인 한 유저 세션에 넣기
			HttpSession session = req.getSession();
			
			session.setMaxInactiveInterval(60*10);
			session.setAttribute("company", company);
			
			test.put("result" , "true");
		}
		else {
			System.out.println("로긴 실패");
			test.put("result" , "false");
		}
		
		return test;
	}
	
	/**
	 * 카카오톡 로그인
	 */
	@RequestMapping(value="/user/kakaoLogin" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> kakaoLogin(@RequestParam(name="kakaoId") String kakaoId,
										 @RequestParam(name="kakaoName") String kakaoName,
										 @RequestParam(name="kakaoEmail" ,required=false) String kakaoEmail){
		Map<String,String> map = new HashMap<>();
		System.out.println("여긴 옵니까");
		// 0. 로그인한 카카오 회원 아이디 일단 조회!
		Member member = userService.kakaoLogin(kakaoId);
		if(member != null) {
			System.out.println("이미 가입된 카카오 회원");
			System.out.println("member = "+member);
		}
		else {
			System.out.println("카카오로 처음 접속한 회원");
		}
		return map;
	}
	
	/**
	 * 사업자번호 조회
	 */
	@RequestMapping(value="/user/license_Check")
	public Map<String,String> license_Check(@RequestParam(name="license_no") String license_no){
		Map<String,String> test = new HashMap<>();
		System.out.println("license_no = "+license_no);
		logger.debug("하아아아아앙ㅇㅁㄴ암낭ㅁ나앙아아아아아아아아아아아아아아아아아아");
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.postForObject("https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=1360215714", request., String.class);
		System.out.println(result);
		return test;
	}
}
