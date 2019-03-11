package com.spring.ithrer.chatbot.model.service;

import java.util.List;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

public interface ChatbotService {

	List<AnonyBoard> selectBoardList();

	List<PassBoard> selectPassBoardList();

}
