<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
#company-index-container{
	width: 1000px;
}
</style>

<div id="company-index-container" class="container">
	
	<br />
	
	<!-- 회사기본정보 보여주는 영역 -->
	<div id="company-info-container" class="container">
		<div class="row">
			<div class="col-sm-4 bg-primary text-center align-middle">
				<img src="${pageContext.request.contextPath }/resources/images/tempLogo.png" alt="기업로고"/>
			</div>
			<div class="col bg-warning">
				<div class="row">
					<div class="col text-center">
						<span> ${map.company.compName} </span>
					</div>
				</div>				
				<div class="row">
					<div class="col text-center">
						<span> 대표: ${map.company.representive} </span>
					</div>
				</div>				
				<div class="row">
					<div class="col text-center">
						<span> ${map.company.bussinessScale} </span>
					</div>
				</div>
				<div class="row ">
					<div class="col text-center">
						<span> ${map.company.category} </span>
					</div>
				</div>
				<div class="row">
					<div class="col text-center">
						<span> ${map.company.homepage} </span>
					</div>
				</div>
				<div class="row">
					<div class="col text-center">
						<span> ${map.company.phone} </span>
					</div>
				</div>
			</div>
			<div class="col-sm-1">
				<button class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/company/info.ithrer?compId=${map.company.compId }'">기업정보관리</button>
			</div>
		</div>
	</div>
	
	<br />
	
	<!-- 채용정보 보여주는 영역 -->
	<div id="recuritment-info-container" class="container">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#recruitment-ing-tab">진행중(개수)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#recruitment-end-tab">마감(개수)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#recruitment-all-tab">전체(개수)</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="recruitment-ing-tab" class="container tab-pane active"><br />
				<h3>진행 중인 채용정보 보여주면 댐</h3>
				<table class="table table-hover">
					<c:forEach var="companyApplication" items="${map.companyAppList }">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?recruitmentNo=${companyApplication.recruitmentNo}&memberId=${companyApplication.memberId}">
							${companyApplication.memberId }
							</a>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div id="recruitment-end-tab" class="container tab-pane fade"><br>
				<h3>마감된 채용정보 보여주면 댐</h3>
			</div>
			<div id="recruitment-all-tab" class="container tab-pane fade"><br>
				<h3>진행 중/마감된 채용정보 모두 보여주면 댐</h3>
			</div>
		</div>
	</div>
	
	<br />
	
	<!-- 인재관련 영역 -->
	<div id="talented-person-info-container" class="container">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#today-inqury-tab">오늘 본 인재(명수)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#person-bookmark-tab">관심인재(명수)</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="today-inqury-tab" class="container tab-pane active"><br />
				<h3>오늘 본 인재 리스트</h3>
				<table id="readApplicant-table" class="table table-hover">
					<thead>
						<tr>
							<th>임시임다</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="applicant" items="${readApplicantList }">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?recruitmentNo=${map.companyAppList[0].recruitmentNo}&memberId=${applicant.memberId}">
									${applicant }
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="person-bookmark-tab" class="container tab-pane fade"><br>
				<h3>관심 인재 리스트</h3>
			</div>
		</div>
	
	</div>
	
	


</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>