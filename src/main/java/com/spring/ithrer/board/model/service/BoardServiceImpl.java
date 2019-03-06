package com.spring.ithrer.board.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.board.model.dao.BoardDao;
import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;

	@Override
	public List<Map<String, String>> anonyBoardList(int cPage, int numPerPage) {
		return boardDao.anonyBoardList(cPage, numPerPage);
	}

	@Override
	public int selectAnonyBoardTotalContents() {
		return boardDao.anonyBoardTotalContents();
	}

	@Override
	public AnonyBoard anonyBoardSelectOne(int anonyBoardNo)  {
		//익명게시판 조회수 쿼리를 익명게시판 글 하나 보기에 끼워넣기
		boardDao.updateAnonyViewCount(anonyBoardNo);
		return boardDao.anonyBoardSelectOne(anonyBoardNo);
	}

	@Override
	public int anonyBoardInsert(AnonyBoard anonyBoard) {
		return boardDao.anonyBoardInsert(anonyBoard);
	}

	
	@Override
	public List<Map<String, String>> passBoardList(int cPage, int numPerPage) {
		return boardDao.passBoardList(cPage, numPerPage);
	}

	@Override
	public int selectPassBoardTotalContents() {
		return boardDao.passBoardTotalContents();
	}

	@Override
	public PassBoard passBoardSelectOne(int passBoardNo) {
		//합소서게시판 조회수 쿼리를 합소서게시판 글 하나 보기에 끼워넣기
		boardDao.updatePassViewCount(passBoardNo);
		return boardDao.passBoardSelectOne(passBoardNo);
	}

	@Override
	public int passBoardInsert(PassBoard passBoard) {
		return boardDao.passBoardInsert(passBoard);
	}

	
	@Override
	public List<Map<String, String>> searchAnonyListAll(int cPage, int numPerPage, String searchOption, String keyword) {
		return boardDao.searchAnonyListAll(cPage, numPerPage, searchOption, keyword);
	}

	@Override
	public int countAnonyList(String searchOption, String keyword) {
		return boardDao.countAnonyList(searchOption, keyword);
	}

	@Override
	public List<Map<String, String>> searchPassListAll(int cPage, int numPerPage, String searchOption, String keyword) {
		return boardDao.searchPassListAll(cPage, numPerPage, searchOption, keyword);
	}

	@Override
	public int countPassList(String searchOption, String keyword) {
		return boardDao.countPassList(searchOption, keyword);
	}

	@Override
	public int anonyBoardDelete(int no) {
		return boardDao.anonyBoardDelete(no);
	}

	@Override
	public int passBoardDelete(int passBoardNo) {
		return boardDao.passBoardDelete(passBoardNo);
	}

	@Override
	public int passBoardUpdate(PassBoard passBoard) {
		return boardDao.passBoardUpdate(passBoard);
	}

	
}
