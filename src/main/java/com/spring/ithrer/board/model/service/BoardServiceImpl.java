package com.spring.ithrer.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.board.model.dao.BoardDao;
import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao BoardDao;

	@Override
	public List<Map<String, String>> anonyBoardList(int cPage, int numPerPage) {
		return BoardDao.anonyBoardList(cPage, numPerPage);
	}

	@Override
	public int selectAnonyBoardTotalContents() {
		return BoardDao.anonyBoardTotalContents();
	}

	@Override
	public AnonyBoard anonyBoardSelectOne(int anonyBoardNo) {
		return BoardDao.anonyBoardSelectOne(anonyBoardNo);
	}

	@Override
	public int anonyBoardInsert(AnonyBoard anonyBoard) {
		return BoardDao.anonyBoardInsert(anonyBoard);
	}

	
	@Override
	public List<Map<String, String>> passBoardList(int cPage, int numPerPage) {
		return BoardDao.passBoardList(cPage, numPerPage);
	}

	@Override
	public int selectPassBoardTotalContents() {
		return BoardDao.passBoardTotalContents();
	}

	@Override
	public PassBoard passBoardSelectOne(int passBoardNo) {
		return BoardDao.passBoardSelectOne(passBoardNo);
	}

	@Override
	public int passBoardInsert(PassBoard passBoard) {
		return BoardDao.passBoardInsert(passBoard);
	}

	
	@Override
	public List<Map<String, String>> searchAnonyListAll(int cPage, int numPerPage, String searchOption, String keyword) {
		return BoardDao.searchAnonyListAll(cPage, numPerPage, searchOption, keyword);
	}

	@Override
	public int countAnonyList(String searchOption, String keyword) {
		return BoardDao.countAnonyList(searchOption, keyword);
	}

	@Override
	public List<Map<String, String>> searchPassListAll(int cPage, int numPerPage, String searchOption, String keyword) {
		return BoardDao.searchPassListAll(cPage, numPerPage, searchOption, keyword);
	}

	@Override
	public int countPassList(String searchOption, String keyword) {
		return BoardDao.countPassList(searchOption, keyword);
	}

	@Override
	public int anonyBoardDelete(int no) {
		return BoardDao.anonyBoardDelete(no);
	}

	@Override
	public int passBoardDelete(int passBoardNo) {
		return BoardDao.passBoardDelete(passBoardNo);
	}
	
	
}
