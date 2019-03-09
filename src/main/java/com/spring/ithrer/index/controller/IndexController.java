package com.spring.ithrer.index.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.log4j.Logger;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.ithrer.common.model.vo.Favorites;
import com.spring.ithrer.common.util.S3Util;
import com.spring.ithrer.common.util.UploadFileUtils;
import com.spring.ithrer.common.util.Utils;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.service.IndexService;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Profile;
import com.spring.ithrer.user.model.vo.Member;

import net.sf.json.JSONArray;

@RestController
public class IndexController {

   @Autowired
   IndexService indexService;
   
   Logger logger = Logger.getLogger(getClass());
   
   @RequestMapping(value="/")
   public ModelAndView index(ModelAndView mav ,HttpServletRequest req) throws ParseException {
	  String memberId = "";
	   if(req.getSession().getAttribute("member")!=null) {
		  Member member = (Member) req.getSession().getAttribute("member");
		  memberId = member.getMemberId();
	  }
      List<Map<String, String>> tempList = Utils.apiList("http://api.saramin.co.kr/job-search?job_category=4&count=8&ind_cd=3&job_type=4&fields=expiration-date");
      Date sysdate = new Date();
      
      List<Map<String, String>> jobList = new ArrayList<Map<String,String>>();
      for(int i = 1; i < tempList.size(); i++) {
		   jobList.add(tempList.get(i));
	   }
      
      //임시 셀렉트 원
	/* Recruitment rc = indexService.selectOneRecruitment(2); */
      // 공고 빠른 순서 6 셀렉트 리스트
      List<Recruitment> rc = indexService.selectListRecruitment(memberId);
      
      // 지원자 많은 공곡 6 리스트
      List<Recruitment> topRc = indexService.selectTopListRecruitment(memberId);
      
      //우리 공고 랜덤 12개 리스트
      List<Recruitment> rcList = indexService.selectListRandomRecruitment(memberId);
      
      
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String sysdate1 = format.format(sysdate);
      Date sysdate2 = format.parse(sysdate1);
      int endTime = 0;
      Date date = null;
      for(int i = 0 ; i<rc.size() ; i++) {
    	  /*cp = indexService.selectOneCompany(rc.get(i).getCompId());*/ //기업 아이디를 바탕으로 회사정보를 가져옴
    	  date = format.parse(rc.get(i).getClosingDate());    	  
    	  endTime = (int)((date.getTime()-sysdate2.getTime())/(24*60*60*1000));
    	  rc.get(i).setEndTime(endTime);
    	  if(endTime<0) {
    		  rc.get(i).setEnd("Y");
    	  }


    	  date = format.parse(topRc.get(i).getClosingDate());    	  
    	  endTime = (int)((date.getTime()-sysdate2.getTime())/(24*60*60*1000));
    	  topRc.get(i).setEndTime(endTime);
    	  if(endTime<0) {
    		  topRc.get(i).setEnd("Y");
    	  }
      }
      
      for(int i = 0 ; i<rcList.size() ; i++) {
     	  date = format.parse(rcList.get(i).getClosingDate());    	  
    	  endTime = (int)((date.getTime()-sysdate2.getTime())/(24*60*60*1000));
    	  rcList.get(i).setEndTime(endTime);
    	  if(endTime<0) {
    		  rcList.get(i).setEnd("Y");
    	  }  
      }
     
      //공고 끝나는 날짜 가져오기
      
      //오늘날짜 가져오기
      
      //배너광고 s3에서 가져올 수 있도록 등록된 주소를 가져오는 부분
      List<Map<String, String>> bannerList = indexService.selectListCharged();
      
      mav.addObject("bannerList", bannerList);
      mav.addObject("rcList", rcList);
      mav.addObject("rc", rc);
      mav.addObject("topRc", topRc);
      mav.addObject("jobList", jobList);
      mav.setViewName("index");
      return mav;
   }
   
