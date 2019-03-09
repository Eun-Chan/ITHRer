package com.spring.ithrer.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ithrer.company.model.service.CompanyService;

public class ApplicantCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	CompanyService companyService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String compId = request.getParameter("compId");
		int recruitmentNo = Integer.parseInt(request.getParameter("recruitmentNo"));
		String memberId = request.getParameter("memberId");
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("recruitmentNo", recruitmentNo);
		map.put("memberId", memberId);
		map.put("compId", compId);

		if(!request.getSession().getAttribute("companyLoggedIn").equals(compId) || companyService.selectApplicant(map) == null ) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.getRequestDispatcher("/WEB-INF/views/board/msg.jsp").forward(request, response);
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
 
	
}
