<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
/* 공통 */
div#company-info-container{
	width: 1000px;
}
span.title{
	font-size: 1em;
}


</style>

<!-- 

 - 클래스명 설명
	v-r-btn : view, revision 버튼 통합으로 선택하기 위한 클래스

 -->

<div id="company-info-container" class="container">

	<div id="account-info-container">
		<span class="title badge badge-dark">기업 정보</span>
		
		<form id="account-info-form">
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="compId">아이디</label>
						<input type="text" class="form-control" id="compId" name="compId" value="${ companyMap.company.compId }" readonly>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="licenseNo">사업자번호</label>
						<input type="text" class="form-control" id="licenseNo" name="licenseNo" value="${ companyMap.company.licenseNo }" readonly>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="logo">로고</label><br />
						<input type="file" name="logo" id="logo" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="compName">기업명</label>
						<input type="text" class="form-control" id="compName" name="compName" value="${ companyMap.company.compName }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="representive">대표자명</label>
						<input type="text" class="form-control" id="representive" name="representive" value="${ companyMap.company.representive }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="businessScale">기업규모</label>
						<input type="text" class="form-control" id="businessScale" name="businessScale" value="${ companyMap.company.businessScale }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="listed">상장여부</label>
						<input type="text" class="form-control" id="listed" name="listed" value="select로 변경해야함">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="category">업종</label>
						<input type="text" class="form-control" id="category" name="category" value="${ companyMap.company.category }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="mainBusiness">주요 사업내용</label>
						<input type="text" class="form-control" id="mainBusiness" name="mainBusiness" value="${ companyMap.company.mainBusiness }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="dateOfEstablishment">설립일</label>
						<input type="text" class="form-control" id="dateOfEstablishment" name="dateOfEstablishment" value="${ companyMap.company.dateOfEstablishment }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="personnel">직원수</label>
						<input type="text" class="form-control" id="personnel" name="personnel" value="${ companyMap.company.personnel }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="location">대표 주소</label>
						<input type="text" class="form-control" id="location" name="location" value="${ companyMap.company.location }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="homepage">홈페이지</label>
						<input type="text" class="form-control" id="homepage" name="homepage" value="${ companyMap.company.homepage }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="phone">대표 전화번호</label>
						<input type="text" class="form-control" id="phone" name="phone" value="${ companyMap.company.phone }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="fax">팩스</label>
						<input type="text" class="form-control" id="fax" name="fax" value="${ companyMap.company.fax }">
					</div>
				</div>
			</div>
			<div class="row">
				
				<div class="col-sm-6">
					<div class="form-group">
						<label for="capital">자본금</label>
						<input type="text" class="form-control" id="capital" name="capital" value="${ companyMap.company.capital }">
					</div>
				</div>
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-outline-success">저장</button>
				<button type="button" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>
	
	
	<div id="sales-info-container">
		<span class="title badge badge-dark">매출액</span>
		<form id="sales-info-form">
			<div class="row">
				<div class="col">
				
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-outline-success">저장</button>
				<button type="button" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>
	
	
	
	<div id="location-info-container">
		<span class="title badge badge-dark">위치</span>
		
		<form id="location-info-form">
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="location2">본사 (Tel. 02-1234-1234)</label>
						<input type="text" class="form-control" id="location1" name="capital" value="카카오맵으로 수정">
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="location2">연구소 (Tel. 031-1234-1234)</label>
						<input type="text" class="form-control" id="location2" name="capital" value="카카오맵으로 수정">
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<div id="hrmanager-info-container">
		<span id="var-status" class="title badge badge-dark">인사담당자 정보 (인원: ${companyMap.hrManagerList.size()}/3)</span>
		
		<c:if test="${companyMap.hrManagerList.size() lt 3}">
			<button id="hr-manager-plus-btn" class="btn btn-primary btn-sm"><strong>+</strong></button>
		</c:if>
		
		<c:forEach var="hrManager" items="${companyMap.hrManagerList}" varStatus="vs">
			<form id="hrmanager-info-form${ vs.count }">
				<div class="row">
					<div class="col-sm-1">
						<div class="form-group">
							<label for="no${ vs.count }">no.</label>
							<input type="text" class="form-control form-control-sm" id="no${ vs.count }" value="${ vs.count }">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="name${ vs.count }">이름</label>
							<input type="text" class="form-control form-control-sm" id="name${ vs.count }" name="name" value="${ hrManager.name }">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="department${ vs.count }">부서</label>
							<input type="text" class="form-control form-control-sm" id="department${ vs.count }" name="department" value="${ hrManager.department }">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="position${ vs.count }">직급</label>
							<input type="text" class="form-control form-control-sm" id="position${ vs.count }" name="position" value="${ hrManager.position }">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="phone${ vs.count }">휴대폰</label>
							<input type="text" class="form-control form-control-sm" id="phone${ vs.count }" name="position" value="${ hrManager.phone }">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="email${ vs.count }">이메일</label>
							<input type="text" class="form-control form-control-sm" id="email${ vs.count }" name="email" value="${ hrManager.email }">
						</div>
					</div>
					<div class="col-sm-1 text-center">
						<button type="submit" class="btn btn-outline-success">저장</button>
						<button type="button" class="btn btn-outline-danger">삭제</button>
					</div>
				</div>
			</form>
		</c:forEach>
	</div>

	
</div>

<script>

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>