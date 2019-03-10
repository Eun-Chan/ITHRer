package com.spring.ithrer.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.ithrer.board.model.service.BoardService;
import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;
import com.spring.ithrer.board.model.vo.PassBoardComment;

@Controller
public class BoardController { 
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 익명게시판 리스트 페이지
	 */
	@RequestMapping("/board/anonyBoardList")
	public ModelAndView anonyBoardList(@RequestParam(value="cPage", defaultValue="1") int cPage , ModelAndView mav) {
		
		System.out.println("익명게시판 페이지");
		int numPerPage = 10;
		List<Map<String, String>> list = boardService.anonyBoardList(cPage, numPerPage);
//		System.out.println(list);
		
		int totalContents = boardService.selectAnonyBoardTotalContents();
		
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.setViewName("board/anonyBoardList");
		
//		System.out.println(list);
//		System.out.println(totalContents);
//		System.out.println(cPage);
//		System.out.println(numPerPage);
//		System.out.println(mav);
		
		return mav;
	}

	/**
	 * 익명게시판 글 하나 상세보기 페이지
	 */
	@RequestMapping("/board/anonyBoardView")
	public ModelAndView anonyBoardView(@RequestParam("no") int anonyBoardNo, ModelAndView mav) {
//		logger.info("Controller : anonyBoardNo 전 ="+anonyBoardNo);
		
	    AnonyBoard anonyBoard = boardService.anonyBoardSelectOne(anonyBoardNo);
		
//		String oneInfo = BoardService.anonyBoardSelectOne(anonyBoardNo);
//		mav.addObject("anonyBoardNo", anonyBoardNo);
//		mav.addObject("oneInfo", oneInfo);
		mav.addObject("anonyBoard", anonyBoard);
		//mav.addObject("anonyBoardRealNo", anonyBoardRealNo);
		
		mav.setViewName("board/anonyBoardView");
		
//		logger.info("Controller : anonyBoardNo 후 ="+anonyBoardNo);
//		logger.info("Controller : oneInfo 후 ="+anonyBoard);
		
//		logger.info("Controller : list 후 ="+list+"");
//		List<Map<String, String>> list = BoardService.anonyBoardList(AnonyBoardNo);
		
//		mav.addObject("AnonyBoardNo", AnonyBoardNo);
//		mav.addObject("list", list);
//		mav.setViewName("board/anonyBoardView");
//		
//		System.out.println("Controller : AnonyBoardNo = "+AnonyBoardNo);
//		System.out.println("Controller : List = "+list);
		
		return mav;
	}
	
	/**
	 * 익명게시판 글쓰기 페이지
	 */
	@RequestMapping("/board/anonyBoardInsertContent")
	public ModelAndView anonyBoardInsert(AnonyBoard anonyBoard, ModelAndView mav) {
		
		System.out.println("암호화전: "+anonyBoard.getAnonyBoardPassword());
		String temp = anonyBoard.getAnonyBoardPassword();
		//BCrypt 방식 암호화
		anonyBoard.setAnonyBoardPassword(bcryptPasswordEncoder.encode(temp));
		System.out.println("암호화후: "+anonyBoard.getAnonyBoardPassword());
		
		System.out.println("anonyBoard = "+anonyBoard);
		int result  = boardService.anonyBoardInsert(anonyBoard);
		
//		logger.info("Controller : insertInfo = "+result);
		
		mav.addObject("result", result);
		mav.setViewName("redirect:/board/anonyBoardList");
		
		return mav;
	}
	/**
	 * 익명게시판 글쓰기 이동 페이지
	 */
	@RequestMapping("/board/anonyBoardInsert")
	public void anonyBoardInsertView(ModelAndView mav) {
	}
	
	/**
	 * 합소서 게시판 리스트 페이지
	 */
	@RequestMapping("/board/passBoardList")
	public ModelAndView passBoardList(@RequestParam(value="cPage", defaultValue="1") int cPage , ModelAndView mav) {
		
		System.out.println("합소서 게시판 페이지");
		int numPerPage = 10;
		List<Map<String, String>> list = boardService.passBoardList(cPage, numPerPage);
		
		int totalContents = boardService.selectPassBoardTotalContents();
		
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.setViewName("board/passBoardList");
		
		return mav;
	}

	/**
	 * 합소서 글 하나 상세보기 페이지
	 */
	@RequestMapping("/board/passBoardView")
	public ModelAndView passBoardView(@RequestParam("no") int passBoardNo,  ModelAndView mav) {
//		logger.info("Controller : passBoardNo 전 ="+passBoardNo);
		
		PassBoard passBoard = new PassBoard();
		
		passBoard = boardService.passBoardSelectOne(passBoardNo);
		
		List<PassBoardComment> list = boardService.passBoardCommentList(passBoardNo);
		
		System.out.println("Controller PassBoardView ="+list);
		
		mav.addObject("list", list);
		mav.addObject("passBoard", passBoard);
		mav.setViewName("board/passBoardView");
		
//		logger.info("Controller -pass : oneInfo 후 ="+passBoard);
		
		return mav;
	}
	
	/**
	 * 합소서 게시판 글쓰기 페이지
	 */
	@RequestMapping("/board/passBoardInsertContent")
	public ModelAndView passBoardInsert(PassBoard passBoard, ModelAndView mav) {
		
		int result  = boardService.passBoardInsert(passBoard);
		
		logger.info("Controller : insertInfo = "+result);
		
		mav.addObject("result", result);
		mav.setViewName("redirect:/board/passBoardList");
		
		return mav;
	}
	
	@RequestMapping("board/passBoardInsert")
	public void passBoardInsertView(ModelAndView mav) {
		
	}
	
