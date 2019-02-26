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
	font-size: 0.9em;
}
</style>

<div id="company-index-container" class="container my-5">

	<div class="clearfix">
		<button class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/company/info.ithrer?compId=${companyMap.company.compId }'">기업정보관리</button>
	</div>
	
	<!-- 회사기본정보 보여주는 영역 -->
	<div id="company-info-container" class="container my-3 shadow rounded border border-primary text-center">
		<div class="row d-flex flex-wrap align-items-center">
			<div class="col">
				<img src="${pageContext.request.contextPath }/resources/images/tempLogo.png" alt="기업로고"/>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">기업이름</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.compName} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold">대표</div>
			<div class="col-sm-4 text-left">
				<span>${companyMap.company.representive} </span>
			</div>
		</div>				
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">기업규모</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.bussinessScale} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold">업종</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.category} </span>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">홈페이지</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.homepage} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold">전화번호</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.phone} </span>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">대표 주소</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.location} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold"></div>
			<div class="col-sm-4 text-left">
				<span> </span>
			</div>
		</div>
	</div>
	
	<br />
	
	<!-- 채용정보 보여주는 영역 -->
	<div id="recuritment-info-container" class="container my-3">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#recruitment-ing-tab">진행중(${rcrtList.size() }건)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#recruitment-end-tab">마감(${rcrtEndList.size() }건)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#recruitment-all-tab">전체(${rcrtList.size()+rcrtEndList.size() }개수)</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="recruitment-ing-tab" class="container tab-pane active"><br />
				<table class="table table-hover">
					<thead>
						<tr>
							<th>공고 제목</th>
							<th>공고 관리</th>
							<th>지원자 관리</th>
							<th>지원자 통계</th>
							<th>이용상품</th>
						</tr>
					</thead>
					<c:forEach var="rcrt" items="${rcrtList}">
						<tbody>
							<tr>
								<td>
									<a href="${pageContext.request.contextPath }/index/ithrerNotice.ithrer?no=${rcrt.recruitmentNo}">
									${rcrt.recruitmentTitle }
									</a>
								</td>
								<td>수정/마감 버튼</td>
								<td>
									<a href="${pageContext.request.contextPath }/company/viewApplicantList.ithrer?recruitmentNo=${rcrt.recruitmentNo}&compId=${companyLoggedIn.compId}">
										${rcrt.noOfApplicant }명
									</a>
									 (미열람 *명)
								</td>
								<td>
									통계보기 버튼
								</td>
								<td>
									없음<br />
									<button class="btn btn-success btn-sm">유료서비스 신청</button>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div id="recruitment-end-tab" class="container tab-pane fade"><br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>공고 제목</th>
							<th>공고 관리</th>
							<th>지원자 관리</th>
							<th>지원자 통계</th>
							<th>이용상품</th>
						</tr>
					</thead>
					<c:forEach var="rcrtEnd" items="${rcrtEndList}">
						<tbody>
							<tr>
								<td>
									<a href="${pageContext.request.contextPath }/index/ithrerNotice.ithrer?no=${rcrtEnd.recruitmentNo}">
									${rcrtEnd.recruitmentTitle }
									</a>
								</td>
								<td>수정/마감 버튼</td>
								<td>
									<a href="${pageContext.request.contextPath }/company/viewApplicantList.ithrer?recruitmentNo=${rcrtEnd.recruitmentNo}&compId=${companyLoggedIn.compId}">
										${rcrtEnd.noOfApplicant }명
									</a>
									 (미열람 *명)
								</td>
								<td>
									통계보기 버튼
								</td>
								<td>
									없음<br />
									<button class="btn btn-success btn-sm">유료서비스 신청</button>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
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
				<a class="nav-link active" data-toggle="tab" href="#today-inqury-tab">오늘 본 인재(${readAppList.size() }명)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#person-bookmark-tab">관심인재(${favoriteAppList.size() }명)</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="today-inqury-tab" class="container tab-pane active"><br />
				<h3>오늘 본 인재 리스트</h3>
				<table id="readApplicant-table" class="table table-hover">
					<thead>
						<tr>
							<th>이름/나이/성별</th>
							<th>이력서 제목</th>
							<th>경력</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="applicant" items="${readAppList }">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?compId=${companyMap.company.compId }&recruitmentNo=2&memberId=${applicant.memberId}">
									${applicant.memberId }
									</a>
								</td>
								<td></td>
								<td></td>
								<td>
									<button class="btn btn-primary btn-sm">관심인재 등록</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="person-bookmark-tab" class="container tab-pane fade"><br>
				<h3>관심 인재 리스트</h3>
				<table id="favoriteApplicant-table" class="table table-hover">
					<thead>
						<tr>
							<th>이름/나이/성별</th>
							<th>이력서 제목</th>
							<th>경력</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="favorite" items="${favoriteAppList }">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?compId=${companyMap.company.compId }&recruitmentNo=${favorite.recruitmentNo}&memberId=${favorite.memberId}">
									${favorite.memberId}
									</a>
								</td>
								<td></td>
								<td></td>
								<td>
									<button class="btn btn-danger btn-sm">관심인재 해제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
	
	


</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>