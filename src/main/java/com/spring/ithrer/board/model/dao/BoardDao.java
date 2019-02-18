package com.spring.ithrer.board.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.board.model.vo.AnonyBoard;

public interface BoardDao {

	List<Map<String, String>> anonyBoardList(int cPage, int numPerPage);
	
//	List<Map<String, String>> anonyBoardList(AnonyBoard AnonyBoardNo);
	AnonyBoard anonyBoardSelectOne(int anonyBoardNo);

	int anonyBoardTotalContents();

	int anonyBoardInsert(AnonyBoard anonyBoard);

}