	/**
	 * 익명게시판 게시판 ★검색&결과 리스트로 리턴 페이지
	 */
	@RequestMapping("board/anonyBoardSearch")
	public ModelAndView anonyBoardSearch(@RequestParam(defaultValue="anonyBoardTitle")String searchOption,
										   @RequestParam(defaultValue="")String keyword, 
										   @RequestParam(value="cPage", defaultValue="1") int cPage , ModelAndView mav) {
		
		int numPerPage = 10;
		List<Map<String, String>> list = boardService.searchAnonyListAll(cPage, numPerPage, searchOption, keyword);
		int totalContents = boardService.countAnonyList(searchOption, keyword);
		
		mav.addObject("searchOPtion", searchOption);
		mav.addObject("keyword", keyword);
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.setViewName("board/anonyBoardList");

		System.out.println("-----Controller : ABS ="+list);
		System.out.println("-----Controller : ABS ="+totalContents);
		logger.info("controller - abs:searchOption="+searchOption);
		logger.info("controller - abs:searchOption="+keyword);
		
		return mav;
	}
	
	/**
	 * 합소서 게시판 ★검색&결과 리스트로 리턴 페이지
	 */
	@RequestMapping("board/passBoardSearch")
	public ModelAndView passBoardSearch(@RequestParam(defaultValue="passBoardTitle")String searchOption,
										   @RequestParam(defaultValue="")String keyword, 
										   @RequestParam(value="cPage", defaultValue="1") int cPage , ModelAndView mav) {
		
		int numPerPage = 10;
		List<Map<String, String>> list = boardService.searchPassListAll(cPage, numPerPage, searchOption, keyword);
		int totalContents = boardService.countPassList(searchOption, keyword);
		
		mav.addObject("searchOPtion", searchOption);
		mav.addObject("keyword", keyword);
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.setViewName("board/passBoardList");

		System.out.println("-----Controller : ABS ="+list);
		System.out.println("-----Controller : ABS ="+totalContents);
		logger.info("controller - abs:searchOption="+searchOption);
		logger.info("controller - abs:searchOption="+keyword);
		
		return mav;
	}
	
	@RequestMapping("board/anonyBoardDelete")
	public void anonyBoardDeleteMove(HttpServletResponse response, @RequestParam("anonyBoardNo") int no, @RequestParam("password")String password) {

		
		Gson gson = new Gson();
		AnonyBoard anonyBoard = boardService.anonyBoardSelectOne(no);

		int result =0;
		if(bcryptPasswordEncoder.matches(password, anonyBoard.getAnonyBoardPassword())) {
			result = boardService.anonyBoardDelete(no);
		}
		try {
			gson.toJson(result,response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("board/passBoardDelete")
	public void passBoardDeleteMove(HttpServletResponse response, @RequestParam("passBoardNo") int passBoardNo) {
		
		Gson gson = new Gson();
		PassBoard passBoard = boardService.passBoardSelectOne(passBoardNo);

		int result = 0;
			result = boardService.passBoardDelete(passBoardNo);
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/board/passBoardMoveUpdate")
	public ModelAndView passBoardMoveUpdate(@RequestParam("passBoardNo") int passBoardNo, ModelAndView mav) {
		
		PassBoard passBoard = boardService.passBoardSelectOne(passBoardNo);
		
		mav.addObject("passBoard", passBoard);
		mav.setViewName("board/passBoardUpdate");

		System.out.println("Controller passBoardUpdate - passBoard : "+passBoard);
		
		return mav;
		
	}
	
	@RequestMapping("/board/passBoardUpdate")
	public ModelAndView passBoardUpdate(PassBoard passBoard, ModelAndView mav) {
		
		int result = boardService.passBoardUpdate(passBoard);
		
		mav.addObject("result", result);
		mav.addObject("passBoard", passBoard);
		mav.setViewName("redirect:/board/passBoardList");
		
		System.out.println("Controller passBoardUpdate - passBoard : "+passBoard);
		System.out.println("Controller passBoardUpdate - result : "+result);
		
		return mav;
		
	}
	
//	@RequestMapping("board/passBoardAddComment.ithrer")
//	public ModelAndView passBoardAddComment(PassBoardComment comment, ModelAndView mav) {
//		
//		int result = 0;
//		result = boardService.passBoardAddComment(comment);
//		
//		mav.addObject("result", result);
//		mav.setViewName("redirect:/board/passBoardView");
//		
//		return mav;
//
//	}
	
	@RequestMapping("board/passBoardAddComment.ithrer")
	public ModelAndView passBoardAddComment(@RequestParam(value="pbBoardRef")int pbBoardRef, PassBoardComment comment, ModelAndView mav) {
		
		int result = 0;
		result = boardService.passBoardAddComment(comment);
		
		PassBoard passBoard = boardService.passBoardSelectOne(pbBoardRef);
		
		mav.addObject("passBoard", passBoard);
		mav.addObject("result", result);
		mav.setViewName("redirect:/board/passBoardView?no="+pbBoardRef);
		
		return mav;

	}
	
	@RequestMapping("board/passBoardDeleteComment.ithrer")
	public ModelAndView passBoardDeleteComment(@RequestParam(value="pbBoardRef")int pbBoardRef,
											   @RequestParam(value="pbCommentNo")int pbCommentNo ,
											   PassBoardComment comment, ModelAndView mav) {
		
		int result = 0;
		result = boardService.passBoardDeleteComment(comment);
		
		PassBoard passBoard = boardService.passBoardSelectOne(pbBoardRef);
		
		mav.addObject("passBoard", passBoard);
		mav.addObject("result", result);
		mav.setViewName("redirect:/board/passBoardView?no="+pbBoardRef);
		
		return mav;
	}
	
}
