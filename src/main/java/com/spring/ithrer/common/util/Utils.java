package com.spring.ithrer.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
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
			System.out.println("Root element:"+doc.getDocumentElement().getNodeName());
			
			NodeList nList = doc.getElementsByTagName("job");
			System.out.println("파싱할 리스트 수 : "+nList.getLength());

			list = new ArrayList<Map<String,String>>();
			
			NodeList nList2 = doc.getElementsByTagName("jobs");
			String total = nList2.item(0).getAttributes().getNamedItem("total").getNodeValue();
			System.out.println("totalcontent!!!!!!!!!!="+total);
			
			map.put("totlaContent", total);
			list.add(map);
			
			for(int i = 0 ; i<nList.getLength() ; i++) {
				map = new HashMap<String, String>();
				Node nNode = nList.item(i);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
//					System.out.println("####################");
//					System.out.println(i);
//					System.out.println("공고ID:"+getTagValue("id", eElement));
//					System.out.println("기업명 :"+ getTagValue("name",eElement));
//					System.out.println("공고 제목 :"+ getTagValue("title",eElement));
//					System.out.println("근무형태 :"+ getTagValue("job-type",eElement));
//					System.out.println("경력 : "+getTagValue("experience-level", eElement));
//					System.out.println("학력 : "+getTagValue("required-education-level", eElement));
//					System.out.println("연봉 : "+getTagValue("salary", eElement));
//					System.out.println("마감일시 :"+getTagValue("expiration-date", eElement));
//					System.out.println(getTagValue("expiration-date", eElement).substring(0,10));
					
					map.put("id", getTagValue("id", eElement));
					map.put("name", getTagValue("name",eElement));
					map.put("title", getTagValue("title",eElement));
					map.put("jobType", getTagValue("job-type",eElement));
					map.put("exLevel", getTagValue("experience-level",eElement));
					map.put("level", getTagValue("required-education-level",eElement));
					map.put("salary", getTagValue("salary",eElement));
					map.put("opening", getTagValue("opening-timestamp", eElement)); //접수 시작일
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
			System.out.println("Root element:"+doc.getDocumentElement().getNodeName());
			
			NodeList nList = doc.getElementsByTagName("job");
			System.out.println("파싱할 리스트 수 : "+nList.getLength());
			
			for(int i = 0 ; i<nList.getLength() ; i++) {
				map = new HashMap<String, String>();
				Node nNode = nList.item(i);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
//					System.out.println("####################");
//					System.out.println(i);
//					System.out.println("공고ID:"+getTagValue("id", eElement));
//					System.out.println("기업명 :"+ getTagValue("name",eElement));
//					System.out.println("공고 제목 :"+ getTagValue("title",eElement));
//					System.out.println("근무형태 :"+ getTagValue("job-type",eElement));
//					System.out.println("경력 : "+getTagValue("experience-level", eElement));
//					System.out.println("학력 : "+getTagValue("required-education-level", eElement));
//					System.out.println("연봉 : "+getTagValue("salary", eElement));
//					System.out.println("마감일시 :"+getTagValue("expiration-date", eElement));
//					System.out.println(getTagValue("expiration-date", eElement).substring(0,10));
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
		
		try {
			detail = doc4.select("div.cont").get(1);
			address = doc4.select("div#map_0").get(0);
			compInfo = doc4.select("div.wrap_info").get(0);
			logo = doc4.select("div.logo").get(0);
		}catch(IndexOutOfBoundsException e) {
			
		}
		
		//System.out.println("여기는 유틸즈 디테일src"+detail.text());
		//System.out.println("여기는 유틸즈 디테일html"+detail.html());
//		if(address != null) {
//			System.out.println("주소를 긁어왔느냐"+address.html());			
//		}
		if(compInfo != null) {
			System.out.println("기업정보를 긁어왔느냐"+compInfo.html());			
		}
		if(logo != null) {
			System.out.println("기업로고를 긁어왔느냐"+logo.html());			
		}
		
		Map<String, org.jsoup.nodes.Element> map = new HashMap<>();
		map.put("detail", detail);
		map.put("address", address);
		map.put("compInfo", compInfo);
		map.put("logo", logo);
		
		return map;
	}
	
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
}
