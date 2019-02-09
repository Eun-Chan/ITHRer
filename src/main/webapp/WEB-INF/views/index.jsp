<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css" />
	<img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" id="center-image" alt="스프링로고" />
<div id="job">
	<ul id ="list-open">
		<c:forEach items="${jobList }" var="map">
					<li class="open">
						<div class="content">
							<span>${map.name}</span>
							${map.title}
							${map.jobType}
							${map.exLevel}
							${map.salary}
						</div>
					</li>
		</c:forEach>	
	</ul>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>