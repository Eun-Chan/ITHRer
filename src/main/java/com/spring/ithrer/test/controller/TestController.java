package com.spring.ithrer.test.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.common.util.Utils;
import com.spring.ithrer.test.model.service.TestService;
import com.spring.ithrer.test.model.vo.Member;

@Controller
public class TestController {
   
   @Autowired
   TestService testService;
   
   @RequestMapping(value="/test/test.ithrer")
   public ModelAndView test(ModelAndView mav) {
      List<Member> list = testService.selectMemberList();
      if(list != null) {
         System.out.println("성공");
         System.out.println("list = "+list);
      }
      else
         System.out.println("실패");

      mav.addObject("list", list);
      mav.setViewName("/common/test");
      return mav;
   }
   @RequestMapping(value="/")
   public ModelAndView index(ModelAndView mav) {
      //System.out.println("왓니?");
      List<Map<String, String>> jobList = Utils.apiList("http://api.saramin.co.kr/job-search?job_category=4&count=50&ind_cd=3&job_type=4&fields=expiration-date");
      //System.out.println("jobList="+jobList.size());
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
         mav.setViewName("/test/testCrawling");
         
      } catch (ClientProtocolException e) {         
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      
      return mav;
   }
   
}