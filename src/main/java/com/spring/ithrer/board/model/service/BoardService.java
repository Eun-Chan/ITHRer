package com.spring.ithrer.board.model.service;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.board.model.vo.AnonyBoard;

public interface BoardService {

	List<Map<String, String>> anonyBoardList(int cPage, int numPerPage);
	
//	List<Map<String, String>> anonyBoardList(AnonyBoard anonyBoardNo);
	AnonyBoard anonyBoardSelectOne(int anonyBoardNo);

	int selectAnonyBoardTotalContents();

	int anonyBoardInsert(AnonyBoard anonyBoard);

}
