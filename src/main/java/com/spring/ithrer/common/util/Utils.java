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

			list = new ArrayList<Map<String,String>>();
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
					
					list.add(map);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public static org.jsoup.nodes.Element apiCrwaling(int id) throws ClientProtocolException, IOException {
		
		org.jsoup.nodes.Document doc4 = Jsoup.connect("http://www.saramin.co.kr/zf_user/jobs/relay/pop_view?rec_idx="+String.valueOf(id)).timeout(5000).get();
		
		org.jsoup.nodes.Element detail = doc4.select("div.cont").get(1);
		
		System.out.println("여기는 유틸즈 디테일src"+detail.text());
		System.out.println("여기는 유틸즈 디테일html"+detail.html());
		


		return detail;
	}
	
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
}
