package com.spring.ithrer.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.board.model.service.BoardService;
import com.spring.ithrer.board.model.vo.AnonyBoard;
import com.spring.ithrer.board.model.vo.PassBoard;

@Controller
public class BoardController { 
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BoardService boardService;
	
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
		
		AnonyBoard anonyBoard = new AnonyBoard();
		
		anonyBoard = boardService.anonyBoardSelectOne(anonyBoardNo);
		
//		String oneInfo = BoardService.anonyBoardSelectOne(anonyBoardNo);
//		mav.addObject("anonyBoardNo", anonyBoardNo);
//		mav.addObject("oneInfo", oneInfo);
		mav.addObject("anonyBoard", anonyBoard);
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
	public ModelAndView passBoardView(@RequestParam("no") int passBoardNo, ModelAndView mav) {
		logger.info("Controller : passBoardNo 전 ="+passBoardNo);
		
		PassBoard passBoard = new PassBoard();
		
		passBoard = boardService.passBoardSelectOne(passBoardNo);
		
		mav.addObject("passBoard", passBoard);
		mav.setViewName("board/anonyBoardView");
		
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
		mav.setViewName("board/anonyBoardList");

		System.out.println("-----Controller : ABS ="+list);
		System.out.println("-----Controller : ABS ="+totalContents);
		logger.info("controller - abs:searchOption="+searchOption);
		logger.info("controller - abs:searchOption="+keyword);
		
		return mav;
	}
	
	
}
