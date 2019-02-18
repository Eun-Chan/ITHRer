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

@Controller
public class BoardController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BoardService boardService;
	
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
	
	@RequestMapping("/board/anonyBoardForm")
	public void anonyBoardForm(ModelAndView mav) {
		
	}
	
	@RequestMapping("/board/anonyBoardView")
	public ModelAndView anonyBoardView(@RequestParam("no") int anonyBoardNo, ModelAndView mav) {
		logger.info("Controller : anonyBoardNo 전 ="+anonyBoardNo);
		
		AnonyBoard anonyBoard = new AnonyBoard();
		
		anonyBoard = boardService.anonyBoardSelectOne(anonyBoardNo);
		
//		String oneInfo = BoardService.anonyBoardSelectOne(anonyBoardNo);
//		mav.addObject("anonyBoardNo", anonyBoardNo);
//		mav.addObject("oneInfo", oneInfo);
		mav.addObject("anonyBoard", anonyBoard);
		mav.setViewName("board/anonyBoardView");
		
//		logger.info("Controller : anonyBoardNo 후 ="+anonyBoardNo);
		logger.info("Controller : oneInfo 후 ="+anonyBoard);
		
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
	
	@RequestMapping("/board/anonyBoardInsert")
	public ModelAndView anonyBoardInsert(AnonyBoard anonyBoard, ModelAndView mav) {
		
		int result  = boardService.anonyBoardInsert(anonyBoard);
		
		logger.info("Controller : insertInfo = "+result);
		
		mav.addObject("result", result);
		mav.setViewName("board/anonyBoardInsert");
		
		return mav;
		
	}
}
