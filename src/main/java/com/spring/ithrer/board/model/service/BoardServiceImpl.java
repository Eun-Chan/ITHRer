package com.spring.ithrer.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.board.model.dao.BoardDao;
import com.spring.ithrer.board.model.vo.AnonyBoard;

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

//	@Override
//	public List<Map<String, String>> anonyBoardList(AnonyBoard AnonyBoardNo) {
//		return BoardDao.anonyBoardList(AnonyBoardNo);
//	}

	@Override
	public AnonyBoard anonyBoardSelectOne(int anonyBoardNo) {
		return BoardDao.anonyBoardSelectOne(anonyBoardNo);
	}

	@Override
	public int anonyBoardInsert(AnonyBoard anonyBoard) {
		return BoardDao.anonyBoardInsert(anonyBoard);
	}
	
	
}
