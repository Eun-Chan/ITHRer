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
	
	<div class="row border-top border-bottom border-primary text-center py-3 font-weight-bold d-flex flex-wrap align-items-center">
		<div class="col">지원자</div>
		<div class="col">모집부문</div>
		<div class="col">학교<br />(학력/지역)</div>
		<div class="col">전공/학점</div>
		<div class="col">총 경력</div>
		<div class="col">희망연봉<br />(최근연봉)</div>
		<div class="col">지원일</div>
		<div class="col">평가내용</div>
	</div>
	
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