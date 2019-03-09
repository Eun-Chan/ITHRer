package com.spring.ithrer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.service.IndexService;

public class EndCheckInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	IndexService indexService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int recruitmentNo = Integer.parseInt(request.getParameter("no"));
		Recruitment rec = indexService.selectOneRecruitmentEndCheck(recruitmentNo);
		if(rec.getEnd().equals("Y") || rec==null) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "해당공고는 마감되었거나 존재하지 않는 공고입니다.");
			request.getRequestDispatcher("/WEB-INF/views/board/msg.jsp").forward(request, response);
			return false;
		}

		return super.preHandle(request, response, handler);
	}
	
}
