<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />
<div class="job-searchDetail-Container">
	<div class="job-searchDetail-Header">
		<div class="searchDetail-Header">
			<a href="#" class="company-name">
				${selectOneJob.name }
			</a>
			<h1 class="company-title">
				${selectOneJob.title }
			</h1>
		</div>
	</div>
	<div class="searchDetail-summary">
		<div class="searchDetail-cont">
			<div class="searchDetail-content">
				<dl>
					<dt>경력</dt>
					<dd>${selectOneJob.exLevel }</dd>
				</dl>
				<dl>					
					<dt>학력</dt>
					<dd>${selectOneJob.level }</dd>
				</dl>
				<dl>
					<dt>급여</dt>
					<dd>${selectOneJob.salary }</dd>
				</dl>
			</div>
					<div class="searchDetail-content">
				<dl>
					<dt>근무형태</dt>
					<dd>${selectOneJob.jobType }</dd>
				</dl>
				<dl>					
					<dt>근무지역</dt>
					<dd>${selectOneJob.location }</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="notice-container">
		${doc}
	</div>
</div>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
