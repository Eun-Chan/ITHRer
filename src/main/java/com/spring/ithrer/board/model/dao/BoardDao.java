package com.spring.ithrer.board.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

public interface BoardDao {

	List<Map<String, String>> anonyBoardList(int cPage, int numPerPage);
	
	AnonyBoard anonyBoardSelectOne(int anonyBoardNo);

	int anonyBoardTotalContents();

	int anonyBoardInsert(AnonyBoard anonyBoard);

	List<Map<String, String>> passBoardList(int cPage, int numPerPage);

	int passBoardTotalContents();

	PassBoard passBoardSelectOne(int passBoardNo);

	int passBoardInsert(PassBoard passBoard);

	
	List<Map<String, String>> searchAnonyListAll(int cPage, int numPerPage, String searchOption, String keyword);

	int countAnonyList(String searchOption, String keyword);

	
	List<Map<String, String>> searchPassListAll(int cPage, int numPerPage, String searchOption, String keyword);

	int countPassList(String searchOption, String keyword);

	//int anonyBoardDelete(int no);

	
	int anonyBoardDelete(int no);

	int passBoardDelete(int passBoardNo);

}
