package com.spring.ithrer.chatbot.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.chatbot.model.dao.ChatbotDao;

@Service
public class ChatbotServiceImpl implements ChatbotService {
		
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ChatbotDao chatbotDao;

	@Override
	public List<AnonyBoard> selectBoardList() {
		return chatbotDao.selectBoardList();
	}
}
