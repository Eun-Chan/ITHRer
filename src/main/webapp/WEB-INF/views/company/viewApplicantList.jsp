<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
div#all-container{
	width: 1000px;
}

/* border 두께 설정 */
div.border-top.border-bottom{
	border-width: 3px !important;
}

/* 이력서 읽은 지원자는 뿌옇게 처리 */
div[read=Y]{
	opacity: 0.4;
}

</style>

<div id="all-container" class="container my-4">

	
	<div class="container form-group my-5">
		<select id="recruitment-list" class="custom-select border-warning">
			<option value="now">${recruitment.recruitmentTitle}</option>
			<c:forEach var="rcrt" items="${rcrtList}">
				<option value="${rcrt.recruitmentNo }">${rcrt.recruitmentTitle }</option>
			</c:forEach>
		</select>
	</div>

	<div class="clearfix">
		<span class="float-left">총 ${applicantList.size() }명의 지원자가 있습니다.</span>
		<button class="btn btn-sm btn-primary float-right" onclick="location.href='${pageContext.request.contextPath}/company/index.ithrer?compId=${companyLoggedIn.compId }'">되돌아가기</button>
	</div>
	
	<div id="applicant-list-container" class="container my-2">
	
	<div class="row rounded border-top border-bottom border-primary text-center py-3 font-weight-bold d-flex flex-wrap align-items-center">
		<div class="col-sm-2">사진</div>
		<div class="col">지원자</div>
		<div class="col">학교</div>
		<div class="col">전공/학점</div>
		<div class="col">총 경력</div>
		<div class="col">희망연봉 (만원)</div>
		<div class="col">지원일</div>
	</div>
	<c:forEach var="app" items="${applicantList }">
	<div read="${app.ca.read }" class="row rounded border-bottom border-primary text-center py-3 d-flex flex-wrap align-items-center">
		<div class="col-sm-2">
			<c:if test="${empty app.photo }">
			<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" alt="이력서 사진 없는 회원 사진" width="50px" />
			</c:if>
			<c:if test="${not empty app.photo }">
			<img src="${pageContext.request.contextPath}/displayFile.ithrer?fileName=${app.photo }&directory=memberPhoto" alt="회원사진" width="50px"/>
			</c:if>
		</div>
		<div class="col font-weight-bold">
			<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?compId=${companyLoggedIn.compId }&recruitmentNo=2&memberId=${app.memberId}">
			${app.name }(${app.gender }, ${app.age })
			</a>
		</div>
		<div class="col">${app.education.schoolname }</div>
		<div class="col">
			<c:if test="${not empty app.education.score }">
			${app.education.score }/${app.education.totalscore }
			</c:if>
			<c:if test="${empty app.education.score }">
			-
			</c:if>
		</div>
		<div class="col">
			<c:if test="${empty app.career }">
			신입
			</c:if>
			<c:if test="${not empty app.career }">
			${app.career.workingPeriod }
			</c:if>
		</div>
		<div class="col">${app.hopework.wantpay }</div>
		<div class="col">${app.ca.cuResdate }</div>
	</div>
	</c:forEach>
	
	
	</div>
</div>

<script>
/* 셀렉트 변경시 해당 채용공고로 넘어감 */
$("select#recruitment-list").on("change",function(){
	var $val = $(this).val();
	
	if($val != "now"){
		location.href="${pageContext.request.contextPath }/company/viewApplicantList.ithrer?recruitmentNo="+$val+"&compId=${companyLoggedIn.compId}";
	}
});



</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>