package com.spring.ithrer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ithrer.board.model.service.BoardService;
import com.spring.ithrer.board.model.vo.PassBoard;
import com.spring.ithrer.user.model.vo.Member;

public class passBoardUpdateCheckInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	BoardService boardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int parameter = Integer.parseInt(request.getParameter("passBoardNo"));
		PassBoard board = boardService.passBoardSelectOne(parameter);
		if(board.getPassBoardNo() != parameter) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.getRequestDispatcher("/WEB-INF/views/board/msg.jsp")
				   .forward(request, response);
			return false;
		}
		return super.preHandle(request, response, handler);
	}
	


	
	

}
