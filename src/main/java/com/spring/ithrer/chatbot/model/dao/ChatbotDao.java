package com.spring.ithrer.chatbot.model.dao;

import java.util.List;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

public interface ChatbotDao {

	List<AnonyBoard> selectBoardList();

	List<PassBoard> selectPassBoardList();
}
