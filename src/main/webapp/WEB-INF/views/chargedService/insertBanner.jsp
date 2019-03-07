<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
#banner-container{
	margin: 0 auto;
	min-height: 500px;
}
</style>

<div id="banner-container">
	<div class="card">
		<div class="card-header"><h3>배너 신청</h3></div>
		<div class="card-body"></div>
	</div>
</div>


	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>