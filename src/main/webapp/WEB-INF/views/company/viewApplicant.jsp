<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div id="applicant-info-container" class="container">
	<button class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/company/index.ithrer?compId=${compId }'">되돌아가기</button>
	${member }

</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>