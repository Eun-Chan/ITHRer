package com.spring.ithrer.board.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

public interface BoardDao {
	//익명게시판 리스트 / 글정보 하나보기 / 총 리스트 갯수 / 익명-글쓰기
	List<Map<String, String>> anonyBoardList(int cPage, int numPerPage);
	
	AnonyBoard anonyBoardSelectOne(int anonyBoardNo);

	int anonyBoardTotalContents();

	int anonyBoardInsert(AnonyBoard anonyBoard);
	
	//합소서게시판 리스트 / 글정보 하나보기 / 총 리스트 갯수 / 합소서 - 글쓰기
	List<Map<String, String>> passBoardList(int cPage, int numPerPage);

	int passBoardTotalContents();

	PassBoard passBoardSelectOne(int passBoardNo);

	int passBoardInsert(PassBoard passBoard);

	
	List<Map<String, String>> searchAnonyListAll(int cPage, int numPerPage, String searchOption, String keyword);

	int countAnonyList(String searchOption, String keyword);

	
	List<Map<String, String>> searchPassListAll(int cPage, int numPerPage, String searchOption, String keyword);

	int countPassList(String searchOption, String keyword);

	
	int anonyBoardDelete(int no);

	int passBoardDelete(int passBoardNo);

	void updateAnonyViewCount(int anonyBoardNo);

	void updatePassViewCount(int passBoardNo);

	
	int passBoardUpdate(PassBoard passBoard);

	
}
