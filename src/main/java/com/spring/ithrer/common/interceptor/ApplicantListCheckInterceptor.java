package com.spring.ithrer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ithrer.company.model.service.CompanyService;
import com.spring.ithrer.company.model.vo.Company;

public class ApplicantListCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	CompanyService companyService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Company com = (Company)request.getSession().getAttribute("companyLoggedIn");
		int recruitmentNo = Integer.parseInt(request.getParameter("recruitmentNo"));
		
		if(companyService.selectAppList(recruitmentNo) == null || !com.getCompId().equals(request.getParameter("compId"))) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.getRequestDispatcher("/WEB-INF/views/board/msg.jsp").forward(request, response);
			return false;
		}		
		return super.preHandle(request, response, handler);
	}

	
}
