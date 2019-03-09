package com.spring.ithrer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ithrer.user.model.vo.Member;

public class BannerAdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member member = (Member)request.getSession().getAttribute("member");
		
		if(member == null || !member.getMemberId().equals("ithreradmin")) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "관리자가 아닙니다.");
			request.getRequestDispatcher("/WEB-INF/views/board/msg.jsp").forward(request, response);
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	
}
