package com.spring.ithrer.index.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.common.util.Utils;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.service.IndexService;

@RestController
public class IndexController {
   
   @Autowired
   IndexService indexService;
   
   
   @RequestMapping(value="/")
   public ModelAndView index(ModelAndView mav) throws ParseException {
      //System.out.println("왓니?");
      List<Map<String, String>> jobList = Utils.apiList("http://api.saramin.co.kr/job-search?job_category=4&count=50&ind_cd=3&job_type=4&fields=expiration-date");
      //System.out.println("jobList="+jobList.size());
      //임시 셀렉트 원 
      Recruitment rc = indexService.selectOneRecruitment();
      
      Company cp = indexService.selectOneCompany(rc.getCompId()); //기업 아이디를 바탕으로 회사정보를 가져옴
     
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      //공고 끝나는 날짜 가져오기
      Date date = format.parse(rc.getClosingDate());
      
      //오늘날짜 가져오기
      Date sysdate = new Date();
      String sysdate1 = format.format(sysdate);
      Date sysdate2 = format.parse(sysdate1);

      System.out.println((date.getTime()-sysdate2.getTime())/(24*60*60*1000));
      
      int endTime = (int)((date.getTime()-sysdate2.getTime())/(24*60*60*1000));

      mav.addObject("endTime", endTime);
      mav.addObject("cp", cp);
      mav.addObject("rc", rc);
      mav.addObject("jobList", jobList);
      mav.setViewName("index");
      return mav;
   }
   
   @RequestMapping("/index/notice.ithrer")
   public ModelAndView companyInformation(@RequestParam("id") int id, ModelAndView mav) {
       
      try {
    	 Map<String, String> selectOneJob = Utils.selectOne("http://api.saramin.co.kr/job-search?id="+id);
         Element doc = Utils.apiCrwaling(id);
         
         String addUrl = "http://www.saramin.co.kr";
         
         StringBuffer sb = new StringBuffer(doc.html());
         
         sb.insert(doc.html().indexOf("src=")+5, addUrl);
         sb.replace(sb.indexOf("scrolling=")+11, sb.indexOf("scrolling=")+13, "yes");
         
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
   
   @GetMapping("/searchNotice.ithrer")
   public ModelAndView searchNotice(@RequestParam("searchKeyWord") String searchKeyWord,
		   							@RequestParam(value="cPage", defaultValue="1") int cPage,
		   							ModelAndView mav, HttpServletRequest request) {
	   String url = "http://api.saramin.co.kr/job-search?job_category=4&keywords="+searchKeyWord+"&count=10&start="+cPage;
	   List<Map<String, String>> tempList = Utils.apiList(url);
	   
	   List<Map<String, String>> jobList = new ArrayList<Map<String,String>>();
	   int totalContents = Integer.parseInt(tempList.get(0).get("totlaContent"));
	   for(int i = 1; i < tempList.size(); i++) {
		   jobList.add(tempList.get(i));
	   }
	   
	   mav.addObject("totlaContents",totalContents);
	   mav.addObject("jobList", jobList);
	   mav.addObject("searchKeyWord", searchKeyWord);
	   
	   //페이징
	   
	   	int numPerPage = 10;
	    int totalPages = (int)Math.ceil(((double)totalContents/numPerPage));
	    int pageBarSize = 5;
	    
	    int startPage = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
	    int endPage = startPage + pageBarSize - 1;
	       
	    int pageNo = startPage;
	    
	    // bootstrap 처리위해 리스트로 처리
	    String pageBar = "<ul class='pagination'>";
	       
	    // [이전] 이전
	    if(pageNo == 1) {
	       pageBar += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>";
	    }
	    else {
	       pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&cPage=" + (pageNo-1)
	                + "'>이전</a></li>";
	    }
	    
	    // 페이지 숫자 영역
	    while(!(pageNo > endPage || pageNo > totalPages)) {
	       if(pageNo == cPage) {
	          pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
	       }
	       else {
	          pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&cPage=" + pageNo
	                + "'>" + pageNo + "</a></li>";
	       }
	       pageNo++;
	    }
	    // [다음] 영역
	    if(pageNo > totalPages) {
	       pageBar += "<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>";
	    }
	    else {
	       pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&cPage=" 
	                   + pageNo + "'>다음</a>";
	    }
	    pageBar += "</ul>";
	   
	   mav.addObject("pageBar", pageBar);
	    
	   mav.setViewName("/notice/noticeSearch");
	   
	   return mav;
   }
   
}