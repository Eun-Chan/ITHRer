package com.spring.ithrer.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

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
//		System.out.println("BoardDao -anony: oneInfo = "+oneInfo);
//		System.out.println("BoardDao -anony : anonyBoardNo = "+anonyBoardNo);
		
		return oneInfo;
	}

	@Override
	public int anonyBoardInsert(AnonyBoard anonyBoard) {
		int anonyInsert = sqlSession.insert("anonyboard.insertAnonyBoard", anonyBoard);
		
		return anonyInsert;
	}

	
	@Override
	public List<Map<String, String>> passBoardList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		List<Map<String, String>> result = sqlSession.selectList("passboard.selectPassBoardList", null, rowBounds);
		return result;
	}

	@Override
	public int passBoardTotalContents() {
		int result = sqlSession.selectOne("passboard.selectPassBoardTotalContents");
		return result;
		}

	@Override
	public PassBoard passBoardSelectOne(int passBoardNo) {
		PassBoard oneInfo = sqlSession.selectOne("passboard.selectPassBoardOne", passBoardNo);
//		System.out.println("BoardDao -pass: oneInfo = "+oneInfo);
//		System.out.println("BoardDao -pass: passBoardNo = "+passBoardNo);
		return oneInfo;
	}

	@Override
	public int passBoardInsert(PassBoard passBoard) {
		int passInsert = sqlSession.insert("passboard.insertPassBoard", passBoard);
		return passInsert;
	}

	@Override
	public List<Map<String, String>> searchAnonyListAll(int cPage, int numPerPage, String searchOption, String keyword) {
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
//		List<Map<String, String>> result = sqlSession.selectList("anonyboard.selectAnonyBoardList", null, rowBounds);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
//		System.out.println("여기오냐siba");
//		System.out.println("BoardDao-SALA="+searchOption);
//		System.out.println("BoardDao-SALA="+keyword);
//		System.out.println("BoardDao-SALA="+map);
		
		return sqlSession.selectList("anonyboard.anonySearchList", map, rowBounds);
	}

	@Override
	public int countAnonyList(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
//		System.out.println("여기오냐siba");
//		System.out.println("BoardDao-CAL="+searchOption);
//		System.out.println("BoardDao-CAL="+keyword);
//		System.out.println("BoardDao-CAL="+map);

		return sqlSession.selectOne("anonyboard.countAnonyList", map);
		
	}

	@Override
	public List<Map<String, String>> searchPassListAll(int cPage, int numPerPage, String searchOption, String keyword) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("passboard.passSearchList", map, rowBounds);
	}

	@Override
	public int countPassList(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("passboard.countPassList", map);
	}
	
	@Override
	public int anonyBoardDelete(int no) {
		int result = sqlSession.delete("anonyboard.anonyBoardDelete", no);
		
		return result;
	}

	@Override
	public int passBoardDelete(int passBoardNo) {
		int result = sqlSession.delete("passboard.passBoardDelete", passBoardNo);
		
		return result;
	}

	@Override
    public void updateAnonyViewCount(int anonyBoardNo){
      sqlSession.update("anonyboard.anonyBoardReadCount", anonyBoardNo);
    }
	
	@Override
    public void updatePassViewCount(int passBoardNo){
      sqlSession.update("passboard.passBoardReadCount", passBoardNo);
    }

	@Override
	public int autoDelete() {
		return sqlSession.delete("anonyboard.autoDelete");
	}
	
}
