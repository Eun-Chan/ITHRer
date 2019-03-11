package com.spring.ithrer.chatbot.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

@Repository
public class ChatbotDaoImpl implements ChatbotDao {
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<AnonyBoard> selectBoardList() {
		return sqlSession.selectList("chatbot.selectBoardList");
	}

	@Override
	public List<PassBoard> selectPassBoardList() {
		return sqlSession.selectList("chatbot.selectPassBoardList");
	}	
}
