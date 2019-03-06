package com.spring.ithrer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ithrer.user.model.vo.Member;

/**
 * 로그인하지않고 로그인시 인터셉터발동
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	Logger logger = Logger.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member==null){
			System.out.println("비로그인 상태에서 ["+request.getRequestURI()+"] 접근");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인후 이용하실 수 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/board/msg.jsp")
				   .forward(request, response);
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
