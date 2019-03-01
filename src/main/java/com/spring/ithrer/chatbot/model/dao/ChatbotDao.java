package com.spring.ithrer.chatbot.model.dao;

import java.util.List;

import com.spring.ithrer.board.model.vo.AnonyBoard;

public interface ChatbotDao {

	List<AnonyBoard> selectBoardList();
}