   @RequestMapping("/index/notice.ithrer")
   public ModelAndView companyInformation(@RequestParam("id") int id, ModelAndView mav) {
       
      try {
    	 Map<String, String> selectOneJob = Utils.selectOne("http://api.saramin.co.kr/job-search?id="+id);
    	 Map<String, org.jsoup.nodes.Element> doc = Utils.apiCrwaling(id);
         
    	 //크롤링으로 들고오는 iframe의 설정을 변경하는 부분
         String addUrl = "http://www.saramin.co.kr";//iframe태그 src 앞에 들어갈 url
         
         StringBuffer sb = new StringBuffer(doc.get("detail").html());
                  
         sb.insert(doc.get("detail").html().indexOf("src=")+5, addUrl);//src의 값에 추가
         sb.replace(sb.indexOf("scrolling=")+11, sb.indexOf("scrolling=")+13, "yes");//스크롤이 가능하게 변경
         
         //크롤링으로 들고오는 근무지 주소값 부분
         if(doc.get("address") != null) {
        	 StringBuffer sb2 = new StringBuffer(doc.get("address").html());        	 
        	 mav.addObject("address", sb2.substring(doc.get("address").html().indexOf("<span class=\"spr_jview txt_adr\">")+42, doc.get("address").html().indexOf("</span>")));
         }
         
         //크롤링으로 기업정보를 가져오는 부분
         if(doc.get("logo")!= null) {
        	 StringBuffer sb3 = new StringBuffer(doc.get("logo").html());   
        	 mav.addObject("logo", sb3);
         }
         
         if(doc.get("compInfo") != null) {
        	 String compType = doc.get("compInfo").select("dl").eq(0).html();
        	 String empCount = doc.get("compInfo").select("dl").eq(1).html();
        	 String jobType = doc.get("compInfo").select("dl").eq(2).html();
        	 String publichedDate = doc.get("compInfo").select("dl").eq(3).html();
        	 String revenue = doc.get("compInfo").select("dl").eq(4).html();
        	 String representative = doc.get("compInfo").select("dl").eq(5).html();
        	 String homePage = doc.get("compInfo").select("dl").eq(6).html();
        	 String compAddr = doc.get("compInfo").select("dl").eq(7).html();
        	 
        	 mav.addObject("compType", compType);
        	 mav.addObject("empCount", empCount);
        	 mav.addObject("jobType", jobType);
        	 mav.addObject("publichedDate", publichedDate);
        	 mav.addObject("revenue", revenue);
        	 mav.addObject("representative", representative);
        	 mav.addObject("homePage", homePage);
        	 mav.addObject("compAddr", compAddr);
         }
         
         
         
         mav.addObject("selectOneJob", selectOneJob);
         mav.addObject("doc", sb);
         mav.setViewName("/notice/noticeDetail");
         
      } catch (ClientProtocolException e) {         
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      
      return mav;
   }
   
   /*
   @RequestMapping("/index/ithrerNotice.ithrer")
   public ModelAndView ithrerCompanyInformation(ModelAndView mav) {
	   mav.setViewName("/notice/ithrerNoticeDetail");
	   return mav;
   }
   */
   
   @GetMapping("/searchNotice.ithrer")
   public ModelAndView searchNotice(@RequestParam("searchKeyWord") String searchKeyWord,@RequestParam("location") String location,
		   							ModelAndView mav, HttpServletRequest request) {
	   
	   //사람인 api에서  리스트를 불러오는 부분
	   int cPage;
	   try {
		   cPage = Integer.parseInt(request.getParameter("cPage"));
	   }catch(NumberFormatException e) {
		   cPage = 1;
	   }
	   String [] locations = location.split(",");
	   String loc_cd ="";
	   for(int i = 0 ; i<locations.length ; i++) {
		   System.out.println(locations[i]);
		   loc_cd += locations[i]+"&";
	   }
	   String url = "http://api.saramin.co.kr/job-search?job_category=4&keywords="+searchKeyWord+"&loc_cd="+loc_cd+"&count=10&start="+(cPage-1);
	   //logger.debug("url="+url);
	   List<Map<String, String>> tempList = Utils.apiList(url);
	   
	   List<Map<String, String>> jobList = new ArrayList<Map<String,String>>();
	   int totalContents = Integer.parseInt(tempList.get(0).get("totlaContent"));
	   for(int i = 1; i < tempList.size(); i++) {
		   jobList.add(tempList.get(i));
	   }
	   //logger.debug(jobList);
	   mav.addObject("totlaContents",totalContents);
	   mav.addObject("jobList", jobList);
	   mav.addObject("searchKeyWord", searchKeyWord);
	   
	   
	   //ITHRer에 등록된 공고 DB에서 찾아와 불러오기
	   
	   String salary = request.getParameter("salary");
	   int age = 0;
	   try {
		   age = Integer.parseInt(request.getParameter("age"));		   
	   } catch(NumberFormatException e) {
		   age = 0;
	   }
	   String gender = request.getParameter("gender");
	   System.out.println("민우"+gender);
	   String subway = request.getParameter("subway");
	   String licence = request.getParameter("licence");
	   String language = request.getParameter("language");
	   String[] major = request.getParameterValues("major");
	   String[] position = request.getParameterValues("position");
	   String[] preference = request.getParameterValues("preference");
	   String[] emp_type = request.getParameterValues("emp_type");
	   String[] work_day = request.getParameterValues("work_day");
	   String[] welfare = request.getParameterValues("welfare");
	   
	   //,로 파싱한 값을 배열로 담을 변수
	   String[] major2 = null;
	   String[] position2 = null;
	   String[] preference2 = null;
	   String[] emp_type2 = null;
	   String[] work_day2 = null;
	   String[] welfare2 = null;
	   
	   if(major != null && major[0] != "") {
		   major2 = major[0].split(",");
	   }
	   if(position != null && position[0] != "") {
		   position2 = position[0].split(",");
	   }
	   if(preference != null && preference[0] != "") {
		   preference2 = preference[0].split(",");
	   }
	   if(emp_type != null && emp_type[0] != "") {
		   emp_type2 = emp_type[0].split(",");
	   }
	   if(work_day != null && work_day[0] != "") {
		   work_day2 = work_day[0].split(",");
	   }
	   if(welfare != null && welfare[0] != "") {
		   welfare2 = welfare[0].split(",");
	   }
	   
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("searchKeyword", searchKeyWord);
	   map.put("locationCode", locations);
	   map.put("salary", salary);
	   map.put("age", age);
	   map.put("gender", gender);
	   map.put("subway", subway);
	   map.put("licence", licence);
	   map.put("language", language);
	   map.put("major", major2);
	   map.put("position", position2);
	   map.put("preference", preference2);
	   map.put("emp_type", emp_type2);
	   map.put("work_day", work_day2);
	   map.put("welfare", welfare2);
	   
	   logger.debug("map: "+map);
	   
	   int ithrerNumPerPage = 5;
	   int ithrerCPage;
	   
	   try {
		   ithrerCPage = Integer.parseInt(request.getParameter("ithrerCPage"));
		}catch(NumberFormatException e){
			ithrerCPage = 1;
		}
	   
	   List<Map<String, String>> ithrerList =indexService.selectListSearchIthrer(map, ithrerNumPerPage, ithrerCPage);
	   List<Map<String, String>> ithrerList2 =indexService.selectListSearchIthrer(map);
	   
	   //logger.debug(ithrerList);
	   
	   mav.addObject("ithrerList", ithrerList);

	   
	   //사람인 api 페이징
	   
	   	int numPerPage = 10;
	    int totalPages = (int)Math.ceil(((double)totalContents/numPerPage));
	    int pageBarSize = 5;
	    
	    int startPage = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
	    int endPage = startPage + pageBarSize - 1;
	       
	    int pageNo = startPage;
	    String ithrerParam ="";
	    
	    if(salary == null) {salary = "";}
	    if(age == 0) {age = 0;}
	    if(gender == null) {gender = "";}
	    if(subway == null) {subway = "";}
	    if(licence == null) {licence = "";}
	    if(language == null) {language = "";}
	    
	    ithrerParam = "&salary="+salary+"&age="+age+"&gender="+gender+"&subway="+subway+"&licence="+licence+"&language="+language;
	    
	    if(major == null) {major = new String[] {""};}
	    if(preference == null) {preference  = new String[] {""};}
	    if(position == null) {position  = new String[] {""};}
	    if(emp_type == null) {emp_type  = new String[] {""};}
	    if(work_day == null) {work_day  = new String[] {""};}
	    if(welfare == null) {welfare  = new String[] {""};}
	    
	    ithrerParam += "&major=";
	    for(int i = 0; i < major.length; i++) {
	    	if(i == (major.length-1))
	    		ithrerParam += major[i];
	    	else
	    		ithrerParam += major[i]+",";
	    }
	    ithrerParam += "&preference=";
	    for(int i = 0; i < preference.length; i++) {
	    	if(i == (preference.length-1))
	    		ithrerParam += preference[i];
	    	else
	    		ithrerParam += preference[i]+",";
	    }
	    ithrerParam += "&position=";
	    for(int i = 0; i < position.length; i++) {
	    	if(i == (position.length-1))
	    		ithrerParam += position[i];
	    	else
	    		ithrerParam += position[i]+",";
	    }
	    ithrerParam += "&emp_type=";
	    for(int i = 0; i < emp_type.length; i++) {
	    	if(i == (emp_type.length-1))
	    		ithrerParam += emp_type[i];
	    	else
	    		ithrerParam += emp_type[i]+",";
	    }
	    ithrerParam += "&work_day=";
	    for(int i = 0; i < work_day.length; i++) {
	    	if(i == (work_day.length-1))
	    		ithrerParam += work_day[i];
	    	else
	    		ithrerParam += work_day[i]+",";
	    }
	    ithrerParam += "&welfare=";
	    for(int i = 0; i < welfare.length; i++) {
	    	if(i == (welfare.length-1))
	    		ithrerParam += welfare[i];
	    	else
	    		ithrerParam += welfare[i]+",";
	    }
	    
	    
	    String beforeApiUrl = request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+location+ "&ithrerCPage="+ithrerCPage;
	    String numApiUrl = request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+location+ "&ithrerCPage="+ithrerCPage;
	    //String afterApiUrl = request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+location+"&cPage="+ pageNo;
	    
	    // bootstrap 처리위해 리스트로 처리
	    String pageBar = "<ul class='pagination'>";
	       
	    // [이전] 이전
	    if(pageNo == 1) {
	       pageBar += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>";
	    }
	    else {
	       pageBar += "<li class='page-item'><a class='page-link' href='" + beforeApiUrl+"&cPage=" + (pageNo-1) + ithrerParam + "'>이전</a></li>";
	    }
	    
	    // 페이지 숫자 영역
	    while(!(pageNo > endPage || pageNo > totalPages)) {
	       if(pageNo == cPage) {
	          pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
	       }
	       else {
	          pageBar += "<li class='page-item'><a class='page-link' href='" + numApiUrl+"&cPage=" + pageNo+ ithrerParam + "'>" + pageNo + "</a></li>";
	       }
	       pageNo++;
	    }
	    // [다음] 영역
	    if(pageNo > totalPages) {
	       pageBar += "<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>";
	    }
	    else {
	       pageBar += "<li class='page-item'><a class='page-link' href='" + numApiUrl+"&cPage=" + pageNo + ithrerParam + "'>다음</a>";
	    }
	    pageBar += "</ul>";
	   
	   mav.addObject("pageBar", pageBar);	    
	   
	   
	   //ithrer 페이징
	   
	   int ithrerStartPage = ((ithrerCPage - 1) / pageBarSize) * pageBarSize + 1;
	   int ithrerEndPage = ithrerStartPage + pageBarSize - 1;
	   
	   int ithrerTotalContents = ithrerList2.size();
	   mav.addObject("ithrerTotalContents", ithrerTotalContents);
	   int ithrerTotalPages = (int)Math.ceil(((double)ithrerTotalContents/ithrerNumPerPage));
	   
	   int ithrerPageNo = ithrerStartPage;
	   
	   String ithrerBeforeApiUrl = request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+location + "&cPage="+cPage;
	   String ithrerNumApiUrl = request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+location + "&cPage="+cPage;
	   
	   // bootstrap 처리위해 리스트로 처리
		String ithrerPageBar = "<ul class='pagination'>";
		   
		// [이전] 이전
		if(ithrerPageNo == 1) {
			ithrerPageBar += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>";
		}
		else {
			ithrerPageBar += "<li class='page-item'><a class='page-link' href='" + ithrerBeforeApiUrl+"&ithrerCPage=" + (ithrerPageNo-1) + ithrerParam + "'>이전</a></li>";
		}
		
		// 페이지 숫자 영역
		while(!(ithrerPageNo > ithrerEndPage || ithrerPageNo > ithrerTotalPages)) {
		   if(ithrerPageNo == ithrerCPage) {
			   ithrerPageBar += "<li class='page-item active'><a class='page-link' href='#'>" + ithrerPageNo + "</a></li>";
		   }
		   else {
			   ithrerPageBar += "<li class='page-item'><a class='page-link' href='" + ithrerNumApiUrl+"&ithrerCPage=" + ithrerPageNo+ ithrerParam + "'>" + ithrerPageNo + "</a></li>";
		   }
		   ithrerPageNo++;
		}
		// [다음] 영역
		if(ithrerPageNo > ithrerTotalPages) {
			ithrerPageBar += "<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>";
		}
		else {
			ithrerPageBar += "<li class='page-item'><a class='page-link' href='" + ithrerNumApiUrl+"&ithrerCPage=" + ithrerPageNo + ithrerParam + "'>다음</a>";
		}
		ithrerPageBar += "</ul>";
		   
		mav.addObject("ithrerPageBar", ithrerPageBar);
	   	   
		mav.setViewName("/notice/noticeSearch");
		   
	   return mav;
   }
   
   //우리 채용정보 
   @GetMapping("/index/ithrerNotice.ithrer")
   public ModelAndView ithrerNoticeDetail(@RequestParam("no") int recruitmentNo,ModelAndView mav , HttpServletRequest req,@RequestParam(name="compId", defaultValue="") String compId) {
	   String memberId = "";
		   if(req.getSession().getAttribute("member")!=null) {
			  Member member = (Member) req.getSession().getAttribute("member");
			  memberId = member.getMemberId();
		   }
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("memberId", memberId);
	   map.put("recNo", recruitmentNo);
	   map.put("compId",compId);
	   
	   Recruitment rc = indexService.selectOneRecruitment(map);
	   System.out.println(rc);
	   Company com = indexService.selectOneCompany(rc.getCompId());
	   String date = com.getDateOfEstablishment();
	   System.out.println("substring전 : "+date);
	   String date2 = date.substring(0,10);
	   com.setDateOfEstablishment(date2);
	   //해당 회사에 아이디로 지원한 적이 있는지 검사하는 쿼리
	   int count = indexService.selectCountCompanyApplication(map);
	 
	   List<Member> list = indexService.selectStatistics(rc.getRecruitmentNo());
	   
	   rc.setOpeningDate(rc.getOpeningDate().substring(0, 10));
	   rc.setClosingDate(rc.getClosingDate().substring(0, 10));
	   
	   
	   if(list!=null) {
		   mav.addObject("list", list);		   

	   }
	   mav.addObject("rc", rc);
	   mav.addObject("com", com);
	   mav.addObject("count", count);
	   mav.setViewName("/notice/ithrerNoticeDetail");
	   return mav;
   }
	
   
   //지원하기 창
   @RequestMapping("/notice/companyApply.ithrer")
   public ModelAndView ithrerCompanyApply(ModelAndView mav,@RequestParam("recruitmentNo")int rbcNo,HttpServletRequest req) {
	   String memberId = "";
	   if(req.getSession().getAttribute("member")!=null) {
			  Member member = (Member) req.getSession().getAttribute("member");
			  memberId = member.getMemberId();
	   }
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("memberId", memberId);
	   map.put("recNo", rbcNo);
	   
	   Recruitment rc = indexService.selectOneRecruitment(map);
	   Profile pf = indexService.selectOneProfile(memberId);
	   
   
	   Company com = indexService.selectOneCompany(rc.getCompId());
	   
	   List<PortFolio> portFolio = indexService.selectListPortFolio(memberId);
	   
	   mav.addObject("pf", pf);
	   mav.addObject("portFolio", portFolio);
	   mav.addObject("rc", rc);
	   mav.addObject("com", com);
	   mav.setViewName("/notice/companyApply");
	   
	   return mav;
   }
   

   //로케이션 코드에 넣어보자~
   @RequestMapping("/index/locaton.ithrer")
   public void ithrerLocation(@RequestParam("code") int code , @RequestParam("name") String name ,HttpServletResponse res) {
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("code", code);
	   map.put("name", name);
	   int result = indexService.insertLocation(map);
	   
	   Gson gson = new Gson();
	   try {
		gson.toJson(result , res.getWriter());
	} catch (JsonIOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
   }
   
   @RequestMapping("/index/favorites.ithrer")
   public void ithrerFavorites(@RequestParam("memberId") String memberId,@RequestParam("recruitment_no") int recNo,HttpServletResponse res,@RequestParam("compId") String compId) {
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("memberId", memberId);
	   map.put("recNo", recNo);
	   map.put("compId", compId);
	   Favorites fa = indexService.selectOneFavorites(map);
	   int insertNo = 0;
	   int deleteNo = 0;
	   Gson gson = new Gson();
	   if(fa == null) {
		   insertNo = indexService.insertFavorites(map);
		   try {
			gson.toJson(insertNo,res.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }else {
		   deleteNo = indexService.deleteFavorites(map);
		   if(deleteNo == 1) {
			   deleteNo = 2;
		   }
		   try {
			gson.toJson(deleteNo,res.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	   
   }

   //임시 포트폴리오 파일 추가
   @RequestMapping(value= "/index/uploadPortfolio.ithrer", method=RequestMethod.POST)
   @ResponseBody
   public void uploadPortfolio(MultipartHttpServletRequest req, MultipartFile file,HttpServletResponse res) {
	   String memberId = "";
	   if(req.getSession().getAttribute("member")!=null) {
			  Member member = (Member) req.getSession().getAttribute("member");
			  memberId = member.getMemberId();
	   }
	   res.setCharacterEncoding("utf-8");
	   //1.파일업로드 (업로드할 경로 찾기)
	   Iterator<String> itr = req.getFileNames();
	   if(itr.hasNext()) {
		   file = req.getFile(itr.next());
	   }
	   System.out.println("컨트롤러");
	   String saveDirectory = "resume/portfolio";
	   System.out.println(file.getOriginalFilename());
	   System.out.println("saveDirectory="+saveDirectory);
	   String o_fileName = "";
	   String r_fileName = "";
	   if(!file.isEmpty()) {
		   //오리지널 파일네임
	   		o_fileName = file.getOriginalFilename();
		   
		   //리네임해서 서버 저장용
	   		r_fileName = Utils.getRenamedFileName(o_fileName);
		   
		   //실제 서버에 파일저장
	   }
	   ResponseEntity<String> img_path = null;
	   try {
		img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(saveDirectory, o_fileName, file.getBytes()),
					HttpStatus.CREATED);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	   	String path = (String)img_path.getBody();
	   	String url = path.substring(path.indexOf("_")+1);
	   	System.out.println(path);
	   	logger.debug("indexController path="+path);
		PortFolio pf = new PortFolio();
		/* 되는걸로 하세요 */
		//pf.setPOriginalFileName(o_fileName);
		pf.setPRenamedFileName(r_fileName);
		pf.setUrl(url);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("pf", pf);
		//2. 포트폴리오 테이블에 인서트
		int result = indexService.insertPortFolio(map);
		
		Gson gson = new Gson();
		if(result == 1) {			
			try {
				gson.toJson(pf,res.getWriter());
			} catch (JsonIOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	   
	   
   }
   
   //맴버 전화번호 , 이메일 수정
   @RequestMapping("/index/memberUpdate.ithrer")
   @ResponseBody
   public void updateMember(HttpServletResponse res,@RequestBody Map<String, Object> param ,HttpServletRequest req) {
	   int result = indexService.updateMember(param);
	   Gson gson = new Gson();
	   if(result==1) {
		   HttpSession session = req.getSession(true);
		   Member member = (Member)session.getAttribute("member");
		   Profile pf = indexService.selectOneProfile(member.getMemberId());
		   int pfResult = indexService.updateProfile(param);
		   member.setEmail((String)param.get("email"));
		   member.setPhone((String)param.get("phone"));
		   session.setAttribute("member", member);
		   try {
			   param.putIfAbsent("result", result);
			gson.toJson(param,res.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	   

   }
   
   //이력서 제출
   @RequestMapping("/index/resumeSubmit.ithrer")
   public void resumeSubmit(@RequestParam("memberId")String memberId,
		   @RequestParam("compId") String compId,
		   @RequestParam("recruitmentNo") int recruitmentNo,
		   HttpServletResponse res) {
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("memberId", memberId);
	   map.put("compId", compId);
	   map.put("recruitmentNo", recruitmentNo);
	   int result = indexService.insertCompanyApplication(map);
	   Gson gson = new Gson();
	   if(result==1) {
		   try {
			   gson.toJson(result,res.getWriter());
		   } catch (JsonIOException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
		   } catch (IOException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
		   }		   
	   }
   }
   //포트폴리오 삭제
   @RequestMapping("/index/deletePortFolio.ithrer")
   public void deleteFolio(@RequestParam("pfNo") int pfNo,@RequestParam("url") String url,HttpServletResponse res) {
	   int result = indexService.deletePortFolio(pfNo);
	   url = "resume/portfolio"+url;
	   if(result>0) {
		   S3Util s3 = new S3Util();
		   for(int i = 0 ; i<s3.getBucketList().size(); i++) {
			   System.out.println(s3.getBucketList().get(i));		   
		   }
		   s3.fileDelete("eunchan-origin", url);
	   }
	   Gson gson = new Gson();
	   try {
		gson.toJson(result,res.getWriter());
	} catch (JsonIOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   //스크랩한 공고 보여주는 창
   @RequestMapping("/index/favoriteRecruitment.ithrer")
   public ModelAndView favoriteRecruitment(@RequestParam("memberId") String memberId,ModelAndView mav,HttpServletRequest request) throws ParseException {
	  System.out.println("memberId="+memberId);
	   
	   if(memberId == null) {
		  memberId ="";
	  }
	   Date sysdate = new Date();
	   int cPage = 0;
	   try {
		   cPage = Integer.parseInt(request.getParameter("cPage"));		   
	   } catch(NumberFormatException e) {
		   cPage = 0;
	   }
	   
	   int totalCount = indexService.selectCountFavorite(memberId);
	   int numPerPage = 5;
	   int totalPages = (int)Math.ceil(((double)totalCount/numPerPage));
	   int pageBarSize = 5;
	    
	   int startPage = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
	   int endPage = startPage + pageBarSize - 1;
	       
	   int pageNo = startPage;
	   
	   List<Favorites> favorites = indexService.selectListFavorites(memberId,cPage,numPerPage);
	   List<String>  categoryList = new ArrayList<String>(); 		   
	   for(int i = 0 ; i<favorites.size(); i++) {
		   categoryList.add(favorites.get(i).getCategory());
		   String closingDate = favorites.get(i).getClosingDate();
		   String date2 = closingDate.substring(0,10);
		   favorites.get(i).setClosingDate(date2);
		   
	   }
	   //카테고리를 가져온후 중복제거
	   List<String>  categoryLists = new ArrayList<String>();
	   if(categoryList.isEmpty()) {
		   categoryLists.add("");
	   }
	   else {		   
		   for(int i = 0 ; i<categoryList.size() ; i++) {
			   if(!categoryLists.contains(categoryList.get(i))) {
				   categoryLists.add(categoryList.get(i));
			   }
		   }
	   }
	  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     
      String sysdate1 = format.format(sysdate);
      Date sysdate2 = format.parse(sysdate1);
      int endTime = 0;
      Date date = null;
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("array",categoryLists);
	   map.put("memberId", memberId);
	   List<Recruitment> recommendationRecruitmentList = indexService.selectListRecommendRecruitmentList(map);
	   
	   
	   for(int i = 0 ; i<recommendationRecruitmentList.size() ; i++) {
	     	  date = format.parse(recommendationRecruitmentList.get(i).getClosingDate());    	  
	    	  endTime = (int)((date.getTime()-sysdate2.getTime())/(24*60*60*1000));
	    	  recommendationRecruitmentList.get(i).setEndTime(endTime);
	    	  if(endTime<0) {
	    		  recommendationRecruitmentList.get(i).setEnd("Y");
	    	  }  
	      }
	   
	   mav.addObject("rcList", recommendationRecruitmentList);
	   mav.addObject("favorites",favorites);
	   
	   // bootstrap 처리위해 리스트로 처리
	   	String url = request.getContextPath()+"/index/favoriteRecruitment.ithrer?";
	    String pageBar = "<ul class='pagination'>";
	       
	    // [이전] 이전
	    if(pageNo == 1) {
	       pageBar += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>";
	    }
	    else {
	       pageBar += "<li class='page-item'><a class='page-link' href='" + url+"cPage="+(pageNo-1)+"&memberId="+memberId+ "'>이전</a></li>";
	    }
	    
	    // 페이지 숫자 영역
	    while(!(pageNo > endPage || pageNo > totalPages)) {
	       if(pageNo == cPage) {
	          pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
	       }
	       else {
	          pageBar += "<li class='page-item'><a class='page-link' href='" + url+"cPage="+pageNo +"&memberId="+memberId+"'>" + pageNo + "</a></li>";
	       }
	       pageNo++;
	    }
	    // [다음] 영역
	    if(pageNo > totalPages) {
	       pageBar += "<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>";
	    }
	    else {
	       pageBar += "<li class='page-item'><a class='page-link' href='" + url+"cPage="+pageNo+"&memberId="+memberId + "'>다음</a>";
	    }
	    pageBar += "</ul>";
	   
	   mav.addObject("pageBar", pageBar);	    
	   
	   mav.setViewName("notice/favoriteRecruitment");
	   return mav;
   }
   
   @RequestMapping("/index/deleteFavorite.ithrer")
   public void deleteFavorite(HttpServletResponse res , @RequestParam("test") String [] test,HttpServletRequest req) {
	   Member member = (Member)req.getSession().getAttribute("member");
	   Map<String, Object> map = new HashMap<String, Object>();
	  List<Integer> arr = new ArrayList<Integer>();
	   int a = 0 ;
	   for(int i = 0 ; i<test.length; i++) {
		   System.out.println(test.length);
		   System.out.println(test[i]);
		   a = Integer.parseInt(test[i]);
		   arr.add(a);
	   }
	   map.put("memberId", member.getMemberId());
	   map.put("param", arr);
	   int result = indexService.deleteFavoritesList(map);
	   Gson gson = new Gson();
	   try {
		gson.toJson(result,res.getWriter());
	} catch (JsonIOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   
   //에러페이지 실험
   @RequestMapping("/index/error.ithrer")
   public ModelAndView errorPage(ModelAndView mav) {
	   
	   mav.setViewName("common/error");
	   return mav;
   }
} 