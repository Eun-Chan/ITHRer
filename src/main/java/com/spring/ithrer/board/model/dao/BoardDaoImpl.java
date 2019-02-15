package com.spring.ithrer.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ithrer.board.model.vo.AnonyBoard;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> anonyBoardList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		List<Map<String, String>> result = sqlSession.selectList("anonyboard.selectAnonyBoardList", null, rowBounds);
		
//		System.out.println(result);
		return result;
	}

	@Override
	public int anonyBoardTotalContents() {
		int result = sqlSession.selectOne("anonyboard.selectAnonyBoardTotalContents");
//		System.out.println(result);
		return result;
	}

	@Override
	public AnonyBoard anonyBoardSelectOne(int anonyBoardNo) {
		AnonyBoard oneInfo = sqlSession.selectOne("anonyboard.selectAnonyBoardOne", anonyBoardNo);
		System.out.println("BoardDao: oneInfo = "+oneInfo);
		System.out.println("BoardDao: anonyBoardNo = "+anonyBoardNo);
		
		return oneInfo;
	}

	@Override
	public int anonyBoardInsert(AnonyBoard anonyBoard) {
		int anonyInsert = sqlSession.insert("anonyboard.insertAnonyBoard", anonyBoard);
		
		return anonyInsert;
	}
	
	
}
