package com.spring.ithrer.chatbot.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.ithrer.chatbot.model.vo.Keyboard;
import com.spring.ithrer.chatbot.model.vo.Message;
import com.spring.ithrer.chatbot.model.vo.MessageButton;
import com.spring.ithrer.chatbot.model.vo.RequestMessage;
import com.spring.ithrer.chatbot.model.vo.ResponseMessage;
import com.spring.ithrer.command.ICommand;
import com.spring.ithrer.command.RecruitmentCommand;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.service.IndexService;

@RestController
public class ChatbotController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IndexService indexService;
	
	ICommand command;
	
	/**
	 * 카카오톡 플러스친구에 나올 최초의 화면 메뉴
	 */
	@RequestMapping(value="/keyboard")
	public Keyboard keyboard() {
		return new Keyboard(btn_init(0));
	}
	
	/**
	 * 메뉴에서 버튼을 누르고 난 후 , 메시지 처리 및 새로운 버튼 구성
	 */
	@RequestMapping(value="/message" , method=RequestMethod.POST)
	public ResponseMessage message(@RequestBody RequestMessage req) {	//@RequestBody ==> Http 요청 몸체를 자바 객체로 변환
		
		ResponseMessage res = new ResponseMessage();
		Message msg = new Message();
		
		if(req.getContent().equals("채용 공고")) {
			res.setKeyboard(new Keyboard(btn_init(1)));
			msg.setText(req.getContent());
		}
		
		// 사용자가 최근 공고를 클릭했을 때
		else if(req.getContent().equals("최근 공고")) {
						
			String result = "";
			// 최근 공고 6개 가져오기
			List<Recruitment> recruitment = indexService.selectListRecruitment("");
			
			for(int i = 0 ; i < recruitment.size(); i++) {
				Recruitment rec = recruitment.get(i);
				result += String.valueOf(i+1)+". " + rec.getCompName() + "\n"
					    + "모집분야 : " + rec.getRecruitmentTitle() + "\n\n"
					    + "지원자격" + "\n"
					    + "(하트뿅)(외계인녀)(윙크)\n"
					    + "경력 : " + rec.getCareer() + "\n"
					    + "고용형태 : " + rec.getEmploymentType() + "\n"
					    + "학력 : " + rec.getEducation() + "\n"
					    + "급여 : " + rec.getPayCondition() + "\n"
					    + "우대 : " + rec.getEmploymentPreference() + "\n"
					    + "지역 : " + rec.getLocation() + "\n"
					    + "접수 시작일 : " + rec.getOpeningDate() + "\n"
					    + "접수 마감일 : " + rec.getClosingDate() + "\n"
					    + "ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\n\n";
			}
			
			res.setKeyboard(new Keyboard(btn_init(1)));
			msg.setText(result);
		}
		
		// 사용자가 인기 공고를 클릭했을 때
		else if(req.getContent().equals("인기 공고")) {
			
			String result = "";
			// 인기 공고 6개 가져오기
			List<Recruitment> recruitment = indexService.selectTopListRecruitment("");
			
			for(int i = 0 ; i < recruitment.size(); i++) {
				Recruitment rec = recruitment.get(i);
				result += String.valueOf(i+1)+". " + rec.getCompName() + "\n"
					    + "모집분야 : " + rec.getRecruitmentTitle() + "\n\n"
					    + "지원자격" + "\n"
					    + "(하트뿅)(외계인녀)(윙크)\n"
					    + "경력 : " + rec.getCareer() + "\n"
					    + "고용형태 : " + rec.getEmploymentType() + "\n"
					    + "학력 : " + rec.getEducation() + "\n"
					    + "급여 : " + rec.getPayCondition() + "\n"
					    + "우대 : " + rec.getEmploymentPreference() + "\n"
					    + "지역 : " + rec.getLocation() + "\n"
					    + "접수 시작일 : " + rec.getOpeningDate() + "\n"
					    + "접수 마감일 : " + rec.getClosingDate() + "\n"
					    + "ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\n\n";
			}
			
			res.setKeyboard(new Keyboard(btn_init(1)));
			msg.setText(result);
		}
		
		// 채용 캘린더
		else if(req.getContent().equals("채용 달력")) {
			// 채용 달려 보여 줘 보리기
			res.setKeyboard(new Keyboard(btn_init(0)));
			
			// 채용 달력 메세지 버튼
			MessageButton msgBtn = new MessageButton();
			msgBtn.setLabel("ITHRer");
			msgBtn.setUrl("http://52.78.61.219:8080/ITHRer/calendar.ithrer");
			msg.setMessage_button(msgBtn);
			msg.setText("채용 정보 캘린더");
		}
		
		// 처음으로
		else if(req.getContent().equals("처음으로")) {
			res.setKeyboard(new Keyboard(btn_init(0)));
			msg.setText(req.getContent());
		}
		
		res.setMessage(msg);
		return res;
	}
	
	/**
	 * 메뉴 메소드
	 */
	public String[] btn_init(int idx) {
		if(idx == 0) {
			String[] btn = {"채용 공고","채용 달력","사용법","공지사항"};
			return btn;
		}
		else if(idx == 1) {
			String[] btn = {"최근 공고","인기 공고","처음으로"};
			return btn;
		}
		
		return null;
	}
}
