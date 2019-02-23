package com.spring.ithrer.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Utils {

	public static List<Map<String, String>> apiList(String url){
		Map<String, String> map = new HashMap<String, String>();
		List<Map<String, String>> list = null;
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("job");

			list = new ArrayList<Map<String,String>>();
			
			NodeList nList2 = doc.getElementsByTagName("jobs");
			String total = nList2.item(0).getAttributes().getNamedItem("total").getNodeValue();
			
			map.put("totlaContent", total);
			list.add(map);
			
			for(int i = 0 ; i<nList.getLength() ; i++) {
				map = new HashMap<String, String>();
				Node nNode = nList.item(i);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					map.put("id", getTagValue("id", eElement));
					map.put("name", getTagValue("name",eElement));
					map.put("title", getTagValue("title",eElement));
					map.put("jobType", getTagValue("job-type",eElement));
					map.put("exLevel", getTagValue("experience-level",eElement));
					map.put("level", getTagValue("required-education-level",eElement));
					map.put("salary", getTagValue("salary",eElement));
					map.put("opening", getTagValue("opening-timestamp", eElement)); //접수 시작일
					map.put("expiration", getTagValue("expiration-timestamp", eElement));
					
					String endTime = getTagValue("expiration-timestamp", eElement);
					int endTimes = Integer.parseInt(endTime)/(24*60*60*1000);
					
					map.put("end", String.valueOf(endTimes)); //접수 마감일
					
					list.add(map);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public static Map<String, String> selectOne(String url){
		Map<String, String> map = null;
		List<Map<String, String>> list = null;
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("job");
			
			for(int i = 0 ; i<nList.getLength() ; i++) {
				map = new HashMap<String, String>();
				Node nNode = nList.item(i);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					map.put("name", getTagValue("name",eElement)); //기업명
					map.put("title", getTagValue("title",eElement)); //공고제목
					map.put("jobType", getTagValue("job-type",eElement)); //근무형태
					map.put("exLevel", getTagValue("experience-level",eElement)); //경력
					map.put("level", getTagValue("required-education-level",eElement)); //학력
					map.put("salary", getTagValue("salary",eElement)); //연봉
					map.put("location", getTagValue("location", eElement)); //근무지역 
					//map.put("apply-cnt", getTagValue("apply-cnt", eElement)); //지원자 수
					map.put("opening", getTagValue("opening-timestamp", eElement)); //접수 시작일
					String endTime = getTagValue("expiration-timestamp", eElement);
					int endTimes = Integer.parseInt(endTime)/(24*60*60*1000);
					map.put("end", String.valueOf(endTimes)); //접수 마감일
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
	
	//사람인 공고 상세보기를 크롤링하기 위한 메소드
	public static Map<String, org.jsoup.nodes.Element> apiCrwaling(int id) throws ClientProtocolException, IOException {
		
		org.jsoup.nodes.Document doc4 = Jsoup.connect("http://www.saramin.co.kr/zf_user/jobs/relay/pop_view?rec_idx="+String.valueOf(id)).timeout(5000).get();
		
		org.jsoup.nodes.Element detail = null;
		org.jsoup.nodes.Element address = null;
		org.jsoup.nodes.Element compInfo = null;
		org.jsoup.nodes.Element logo = null;
		
		Map<String, org.jsoup.nodes.Element> map = new HashMap<>();
		
		try {
			detail = doc4.select("div.cont").get(1);
			address = doc4.select("div#map_0").get(0);
			compInfo = doc4.select("div.wrap_info").get(0);
			logo = doc4.select("div.logo").get(0);
		}catch(IndexOutOfBoundsException e) {
			
		}
		
		if(address != null) {
			//System.out.println("주소를 긁어왔느냐"+address.html());			
			map.put("address", address);
		}
		if(compInfo != null) {
			//System.out.println("기업정보를 긁어왔느냐"+compInfo.html());			
			map.put("compInfo", compInfo);
		}
		if(logo != null) {
			//System.out.println("기업로고를 긁어왔느냐"+logo.html());			
			map.put("logo", logo);
		}
		
		map.put("detail", detail);
		
		return map;
	}
	
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	/**
	 * 작성자 - 정지수
	 * 내용    - 익명게시판 페이징
	 */
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
//		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	
	//파일 리네임용
	public static String getRenamedFileName(String fname) {
		//확장자 분리
		String ext = fname.substring(fname.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rndNum = (int)(Math.random()*1000);
		return sdf.format(new Date())+"_"+rndNum+"."+ext;
		
	}
}