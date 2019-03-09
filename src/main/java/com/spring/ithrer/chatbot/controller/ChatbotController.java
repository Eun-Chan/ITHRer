package com.spring.ithrer.chatbot.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;
import com.spring.ithrer.chatbot.model.service.ChatbotService;
import com.spring.ithrer.chatbot.model.vo.ContextControl;
import com.spring.ithrer.chatbot.model.vo.ContextValue;
import com.spring.ithrer.chatbot.model.vo.Keyboard;
import com.spring.ithrer.chatbot.model.vo.Message;
import com.spring.ithrer.chatbot.model.vo.MessageButton;
import com.spring.ithrer.chatbot.model.vo.QuickReply;
import com.spring.ithrer.chatbot.model.vo.RequestMessage;
import com.spring.ithrer.chatbot.model.vo.ResponseMessage;
import com.spring.ithrer.chatbot.model.vo.SimpleText;
import com.spring.ithrer.chatbot.model.vo.UserRequest;
import com.spring.ithrer.command.ICommand;
import com.spring.ithrer.command.RecruitmentCommand;
import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.service.IndexService;

@RestController
public class ChatbotController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IndexService indexService;
	@Autowired
	ChatbotService chatbotService;
	
	ICommand command;
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ITHRer 챗봇 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	/**
	 * 최근 공고 (SimpleText 객체 사용)
	 */
	@RequestMapping(value="/recentAnnouncement")
	public SimpleText recentAnnouncement() {
		SimpleText simpleText = new SimpleText();
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
		result = result.replaceAll("null", "");
		simpleText.setText(result);
		return simpleText;
	}
	
	/**
	 * 인기 공고 (SimpleText 객체 사용)
	 */
	@RequestMapping(value="/popularAnnouncement")
	public SimpleText popularAnnouncement() {
		SimpleText simpleText = new SimpleText();
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
				    + "지원자 수 " + rec.getCount()+ "\n"
				    + "ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\n\n";
		}
		result = result.replaceAll("null", "");
		simpleText.setText(result);
		return simpleText;
	}
	
	/**
	 * 익명 게시판  
	 */
	@RequestMapping(value="/unknown")
	public SimpleText unknown() {
		SimpleText simpleText = new SimpleText();
		// 최신 익명 게시판 5개 받아오기
		List<AnonyBoard> boards = chatbotService.selectBoardList();
			
		String result = "";
		// 5개 정보 쫘악 뿌리기
		if(!boards.isEmpty()) {
			for(int i = 0 ; i < boards.size(); i++) {
				AnonyBoard board = boards.get(i);
				result += String.valueOf(i+1)+"\n"
						+ "제목 : " + board.getAnonyBoardTitle() + "\n"
						+ "작성자 : " + board.getAnonyBoardWriter() + "\n"
						+ "작성일 : " + board.getAnonyBoardDate() + "\n"
						+ "조회수 : " + board.getAnonyBoardReadCount() + "\n"
						+ "ㅡㅡㅡㅡㅡ내용ㅡㅡㅡㅡㅡ\n"
						+ board.getAnonyBoardContent()+"\n\n";
				}
				simpleText.setText(result);
		}
			// 익명 게시판이 empty 일 때
		else {
			simpleText.setText("익명 게시판 정보가 없습니다.");
		}
		return simpleText;
	}
	
	
	/**
	 * 합소서 게시판
	 */
	@RequestMapping(value="/introduction")
	public SimpleText introduction() {
		SimpleText simpleText = new SimpleText();
		// 최신 합소서 게시판 5개 받아오기
		List<PassBoard> boards = chatbotService.selectPassBoardList();
		
		String result = "";
		// 5개 정보 쫘악 뿌리기
		if(!boards.isEmpty()) {
			for(int i = 0 ; i < boards.size(); i++) {
				PassBoard board = boards.get(i);
				result += String.valueOf(i+1)+"\n"
						+ "제목 : " + board.getPassBoardTitle() + "\n"
						+ "작성자 : " + board.getPassBoardWriter() + "\n"
						+ "작성일 : " + board.getPassBoardDate() + "\n"
						+ "조회수 : " + board.getPassBoardReadCount() + "\n"
						+ "-----내용-----\n"
						+ board.getPassBoardContent()+"\n\n";
			}
			simpleText.setText(result);
		}
		else {
			simpleText.setText("합소서 게시판 정보가 없습니다.");
		}
		return simpleText;
	}
	
	/**
	 * 버튼 메뉴
	 */
	@RequestMapping(value="/buttonMenu")
	public ArrayList<QuickReply> buttonMenu(@RequestBody UserRequest req) {
		ArrayList<QuickReply> menu = new ArrayList<>();
		menu.add(new QuickReply("메뉴1", "message", "메뉴_1", "", null));
		menu.add(new QuickReply("메뉴2", "message", "메뉴_2", "", null));
		
		
		return menu;
	}
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ITHRer 챗봇 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
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
					    + "지원자 수 " + rec.getCount()+ "\n"
					    + "ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\n\n";
			}
			
			res.setKeyboard(new Keyboard(btn_init(1)));
			msg.setText(result);
		}
		
		// 채용 달력
		else if(req.getContent().equals("채용 달력")) {
			// 채용 달려 보여 줘 보리기
			res.setKeyboard(new Keyboard(btn_init(0)));
			
			// 채용 달력 메세지 버튼
			MessageButton msgBtn = new MessageButton();
			msgBtn.setLabel("채용 달력");
			msgBtn.setUrl("http://52.78.61.219:8080/ITHRer/calendar.ithrer");
			msg.setMessage_button(msgBtn);
			msg.setText("현재 채용 진행중인 IT회사들에 대한 정보를 캘린더 형태로 제공 해드립니다(하트)");
		}
		
		// ITHRer 게시판 정보
		else if(req.getContent().equals("ITHRer 게시판 정보")) {
			res.setKeyboard(new Keyboard(btn_init(2)));
			msg.setText(req.getContent());
		}
		
		// 익명 게시판
		else if(req.getContent().equals("익명 게시판")) {
			// 최신 익명 게시판 5개 받아오기
			List<AnonyBoard> boards = chatbotService.selectBoardList();
			
			String result = "";
			// 5개 정도 쫘악 뿌리기
			if(!boards.isEmpty()) {
				for(int i = 0 ; i < boards.size(); i++) {
					AnonyBoard board = boards.get(i);
					result += String.valueOf(i+1)+"\n"
						    + "제목 : " + board.getAnonyBoardTitle() + "\n"
						    + "작성자 : " + board.getAnonyBoardWriter() + "\n"
						    + "작성일 : " + board.getAnonyBoardDate() + "\n"
						    + "조회수 : " + board.getAnonyBoardReadCount() + "\n"
							+ "ㅡㅡㅡㅡㅡ내용ㅡㅡㅡㅡㅡ\n"
							+ board.getAnonyBoardContent()+"\n\n";
				}
				msg.setText(result);
			}
			// 익명 게시판이 empty 일 때
			else {
				msg.setText("익명 게시판 정보가 없습니다.");
			}
			res.setKeyboard(new Keyboard(btn_init(2)));
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
			String[] btn = {"채용 공고","채용 달력","ITHRer 게시판 정보","공지사항"};
			return btn;
		}
		else if(idx == 1) {
			String[] btn = {"최근 공고","인기 공고","처음으로"};
			return btn;
		}
		else if(idx == 2) {
			String[] btn = {"익명 게시판","합소서 게시판","처음으로"};
			return btn;
		}
		
		return null;
	}
}
