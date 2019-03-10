<%@page import="com.spring.ithrer.company.model.vo.Recruitment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<!-- 폰트추가 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700" rel="stylesheet">
<!-- Jquery 추가 - Summernote와 맞추기 위해 다운그레이드 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<!-- 충돌확인 -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script> 
 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<!-- include summernote-ko-KR -->
<link href="${pageContext.request.contextPath }/WEB-INF/views/summernote/lang/summernote-ko-KR.js" />
<!-- 전체페이지 로딩 후 보여주기 위해 none속성 -->
<style>
html
{
	display: none;
	
}
</style>
<%
	String compId = request.getParameter("compid");
	String recruitmentNo = request.getParameter("no");
	Recruitment rect = (Recruitment)request.getAttribute("rect");
%>

<!-- 모집직종팝업 -->
<div id="recruit-popup-background" class="popup-background">
	<div id="recruit-popup" class="popup">
		<h3 class="popup-textTitle">모집직종</h3>
		<div id="borderDiv">
			<div id="borderDiv-Part1" class="borderDiv-Part">
				<ul id="job2" class="jobList">
					
				</ul>
			</div>
			<div id="borderDiv-Part2" class="borderDiv-Part">
				<ul id="job3" class="jobList2">
				
				</ul>
			</div>
			<div id="result-jobList">
				<ul id="jobList-select-result" class="select-result">
						
				</ul>
			</div>
			<div id="configFrm">
				<button type="button" class="btn btn-primary btn-lg configBtn" onclick="addJob();">확인</button>
				<button type="button" class="btn btn-default btn-lg configBtn" onclick="returnPage();">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모집직급/직책 팝업 -->
<div id="position-popup-background" class="popup-background">
	<div id="position-popup-result" style="display: none;"></div>
	<div id="position-popup" class="popup">
		<h3 class="popup-textTitle" id="textTitle-position">모집직급/직책</h3> <br />
		<div id="borderDiv-position">
			<table id="position-Table">
				<!-- 직급 -->
				<tr>
					<th class="position-th">직급</th>
					<td>
						<ul class="inlineblock-select positionPopup">
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-0" id="position-0" ><label for="position-0">인턴/수습</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-1" id="position-1" ><label for="position-1">사원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-2" id="position-2" ><label for="position-2">주임</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-3" id="position-3" ><label for="position-3">계장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-4" ><label for="position-rank">대리</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-5" ><label for="position-rank">과장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-6" ><label for="position-rank">차장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-7" ><label for="position-rank">부장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-8" ><label for="position-rank">감사</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-9" ><label for="position-rank">이사</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-10" ><label for="position-rank">상무</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-11" ><label for="position-rank">전무</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-12" ><label for="position-rank">부사장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-13" ><label for="position-rank">사장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-14" ><label for="position-rank">회장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-15" ><label for="position-rank">전문직</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-16" ><label for="position-rank">IR 책임자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-17" ><label for="position-rank">연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-18" ><label for="position-rank">주임연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-19" ><label for="position-rank">선임연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-20" ><label for="position-rank">책임연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-21" ><label for="position-rank">수석연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-22" ><label for="position-rank">연구소장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-23" ><label for="position-rank">프리랜서</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-24" ><label for="position-rank">CTO</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-25" ><label for="position-rank">CEO</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank" id="position-26" ><label for="position-rank">COO</label>
							</li>
						</ul>
					</td>	
				</tr>
				<!-- 직책 -->
				<tr>
					<th class="position-th">직책</th>
					<td>
						<ul class="inlineblock-select positionPopup">
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-0" ><label for="position-rank-bottom">팀원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-1" ><label for="position-rank-bottom">총무</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-2" ><label for="position-rank-bottom">부팀장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-3" ><label for="position-rank-bottom">실장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-4" ><label for="position-rank-bottom">팀장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-5" ><label for="position-rank-bottom">파트장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-6" ><label for="position-rank-bottom">지점장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-7" ><label for="position-rank-bottom">공장장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-8" ><label for="position-rank-bottom">지사장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-9" ><label for="position-rank-bottom">그룹장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-10" ><label for="position-rank-bottom">센터장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-11" ><label for="position-rank-bottom">본부장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-12" ><label for="position-rank-bottom">사업부장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-13" ><label for="position-rank-bottom">국장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-14" ><label for="position-rank-bottom">원장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-15" ><label for="position-rank-bottom">매니저</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-16" ><label for="position-rank-bottom">지배인</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-17" ><label for="position-rank-bottom">총지배인</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-18" ><label for="position-rank-bottom">고문</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-19" ><label for="position-rank-bottom">소장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-20" ><label for="position-rank-bottom">관장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="position-rank-bottom" id="position-bottom-21" ><label for="position-rank-bottom">이사장</label>
							</li>
						</ul>
					</td>
				</tr>
			</table>
			<div id="result-jobList2">
				<ul id="jobList-select-result2" class="select-result">
						
				</ul>
			</div>
			<div id="btnDiv">
				<button type="button" class="btn btn-primary positionBtn" id="position-inputBtn" onclick="posotionResultAdd();">확인</button>
				<button type="button" class="btn btn-default positionBtn" id="position-cancleBtn">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 우대사항 팝업 -->
<div id="preference-popup-background" class="popup-background">
	<div id="preference-popup-result" style="display: none;"></div>
	<div id="preference-popup" class="popup">
		<h3 class="popup-textTitle" id="textTitle-preference">우대사항</h3> <br />
		<div id="borderDiv-preference">
			<table id="preference-Table">
				<tr>
					<td>
						<ul class="inlineblock-select positionPopup preference-popup">
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-1" ><label for="preference-1">국가유공자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-2" ><label for="preference-2">보훈대상자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-3" ><label for="preference-3">취업보호대상자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-4" ><label for="preference-4">고용촉진장려금대상자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-5" ><label for="preference-5">장애인</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-6" ><label for="preference-6">외국인</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-7" ><label for="preference-7">실버인력</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-8" ><label for="preference-8">군전역간부</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-9" ><label for="preference-9">병역특례자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-10" ><label for="preference-10">해당직무인턴경험</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-11" ><label for="preference-11">통계분석전문가</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-12" ><label for="preference-12">PT전문가</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-13" ><label for="preference-13">인근거주자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-14" ><label for="preference-14">차량소지자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-15" ><label for="preference-15">운전가능자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-16" ><label for="preference-16">병역필 또는 면제자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-17" ><label for="preference-17">해외여행 무결격자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-18" ><label for="preference-18">봉사활동경험</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-19" ><label for="preference-19">수상경력자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-20" ><label for="preference-20">학점우수자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-21" ><label for="preference-21">MBS</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-22" ><label for="preference-22">외국학위소지자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-23" ><label for="preference-23">신용정보 무결격자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-24" ><label for="preference-24">석박사</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox position-chkBox-popup' name="preference" id="preference-25" ><label for="preference-25">주부</label>
							</li>
						</ul>
					</td>	
				</tr>
			</table>
			<div id="result-preference">
				<ul id="preference-select-result" class="select-result">
						
				</ul>
			</div>
			<div id="btnDiv">
				<button type="button" class="btn btn-primary positionBtn" id="preference-inputBtn" onclick="preferenceResultAdd();">확인</button>
				<button type="button" class="btn btn-default positionBtn" id="preference-cancleBtn" onclick="closePreferencePopup();">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 복리후생팝업 -->
<div id="benefit-popup-background" class="popup-background">
	<div id="benefit-popup" class="popup">
		<h3 class="popup-textTitle">복리후생</h3>
		<div id="benefit-borderDiv">
			<div id="content-benefits-Part1" class="borderDiv-Part">
				<ul id="benefitUl" class="jobList">
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-1" ><label for="benefit-1">4대보험</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-2" ><label for="benefit-2">식대지원</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-3" ><label for="benefit-3">구내식당</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-4" ><label for="benefit-4">통근버스</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-5" ><label for="benefit-5">주차장제공</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-6" ><label for="benefit-6">장애인 복지</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-7" ><label for="benefit-7">자기계발지원</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-8" ><label for="benefit-8">워크샵</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-9" ><label for="benefit-9">직무능력향상교육</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-10" ><label for="benefit-10">도서구입비지원</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-11" ><label for="benefit-11">인센티브</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-12" ><label for="benefit-12">우수사원포상</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-13" ><label for="benefit-13">명절선물</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-14" ><label for="benefit-14">장기보너스</label>
					</li>
					<li>
						<input type='checkbox' class='ipt-chkBox position-chkBox-popup benefitChk' name="benefit" id="benefit-15" ><label for="benefit-15">상해보험</label>
					</li>
				</ul>
			</div>
		</div>
		<div id="result-benefitList">
			<ul id="benefitList-select-result" class="select-result">
			</ul>
		</div>
		<div id="configFrm-benefitList">
			<button type="button" class="btn btn-primary btn-lg configBtn" onclick="addBenefitList();">확인</button>
			<button type="button" class="btn btn-default btn-lg configBtn" onclick="returnPage_benefit();">취소</button>
		</div>
	</div>
</div>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header-noneBootstrap.jsp"/>
<!-- 기본정보 컨테이너 -->
<form action="${pageContext.request.contextPath}/company/testSend" id="frm1">
<div id="default-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>이번 채용에는 어떤 인재를 찾고 계신가요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">지난 채용과 유사한 인재를 찾고 계시다면 이전 채용공고를 불러와서 수정하세요.</p>
		</div>
	</div>
	<table id="recruit-content" class="td-inputFrm">
		<tr class="td-line">
			<th class="content-title" id="recruitmentTitle">
				<div class="th-container">
				 	<div class="essential">* </div>
				 	<span class="content-title-in">공고제목</span>
			 	</div>
			 </th>
			 <td colspan="5" class="input-content">
				<div id="input-titleText" class="input-textBox" placeholder="공고제목을 입력해 주세요.">
					<input type="text" id="titleText-select-result" value="<%=rect.getRecruitmentTitle() %>" />
				</div>
			</td>
		</tr>
		<!-- 모집직종 -->
		<tr class="td-line">
			<th class="content-title" id="recruitment">
				<div class="th-container">
				 	<div class="essential">* </div>
				 	<span class="content-title-in">모집직종</span>
				 	<p class="subText-Th">최대 15개</p>
			 	</div>
			 </th>
			<td colspan="5" class="input-content">
				<div id="input-job" class="input-textBox" placeholder="직종을 입력해 주세요." readonly>
					<span id="jobs-select-result">
						
					</span>
				</div>
				<button type="button" class="btn btn-primary" id="recruit-btn" onclick="recruitAll();">전체보기</button>
				
			</td>
		</tr>
		<!-- 경력 -->
		
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">경력</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobExp inlineblock-select" id="crr-Content">
					<li class="radio-select">
						<label for="new-Crr" class="radioDef">
							<input type="radio" id="new-Crr" name="crr" />
							<span>신입</span>
						</label>
					</li class="radio-select">
					<li>
						<label for="normal-Crr" class="radioDef">
							<input type="radio" id="normal-Crr" name="crr" />
							<span>경력</span>
						</label>
					</li>
					<li class="radio-select">
						<label for="total-Crr" class="radioDef">
							<input type="radio" id="total-Crr" name="crr" />
							<span>신입+경력</span>
						</label>
					</li>
				</ul>
				<!-- 숨겨진 영역 -->
				<!-- 경력 선택 시 -->
				<div id="normal-Crr-Frm" class="hiddenDiv">
					<ul class="inlineblock-select" style="padding-top: 15px; padding-left: 10px;">
						<li>
							<!-- 경력 N년 이상 -->
							<select class="form-control formStyleChange formStyleChange inlineblock-select fore-select" id="crr-cntUp">
								<option value="select">선택</option>
								<%
									for(int i=1; i<=60; i++)
									{
								%>
										<option value="<%=i%>"><%=i%>년</option>
								<%	}%>
							</select>
							<span>이상</span>
						</li>
						<li>
							<!-- 경력 N년 미만 -->
							<select class="form-control formStyleChange formStyleChange inlineblock-select fore-select" id="crr-cntDown">
								<option value="select">선택</option>
								<%
									for(int i=1; i<=60; i++)
									{
								%>
										<option value="<%=i%>"><%=i%>년</option>
								<%	}%>
							</select>
							<span>미만</span>
						</li>
						<li style="padding-top: 8px;">
							<input type='checkbox' class='ipt-chkBox' name="irrelevant" id="irrelevant-crr" ><label for="irrelevant">연차무관</label> 
						</li>
					</ul>
				</div>
				
			</td>
		</tr>
		<!-- 고용형태 -->
		
		<tr class="td-line">
			<th class="content-title" id="content-title-employType"> <div class="essential">* </div><span class="content-title-in">고용형태</span></th>
			<td colspan="5" class="input-content">
				<!-- 체크 -->
				<div id="employType-Div">
					<input type='checkbox' class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_1" value="정규직" style="margin-left: 0px;"><label for='Employ_Ty_Cd_select_1'>정규직</label> 
					<input type='checkbox' class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_2" value="계약직" ><label for='Employ_Ty_Cd_select_2'>계약직</label> 
					<input type='checkbox' class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_3" value="병역특례" ><label for='Employ_Ty_Cd_select_3'>병역특례</label> 
					<input type='checkbox' class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_4" value="인턴" ><label for='Employ_Ty_Cd_select_4'>인턴</label> 
					<input type='checkbox' class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_5" value="프리랜서" ><label for='Employ_Ty_Cd_select_5'>프리랜서</label> 
					<input type='checkbox' class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_6" value="위촉직" ><label for='Employ_Ty_Cd_select_6'>위촉직</label> 
					<input type="checkbox" class='ipt-chkBox employ-type' name="Employ_Ty_CdName" id="Employ_Ty_Cd_select_7" value="알바" ><label label for="Employ_Ty_Cd_select_7">알바</label>
				</div>
				<!-- 숨겨진 영역 -->
				<div id="employType0" class="hiddenDiv" style="height: 140px;">
					<table class="employType-table" id="emploType0-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">정규직</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">수습기간&nbsp;</span>
								<input type="text" id="input-cnt-month" class="input-textBox"/>&nbsp;개월
							</td>
						</tr>
						<tr class="td-line" id="timePart">
							<th class="content-title"><span class="content-title-in hiddenTitle">시간제</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_time_11" value="1" style="margin-bottom: 0px;"><label for='Employ_Ty_Cd_time_1' style="margin-bottom: 0px;">시간(선택)제로 채용하는 경우에 선택하세요.</label>
							</td>
						</tr>
					</table>
					
				</div>
				<div id="employType1" class="hiddenDiv" style="height: 140px">
					<table class="employType-table" id="emploType1-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">계약직</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control formStyleChange formStyleChange inlineblock-select fore-select" id="workDateRange" onchange="input_date_check_contract(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-contract">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-Contract">
									<input type="text" id="date-cnt-contract" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control formStyleChange formStyleChange inlineblock-select fore-select work-dateCntType" id="contract-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;수습기간&nbsp;<input type="text" id="input-cnt-month2" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change0" value="1" style="margin-bottom: 0px;"><label for='employType-Change' id="employ-ChangeLabel" style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">시간제</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_time_1" value="1" style="margin-bottom: 0px;"><label for='Employ_Ty_Cd_1' style="margin-bottom: 0px;">시간(선택)제로 채용하는 경우에 선택하세요.</label> 
							</td>
						</tr>
					</table>
				</div>
				<div id="employType2" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType2-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">병역특례</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox' name="job-Cd1" ><label for="job-Cd1" class="ms-select">현역</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd2" ><label for="job-Cd2" class="ms-select">보충역</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd3" ><label for="job-Cd3" class="ms-select">전문연구요원</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd4" ><label for="job-Cd4" class="ms-select">산업기능요원</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd5" ><label for="job-Cd5" class="ms-select">전직가능</label>
							</td> 
						</tr>
					</table>
				</div>
				<div id="employType3" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType3-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">인턴</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control formStyleChange formStyleChange inlineblock-select fore-select" id="workDateRange-inturn" onchange="input_date_check_inturn(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-inturn">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-inturn">
									<input type="text" id="date-cnt-inturn" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control formStyleChange inlineblock-select fore-select work-dateCntType" id="inturn-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month3" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change1" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
					</table>
				</div>
				<div id="employType4" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType4-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">프리랜서</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control formStyleChange inlineblock-select fore-select" id="workDateRange-inturn2" onchange="input_date_check_pre(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-pre">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-pre">
									<input type="text" id="date-cnt-pre" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control formStyleChange inlineblock-select fore-select work-dateCntType" id="pre-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month4" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change2" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
					</table>
				</div>
				<div id="employType5" class="hiddenDiv" style="height: 140px">
					<table class="employType-table" id="emploType5-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">위촉직</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control formStyleChange inlineblock-select fore-select" id="workDateRange-Commission" onchange="input_date_check_commision(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-commision">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-commision">
									<input type="text" id="date-cnt-commision" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control formStyleChange inlineblock-select fore-select work-dateCntType" id="commision-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month5" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change3" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">시간제</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="timePart-Commission" id="timePartId-Commission" value="1" style="margin-bottom: 0px;"><label for='timePart-Commission' style="margin-bottom: 0px;">시간(선택)제로 채용하는 경우에 선택하세요.</label> 
							</td>
						</tr>
					</table>
				</div>
				<div id="employType6" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType6-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">알바</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control formStyleChange inlineblock-select fore-select" id="workDateRange-rbar" onchange="input_date_check_rbar(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-rbar">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-rbar">
									<input type="text" id="date-cnt-rbar" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control formStyleChange inlineblock-select fore-select work-dateCntType" id="rbar-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month6" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-basic" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">초보가능</label>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<!-- 모집인원 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">모집인원</span></th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-cnt" class="input-textBox" />명
			</td>
		</tr>
		<!-- 담당업무 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">담당업무</span></th>
			<td colspan="5" class="input-content">
				<!-- 담당업무 정보를 담을 태그 -->
				<textarea class="input-textBox" id="asignedTaskArea" name="asignedTask" cols="30" rows="10"></textarea>
			</td>
		</tr>
		<!-- 근무부서 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">근무부서</span></th>
			<td colspan="5" class="input-content">
				<input type="text" class="input-textBox" name="department" id="input-department" placeholder="예) 기획팀, 디자인팀"/>
			</td>
		</tr>
		<!-- 모집직급/직책 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">모집직급/직책</span></th>
			<td colspan="5" class="input-content">
				<div id="job-code-result-Div" class="input-textBox" placeholder="직급/직책을 선택해주세요." readonly>
					<span id="job-select-result2" class="select-result">
						
					</span>
				</div>
				<button type="button" class="btn btn-primary" id="position-AllBtn" onclick="positionAllBtn();">전체보기</button>
			</td>
		</tr>
	</table>
</div>
</form>
<!-- 기본정보 컨테이너 종료 -->

<!-- #2.지원자격 및 우대조건 컨테이너 -->
<form action="">
<div id="preference-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>지원자격 및 우대조건은 어떤 것들이 있나요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">구체적인 정보를 입력하시면 찾으시는 인재에 근접한 지원자를 확인하실 수 있습니다.</p>
		</div>
	</div>
	<table id="preference-content" class="td-inputFrm">
		<!-- 학력 -->
		
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">학력</span></th>
			<td colspan="5" class="input-content">
				<select class="form-control formStyleChange formStyleChange2" id="education-select">
					<option value="고등학교졸업">고등학교졸업</option>
					<option value="대학(2,3년)졸업">대학(2,3년)졸업</option>
					<option value="대학교(4년)졸업">대학교(4년)졸업</option>
					<option value="석사졸업">석사졸업</option>
					<option value="박사졸업">박사졸업</option>
					<option value="학력무관">학력무관</option>
				</select>
				<!-- <input type='checkbox' class='ipt-chkBox' name="preference-over" ><label for="preference-over">이상</label> -->
			</td>
		</tr>
		<!-- 전공계열 -->
		
		<tr class="td-line">
			<th class="content-title" style="padding-top: 12px;">
				<span class="content-title-in none-essential">전공계열</span>
				<p class="subText-Th">최대 3개</p>
			</th>
			<td colspan="5" class="input-content">
				<!-- 입력한 전공 출력영역 -->
				<div id="major-code-result-Div" class="code-result-Div">
					<ul id="major-select-result" class="select-result">
						
					</ul>
				</div>
				<select class="form-control formStyleChange formStyleChange2" id="major-select">
					<option value="" selected>전공계열</option>
					<option value="major-0">어문학계열</option>
					<option value="major-1">사회과학계열</option>
					<option value="major-2">자연과학계열</option>
					<option value="major-3">공학계열</option>
					<option value="major-4">의/약학계열</option>
					<option value="major-5">사범계열</option>
					<option value="major-6">농/수산/해양계열</option>
					<option value="major-7">가정학계열</option>
					<option value="major-8">예/체능계열</option>
					<option value="major-9">신학계열</option>
					<option value="major-10">법학계열</option>
					<option value="major-11">상경계열</option>
					<option value="major-12">해당무</option>
				</select>
				<button type="button" id="major-Btn" class="btn btn-primary btnCss" onclick="input_major();">입력</button>
				<button type="button" id="major-Btn-cancle" class="btn btn-default btnCss" onclick="reset_major();">초기화</button>
			</td>
		</tr>
		<!-- 외국어-->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">외국어</span></th>
			<td colspan="5" class="input-content">
				<!-- 입력한 외국어 출력영역 -->
				<div id="fore-code-result-Div" class="code-result-Div">
					<ul id="fore-select-result" class="select-result">
						
					</ul>
				</div>
				<div id="level-setting" class="fore-setting">
					<ul class="inlineblock-select">
						<li>
							<!-- 1차 선택지 -->
							<select class="form-control formStyleChange inlineblock-select fore-select" id="fore-lang">
								<option name="fore-lang1" value="언어" selected>언어</option>
								<option name="fore-lang2" value="영어">영어</option>
								<option name="fore-lang3" value="일본어">일본어</option>
								<option name="fore-lang4" value="중국어">중국어</option>
								<option name="fore-lang5" value="직접입력">직접입력</option>
							</select>
						</li>
						<li>
							<!-- 2차 선택지 -->
							<select class="form-control formStyleChange inlineblock-select fore-select" id="fore-level1">
								<option value="회화능력" selected>회화능력</option>
								<option value="비즈니스 회화가능">일상회화 가능</option>
								<option value="비즈니스 회화가능">비즈니스 회화가능</option>
								<option value="원어민 수준">원어민 수준</option>
							</select>
						</li>
						<button type="button" id="fore-lang-Btn" class="btn btn-Primary btnCss" onclick="addFore();">입력</button>
						<button type="button" id="fore-Btn-cancle" class="btn btn-default btnCss" onclick="reset_fore();">초기화</button>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 자격증 -->
		
		<!-- <tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">자격증</span></th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-certificate" class="input-textBox" placeholder="자격증을 입력해 주세요."/>
			</td>
		</tr> -->
		<!-- 컴퓨터활용능력 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">자격증</span></th>
			<td colspan="5" class="input-content">
			<!-- 결과div -->
			<div id="comAbill-code-result-Div" class="code-result-Div" style="display:none;">
				<ul id="comAbill-select-result" class="select-result">
					
				</ul>
			</div>
				<ul class="inlineblock-select computer-abilityUl">
					<li>
						<!-- 기능구분 -->
						<select class="form-control formStyleChange inlineblock-select fore-select" id="computer-ability">
							<option value="기능구분" selected>기능구분</option>
						</select>
					</li>
					<li>
						<!-- 기능명 -->
						<select class="form-control formStyleChange inlineblock-select fore-select" id="computer-ability-name">
							<option value="기능명" selected>기능명</option>
						</select>
						<!-- 직접입력 -->
						<input type="text" class="input-textBox" id="otherInput-comabill" />
					</li>
					<button type="button" id="comAbill-lang-Btn3" class="btn btn-Primary btnCss" onclick="foreInput();">입력</button>
					<button type="button" id="comAbill-Btn-cancle" class="btn btn-default btnCss" onclick="reset_comAbill();">초기화</button>
				</ul>
			</td>
		</tr>
		<!-- 우대사항 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">우대사항</span></th>
			<td colspan="5" class="input-content">
				<div id="preference-code-result-Div" class="input-textBox" placeholder="우대사항을 선택해주세요." readonly>
					<span id="preference-select-result2" class="select-result">
						
					</span>
				</div>
				
				<button type="button" id="preferenceBtn" class="btn btn-primary" onclick="preferenceAllbtn();">전체보기</button> 
			</td>
		</tr>
		<!-- 연령제한 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">연령제한</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobDiv inlineblock-select">
					<li class="radio-select">
						<label for="age-none" class="radioDef" >
							<input type="radio" id="age-none" name="radio-age"/>
							<span>무관</span>
						</label>
					</li class="radio-select">
					<li>
						<label for="age-cut" class="radioDef" >
							<input type="radio" id="age-cut" name="radio-age"/>
							<span>연령제한</span>
						</label>
					</li>
				</ul>
				<input type="text" id="input-age-start" class="input-textBox ageInput" placeholder="20" disabled/><p class="input-p">세 부터</p>
				<input type="text" id="input-age-end" class="input-textBox ageInput" placeholder="60" disabled/><p class="input-p">세 까지</p>
			</td>
		</tr>
		<!-- 성별제한 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">성별제한</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobDiv inlineblock-select">
					<li class="radio-select">
						<label for="gender-none" class="radioDef">
							<input type="radio" id="gender-none" name="genderCut"/>
							<span>무관</span>
						</label>
					</li class="radio-select" id="genderSelect">
					<li>
						<label for="gender-cut" class="radioDef">
							<input type="radio" id="gender-f" name="genderCut"/>
							<span>여자</span>
						</label>
					</li>
					<li>
						<label for="gender-cut" class="radioDef">
							<input type="radio" id="gender-m" name="genderCut"/>
							<span>남자</span>
						</label>
					</li>
				</ul>
			</td>
		</tr>
		<!-- 기타자격요건 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">기타자격요건</span></th>
			<td colspan="5" class="input-content">
				<input type="text" class="input-textBox" id="otherRequirement" placeholder="예) 취업포탈 근무 경함자 우대"/>
			</td>
		</tr>
	</table>
</div>
</form>
<!-- 우대조건 컨테이너 종료 -->

<!-- 근무조건정보 컨테이너 -->
<form action="">
<div id="workCondition-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>근무조건은 어떻게 되나요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">급여조건, 복리후생 등 상세한 정보가 제공되는 채용공고의 입사지원율이 높습니다.</p>
		</div>
	</div>
	<table id="workCondition-content" class="td-inputFrm">
		<!-- 근무지역 -->
		
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">근무지역</span></th>
			<td colspan="5" class="input-content" style="width: 750px">
				<div id="workLocation-code-result-Div" class="code-result-Div" style="display:none;">
					<ul id="workLocation-select-result" class="select-result">
						
					</ul>
				</div>
				<!-- 체크 -->
				<!-- 1차 선택지 -->
				<select class="form-control formStyleChange inlineblock-select fore-select subwayBtn work-location" id="location-select-1">
					<option value="지역" selected>지역</option>
					<option value="101000">서울</option>
					<option value="102000">경기</option>
					<option value="103000">광주</option>
					<option value="104000">대구</option>
					<option value="105000">대전</option>
					<option value="106000">부산</option>
					<option value="107000">울산</option>
					<option value="108000">인천</option>
					<option value="109000">강원</option>
					<option value="110000">경남</option>
					<option value="111000">경북</option>
					<option value="112000">전남</option>
					<option value="113000">전북</option>
					<option value="114000">충북</option>
					<option value="115000">충남</option>
					<option value="116000">제주</option>
					<option value="117000">전국</option>
					<option value="118000">세종특별자치시</option>
				</select>
				<!-- 2차 선택지 -->
				<select class="form-control formStyleChange inlineblock-select fore-select subwayBtn work-location2" id="location-select-2">
					
				</select>
				<button type="button" id="workLocation-Btn" class="btn btn-primary btnCss" onclick="input_workLocation();">입력</button>
				<button type="button" id="workLocation-Btn-cancle" class="btn btn-default btnCss" onclick="reset_workLocation();">초기화</button> 
			</td>
		</tr>
		<!-- 인근전철역 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">인근전철역</span></th>
			<td colspan="5" class="input-content">
				<!-- 결과div -->
				<div id="subway-code-result-Div" class="code-result-Div" style="display:none;">
					<ul id="subway-select-result" class="select-result">
						
					</ul>
				</div>
				<!-- 인근전철역 선택 -->
				<div id="near-setting" class="near-setting">
					<ul class="inlineblock-select" id="subwayUl">
						<li>
							<!-- 1차 선택지 -->
							<select class="form-control formStyleChange inlineblock-select fore-select subwayBtn" id="train-select">
								<option value="지하철노선" selected>지하철노선</option>
							</select>
						</li>
						<li>
							<!-- 2차 선택지 -->
							<select class="form-control formStyleChange inlineblock-select fore-select subwayBtn" id="station-select">
								<option value="지하철역" selected>지하철역</option>
							</select>
						</li>
						<!-- <li>
							3차 선택지
							<select class="form-control formStyleChange inlineblock-select fore-select" id="distance-select">
								<option value="거리" selected>거리</option>
							</select>
						</li> -->
						<li>
							<button type="button" id="fore-lang-Btn4" class="btn btn-Primary btnCss" onclick="subwayInput();">입력</button>
							<button type="button" id="subway-Btn-cancle" class="btn btn-default btnCss" onclick="reset_subway();">초기화</button>
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 근무시간 -->
		<tr class="td-line">
			<th class="content-title"> <span class="content-title-in">근무시간</span></th>
			<td colspan="5" class="input-content" style="width: 750px">
				<!-- 체크 -->
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-0" ><label for='workTime-0'>주 5일</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-1" ><label for='workTime-1'>토요일 격주휴무</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-2" ><label for='workTime-2'>주 6일</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-3" ><label for='workTime-3'>주 3일 격일제</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-4" ><label for='workTime-4'>탄력적근무제</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-5" ><label for='workTime-5'>2교대</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-6" ><label for='workTime-6'>3교대</label>
				<input type='checkbox' class='ipt-chkBox workTime' id="workTime-7" ><label for='workTime-7'>4교대</label>
			</td>
		</tr>
		<!-- 급여조건 -->
		<tr class="td-line">
			<th class="content-title"><div class="essential">* </div><span class="content-title-in">급여조건</span></th>
			<td colspan="5" class="input-content">
				<!-- 급여조건 선택 -->
				
				<div id="near-setting" class="near-setting">
					<ul class="inlineblock-select">
						<li>
							<!-- 1차 선택지 -->
							<select class="form-control formStyleChange inlineblock-select fore-select" id="salary-select">
								<option value="연봉" selected>연봉</option>
								<option value="시급" >시급</option>
								<option value="일급" >일급</option>
								<option value="주급" >주급</option>
								<option value="월급" >월급</option>
								<option value="건별" >건별</option>
							</select>
						</li>
						<li>
							<!-- 2차 입력 -->
							<input type="text" id="salary" class="input-textBox" /> 만원
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 복리후생 -->
		
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">복리후생</span></th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-Benefits" class="input-textBox" placeholder="복리후생을 선택해주세요." readonly/>
				<button type="button" class="btn btn-primary" id="benefitAll-btn" onclick="benefitAll();">전체보기</button>
			</td>
		</tr>
	</table>
</div>
</form>
<!-- 접수방법 및 기간 컨테이너 -->
<form action="">
<div id="term-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>접수기간과 접수방법은 어떻게 되나요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">구직자는 PC와 모바일 어디서나손쉽게 바로지원 가능한 인크루트 이력서를 선호합니다.</p>
		</div>
	</div>
	<table id="term-content" class="td-inputFrm">
		<!-- 접수기간 -->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수기간</span></th>
			<td colspan="5" class="input-content" style="width: 750px">
				<!-- 시간선택 -->
				<div class="time-container">
					<ul class="inlineblock-select" style="display: inline;">
						<li>
							<input type="date" id="input-term-start" class="input-textBox"/>
						</li>
					
						<li>
							<input type="date" id="input-term-end" class="input-textBox" placeholder="yy/mm/dd"/>
						</li>
						<!-- 시 -->
						<!-- <li>
							<select class="form-control formStyleChange inlineblock-select fore-select" id="time-hour">
								<option value="시" selected>시</option>
							</select>
						</li> -->
						<!-- 분 -->
						<!-- <li>
							<select class="form-control formStyleChange inlineblock-select fore-select" id="time-min">
								<option value="시" selected>분</option>
							</select>
						</li> -->
						<!--마감일 -->
						<!-- <li>
							<select class="form-control formStyleChange inlineblock-select fore-select" id="time-end">
								<option value="작문능력" selected>마감일지정</option>
							</select>
						</li> -->
					</ul>
				</div>
			</td>
		</tr>
		<!-- 접수방법-->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수방법</span></th>
			<td colspan="5" class="input-content">
				<!-- 자사시스템 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-0" value="1" ><label for='how-contact-1'>ITHRER 채용 시스템</label> 
				</div>
				<!-- 일반 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-1" value="1" ><label for='how-contact-1'>자사 홈페이지</label>
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-2" value="1" ><label for='how-contact-2'>우편</label>
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-3" value="1" ><label for='how-contact-3'>팩스</label>
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-4" value="1" ><label for='how-contact-4'>방문</label>
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-5" value="1" ><label for='how-contact-5'>이메일</label>
					<input type='checkbox' class='ipt-chkBox howCon' id="how-contact-6" value="1" ><label for='how-contact-6'>전화/휴대폰</label> 
				</div>
			</td>
		</tr>
		<!-- 접수양식-->
		<!-- 접수양식 정보를 저장하기 위한 히든태그 -->
		<input type="hidden" name="applicationForm" />
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수양식</span></th>
			<td colspan="5" class="input-content">
				<!-- 자사시스템 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox appForm' id="frm-contact-0" value="1" ><label for='frm-contact-1'>ITHRER 이력서</label> 
				</div>
				<!-- 일반 이용 -->
				<div class="frm-contact">
					<input type='checkbox' class='ipt-chkBox appForm' id="frm-contact-1" value="1" ><label for='frm-contact-1'>자사양식</label>
					<input type='checkbox' class='ipt-chkBox appForm' id="frm-contact-2" value="1" ><label for='frm-contact-2'>자유양식</label>
				</div>
			</td>
		</tr>
		<!-- 전형단계 -->
		<!-- 전형단계 정보를 저장하기 위한 히든태그 -->
		<input type="hidden" name="recruitmentStage" />
		<tr class="td-line">
			<th class="content-title"> 
				<div class="essential">* </div>
				<span class="content-title-in">전형단계</span>
				<p class="subText-Th">최대 4개</p>
			</th>
			<td colspan="5" class="input-content" id="process-td">
				<span>서류전형 ></span>
				<select class="form-control formStyleChange inlineblock-select fore-select join-process" id="processBox-0">
					<option value="기능구분" selected>면접전형</option>
					<option value="기능구분" >2차면접전형</option>
					<option value="기능구분" >3차면접전형</option>
					<option value="기능구분" >시험전형</option>
					<option value="기능구분" >검사전형</option>
					<option value="기능구분" >최종심사</option>
				</select>
				<span> > </span>
				<select class="form-control formStyleChange inlineblock-select fore-select join-process" id="processBox-1">
					<option value="기능구분" >면접전형</option>
					<option value="기능구분" >2차면접전형</option>
					<option value="기능구분" >3차면접전형</option>
					<option value="기능구분" selected>시험전형</option>
					<option value="기능구분" >검사전형</option>
					<option value="기능구분" >최종심사</option>
				</select>
				<span> > 최종합격</span>
				<button type="button" id="processAdd-Btn" class="btn btn-default" onclick="processAdd();">전형추가</button>
			</td>
		</tr>
	</table>
</div>
</form>
<!-- summernote -->
<!-- summernote의 html코드를 저장하기 위한 히든태그 -->
<input type="hidden" name="docMethod" />
<div id="summernote-content" class="info-container">
	<!-- 입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>공고등록 전에 입력하신 내용을 최종 확인해주세요</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">지금까지 입력하신 내용을 입력한 내용 적용하기 버튼을 클릭하여 상세요강을 채워주세요.</p>
		</div>
	</div>
	<div id="summernoteDiv">
		<textarea id="summernote-area" style="width: 700px; height: 300px;"></textarea>
		<div id="addBtn" style="text-align: center; margin-top: 22px; margin-bottom: 22px;">
			<button type="button" class="btn btn-primary btn-lg" onclick="recruitmentSend();">등록완료</button>
		</div>
	</div>
</div>
<input type="hidden" name="testSummernote" id="summernoteHtml" />
<!-- 데이터전송 -->
<form action="${pageContext.request.contextPath}/company/updateSend" id="updateFrm">
	<!-- 제목정보를 담기위한 히든태그 -->
	<input type="hidden" name="recruitmentTitle" id="frm1-0" />
	<!-- 모집직종 정보를 담기위한 히든태그 #hidden-1 -->
	<input type="hidden" name="typeOfOccupation" id="frm1-1" />
	<!-- 경력정보를 담기 위한 히든태그 -->
	<input type="hidden" name="career" id="frm1-2" />
	<!-- 고용형태 값을 담기위한 히든태크 -->
	<input type="hidden" name="employment_type" id="frm1-3" />
	<!-- 모집인원 정보를 담기위한 히든태그 -->
	<input type="hidden" name="recruitmentPersonnel" id="frm1-4"/>
	<!-- 담당업무 정보를 담기위한 히든태그 -->
	<input type="hidden" name="asignedTask" id="frm1-5" />
	<!-- 근무부서 정보를 담을 히든태그 -->
	<input type="hidden" name="resultDepartment" id="frm1-6" />
	<!-- 모집직책/직급 정보를 담을 히든태그 -->
	<input type="hidden" name="jobGrade" id="frm1-7" />
	
	<!-- 학력조건 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="education" id="frm2-1" />
	<!-- 전공조건 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="major" id="frm2-2" />
	<!-- 가능한 외국어 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="foreLang" id="frm2-3"/>
	<!-- 자격증 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="certificate" id="frm2-4" />
	<!-- 컴퓨터 활용능력정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="computerLiteracy" id="frm2-5"/>
	<!-- 우대사항 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="employmentPreference" id="frm2-6"/>
	<!-- 연령제한 정보를 저장하기 위한 태그 -->
	<input type="hidden" name="applicantAge" id="frm2-7"/>
	<!-- 성별제한 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="genderCut" id="frm2-8"/>
	<!-- 기타자격요건 정보를 저장하기위한 히든태그 -->
	<input type="hidden" name="etcQualificationRequirement" id="frm2-9"/>
	
	<!-- 근무지역 정보(지역명)를 저장하기 위한 히든태그 -->
	<input type="hidden" name="location" id="frm3-0" />
	<!-- 근무지역 정보(지역코드)를 저장하기 위한 히든태그 -->
	<input type="hidden" name="locationCode" id="frm3-1" />
	<!-- 인근전철역 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="nearbyStation" id="frm3-2" />
	<!-- 급여조건 구분 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="salaryType" id="frm3-3-1" />
	<!-- 급여금액 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="payCondition" id="frm3-3-2" />
	<!-- 복리후생 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="welfare" id="frm3-4" />
	<!-- 근무시간 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="workDay" id="frm3-5" />
	
	<!-- 공고시작 기간을 저장하기 위한 히든태그 -->
	<input type="hidden" name="openingDate" id="frm4-1" />
	<!-- 공고종료 기간을 저장하기 위한 히든태그 -->
	<input type="hidden" name="closingDate" id="frm4-2" />
	<!-- 접수방법을 저장하기 위한 히든태그 -->
	<input type="hidden" name="applicationMethod" id="frm4-3" />
	<!-- 접수양식을 저장하기 위한 히든태그 -->
	<input type="hidden" name="applicationForm" id="frm4-4" />
	<!-- 전형단계를 저장하기 위한 히든태그 -->
	<input type="hidden" name="recruitmentStage" id="frm4-5" />
	<!-- 서머노트 정보를 저장하기 위한 히든태그 -->
	<input type="hidden" name="summernoteHtml" id="frm4-6" />
	
	<!-- 회사아이디 정보 -->
	<input type="hidden" name="compId" id="frm5-1" />
	<!-- 글번호 정보 -->
	<input type="hidden" name="recruitmentNo" id="frm5-2" />
</form>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- 스크립트 영역 -->
<script>
/*test*/

/* === submit === */
/* --- total --- */
function recruitmentSend()
{
	frm1hiddenInput();
	frm2hiddenInput();
	frm3hiddenInput();
	frm4hiddenInput();
	frm5hiddenInput();
	alert("정상적으로 수정되었습니다.");
	$("#updateFrm").submit();
}
/* 기타정보 */
function frm5hiddenInput()
{
	console.log("기업아이디:"+"<%=compId%>");
	$("#frm5-1").val("<%=compId%>");
	$("#frm5-2").val("<%=recruitmentNo%>");
}
/* 접수기간 및 방법 */
function frm4hiddenInput()
{
	/* ============= 접수시작날짜 ============= */
	var result_startDate = $("#input-term-start").val();
	console.log("접수시작 날짜:"+result_startDate);
	$("#frm4-1").val(result_startDate);
	
	/* ============= 접수종료날짜 ============= */
	var result_endDate = $("#input-term-end").val();
	console.log("접수종료 날짜:"+result_endDate);
	$("#frm4-2").val(result_endDate);
	
	/* ============= 접수방법 ============= */
	var result_howCon = "";
	for(var i=0; i<=6; i++)
	{
		if($("#how-contact-"+i).prop("checked"))
		{
			result_howCon += $("#how-contact-"+i).next().text();
			result_howCon += "/";			
		}
	}
	console.log("접수방법:"+result_howCon);
	$("#frm4-3").val(result_howCon);
	
	/* ============= 접수양식 ============= */
	var result_form = "";
	for(var i=0; i<=2; i++)
	{
		if($("#frm-contact-"+i).prop("checked"))
		{
			result_form += $("#frm-contact-"+i).next().text();
			result_form += "/";			
		}
	}
	console.log("접수양식:"+result_form);
	$("#frm4-4").val(result_form);
	
	/* ============= 전형단계 ============= */
	var result_process = "서류전형-";
	var processCnt = $("#process-td select").length;
	for(var i=0; i<=processCnt; i++)
	{
		result_process += $("#processBox-"+i+" option:selected").text();
		if(i != processCnt) result_process += "-";
	}
	result_process += "최종합격";
	console.log("전형단계:"+result_process);
	$("#frm4-5").val(result_process);
	
	/* ============= 서머노트 컨텐츠 ============= */
	//summernote의 html코드
	var htmlcode = $("#summernote-area").summernote('code');
	console.log(htmlcode);
	$("#frm4-6").val(htmlcode);
	//테스트용
}
/* 근무조건 */
function frm3hiddenInput()
{
	/* ============= 근무지역 ============= */
	var result_workLocation = '';
	var result_workLocationName = '';
	
    for (var i=0; i<$('#workLocation-select-result').find('li').length; i++)
    {
    	result_workLocation += $('#workLocation-select-result').find('li').eq(i).val() +',';
    	result_workLocationName += $('#workLocation-select-result').find('li').eq(i).text() +',';
    }
    result_workLocationName = result_workLocationName.substr(0, result_workLocationName.length -1);
    result_workLocation = result_workLocation.substr(0, result_workLocation.length -1);
    
    console.log("근무지역(이름) : "+result_workLocationName);
    $("#frm3-0").val(result_workLocationName);
	$("#frm3-1").val(result_workLocation);
	
	/* ============= 인근전철역 ============= */
	var result_subway = $("#subway-code-result-Div").text();
	console.log("인근전철역 : "+result_subway.trim());
	$("#frm3-2").val(result_subway.trim());
	
	/* ============= 급여조건 ============= */
	var result_salaryDiv = $("#salary-select option:selected").text();
	var result_salary = $("#salary").val();
	console.log("급여조건:"+result_salaryDiv+","+result_salary);
	$("#frm3-3-1").val(result_salaryDiv);
	$("#frm3-3-2").val(result_salary);
	
	/* ============= 복리후생 ============= */
	var result_benefits = $("#input-Benefits").val();
	console.log("복리후생:"+result_benefits.trim());
	$("#frm3-4").val(result_benefits.trim());
	
	/* ============= 근무시간 ============= */
	var result_workDay = "";
	for(var i=0; i<=7; i++)
	{
		if($("#workTime-"+i).prop("checked")) result_workDay += $("#workTime-"+i).next().text()+",";
	}
	result_workDay = result_workDay.substr(0, result_workDay.length -1);
	console.log("근무시간:"+result_workDay);
	$("#frm3-5").val(result_workDay);
	
}
/*지원조건 및 우대조건*/
function frm2hiddenInput()
{
	/* ============= 학력 ============= */
	var result_education = $("#education-select option:selected").text();
	console.log("학력 : "+result_education);
	$("#frm2-1").val(result_education);
	
	/* ============= 전공 ============= */
	var result_major = $("#major-select-result").text().trim();
	console.log("전공 : "+result_major);
	$("#frm2-2").val(result_major);
	
	/* ============= 외국어 ============= */
	var result_fore = $("#fore-code-result-Div").text().trim();
	console.log("외국어 : "+result_fore);
	$("#frm2-3").val(result_fore);
	
	/* ============= 자격증 ============= */
	var result_certificate;
	/* result_certificate = $("#input-certificate").text().trim(); */
	result_certificate = $("#comAbill-code-result-Div").text().trim();
	console.log("자격증 : "+result_certificate);
	$("#frm2-4").val(result_certificate);
	
	/* ============= 컴퓨터활용능력 ============= */
	var result_comAbill = $("#comAbill-code-result-Div").text().trim();
	console.log("컴퓨터활용능력 : "+result_comAbill);
	$("#frm2-5").val(result_comAbill);
	
	/* ============= 우대사항 ============= */
	var result_preference = $("#preference-code-result-Div").text().trim();
	console.log("우대사항 : "+result_preference);
	$("#frm2-6").val(result_preference);
	
	/* ============= 연령제한 ============= */
	//자체 jquery 처리
	console.log("연령제한 : ");
	console.log($("#frm2-7").val());
	if($("#age-cut").prop("checked"))
	{
		var ageCutStart = $("#input-age-start").val();
		var ageCutEnd = $("#input-age-end").val();
		var result = "연령제한/"+ageCutStart+"/"+ageCutEnd;		
		console.log("연령데이터 체크");
		console.log(result);
	}
	$("#frm2-7").val(result);
	
	/* ============= 성별제한 ============= */
	var result_gender = $("input[name='genderCut']:checked").next().text();
	console.log("성별제한 : "+result_gender);
	$("#frm2-8").val(result_gender);
	
	/* ============= 기타자격요건 ============= */
	var result_other = $("#otherRequirement").val();
	console.log("기타자격요건 : "+result_other);
	$("#frm2-9").val(result_other);
}
/*기본정보*/
function frm1hiddenInput()
{
	/* ============= 제목 ============= */
	var result_title = $("#titleText-select-result").val();
	console.log("공고제목 : "+result_title);
	$("#frm1-0").val(result_title);
	
	/* ============= 모집직집직종 ============= */
	var result_job = ($("span#jobs-select-result").text()).trim();
	console.log("모집직종 : "+result_job);
	$("#frm1-1").val(result_job);
	
	/* ============= 경력 ============= */
	var result_crr = $("input[name='crr']:checked").next().text();
	var crrAdd = "";
	//경력이 포함될 경우
	if(result_crr.indexOf("경력") > -1)
	{
		//연차무관이 선택 될 경우
		if($("#irrelevant-crr").prop("checked")) crrAdd += "/연차무관";
		else crrAdd += "/"+$("#crr-cntUp option:selected").val()+"~"+$("#crr-cntDown option:selected").val();
		
		result_crr += crrAdd;
		console.log("경력 : "+result_crr);
	}
	$("#frm1-2").val(result_crr);
	
	/* ============= 고용형태 ============= */
	var result_empType = "";
	$("input[name=Employ_Ty_CdName]:checked").each(function(){
		var text = $(this).next().text();
		result_empType += text;
		
		//선택에 따라 다른정보를 추가저장
		if(text == "정규직")
		{
		}
		else if(text == "계약직")
		{
		}
		else if(text == "병역특례")
		{
		}
		else if(text == "인턴")
		{
		}
		else if(text == "프리랜서")
		{
		}
		else if(text == "위촉직")
		{
		}
		else if(text == "알바")
		{
		}
		
		result_empType += ",";
	});
	console.log("고용형태 : "+result_empType);
	$("#frm1-3").val(result_empType);
	
	/* ============= 고용인원 ============= */
	var result_empCnt = $("input#input-cnt").val();
	console.log("고용인원 : "+result_empCnt);
	$("#frm1-4").val(result_empCnt);
	
	/* ============= 담당업무 ============= */
	var result_asignedTask = $("#asignedTaskArea").val();
	console.log("담당업무 : "+result_asignedTask);
	$("#frm1-5").val(result_asignedTask);
	
	/* ============= 근무부서 ============= */
	var result_department = $("#input-department").val();
	console.log("근무부서 : " + result_department);
	$("#frm1-6").val(result_department);
	
	/* ============= 모집직급/직책 ============= */
	var result_jobGrade = $("#job-code-result-Div").text();
	console.log("모집직급/직책 : " + result_jobGrade.trim());
	$("#frm1-7").val(result_jobGrade.trim());
	
}
//변수시작(qustntlwkr)
//지하철노선도 정보를 전역변수로 선언
var subwayStationAll;
//JobList정보를 전역변수로 선언
var dataJobList;
//첫 결과 div입력 확인
var firstInputJobBool = true;
var firstInputPreferenceBool = true;
var firstInputSubway = true;
//컴퓨터활용정보 전역변수로 선언
var computerAbiility;
//함수시작(gkatntlwkr)
/*View 페이지에서 데이터를 변경하려 할  경우 - 검색어 : 변경초기화*/
var frm1_1changed = false;
var frm1_7changed = false;
var frm2_2changed = false;
var frm2_3changed = false;
var frm2_4changed = false;
var frm2_6changed = false;
var frm3_0changed = false;
var frm3_2changed = false;
var frm3_4changed = false;

/* summernote 이미지처리 */
/*
function sendFile(file){
	console.log("호출됨");
	// 파일 전송을 위한 폼생성
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type: "POST",
		url: '${pageContext.request.contextPath}/company/summernoteSend.ithrer',
		cache: false,
		contentType: false,
		processData: false,
		success: function(url) {
			// 에디터 안에 이미지 삽입
			$("#summernote").summernote('insertImage', url);
			console.log("처리된 이미지 주소");
			console.log(url);
		},
		error: function(){
			console.log("ajax 실패");
		}
	});
}
*/
function reset_workLocation()
{
	$("#workLocation-select-result li").remove();
	$("#workLocation-code-result-Div").hide();
}
/* 지역정보를 1차적으로 입력 */
function input_workLocation()
{
	/* if(!frm3_0changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#workLocation-select-result").text("");
			frm3_0changed = true;
			$("#workLocation-code-result-Div").hide();
		}	
	}
	else
	{ */
		var result_text1 = $("#location-select-1 option:selected").text();
		var result_text2 = $("#location-select-2 option:selected").text();
		var result_val = $("#location-select-2 option:selected").val();
		
		$("#workLocation-select-result").append("<li value='"+result_val+"'>"+result_text1+" "+result_text2+"</li>");
		$("#workLocation-code-result-Div").show();	
	//}
}
/* 근무지역 1차 선택 시 2차 선택지 출력 */
$("#location-select-1").on("change", function(){
	var targetLocation = $("#location-select-1 option:selected").val();
	$("#location-select-2 option").remove();
	$.ajax({
		url: "${pageContext.request.contextPath}/company/recruitmentLoadLocation.ithrer?targetLocation="+targetLocation,
		dataType: "json",
		Type: "get",
		success: function(data)
		{
			console.log(data);
			for(var i in data)
			{
				$("#location-select-2").append("<option value='"+data[i].locationCode+"'>"+data[i].locationName+"</option>");		
			}
		},
		error: function () 
		{
	        console.log("페이지 데이터 로드 실패_ajax");
	    }
	});
});
function selectLocation(result_frm3_0)
{
		var targetLocation = $("#location-select-1 option:selected").val();
		$("#location-select-2 option").remove();
		$.ajax({
			url: "${pageContext.request.contextPath}/company/recruitmentLoadLocation.ithrer?targetLocation="+targetLocation,
			dataType: "json",
			Type: "get",
			success: function(data)
			{
				console.log(data);
				for(var i in data)
				{
					$("#location-select-2").append("<option value='"+data[i].locationCode+"'>"+data[i].locationName+"</option>");		
				}
				var location2_Option = $("#location-select-2 option");
				for(var i in location2_Option)
				{
					if(location2_Option[i].innerText == null) break;
					if(result_frm3_0.includes(location2_Option[i].innerText))
					{
						$(location2_Option[i]).attr("selected","selected");
					}
				}
				input_workLocation();
			},
			error: function () 
			{
		        console.log("페이지 데이터 로드 실패_ajax");
		    }
		});

}
/* 컴퓨터활용능력 값이 변경 시 - 직접입력 */
$("#computer-ability").on("change", function(){
 	var selected = $("#computer-ability option:selected").text();
	if(selected == "직접입력")
	{
		$("#computer-ability-name").hide();
		$("#otherInput-comabill").show();
	}
	else
	{
		$("#computer-ability-name").show();
		$("#otherInput-comabill").hide();
	}
});
/* 복리후생 결과 입력 */
function addBenefitList()
{
	var resultText = $("#result-benefitList").text();
	console.log(resultText);
	$("#input-Benefits").val(resultText);
	returnPage_benefit();
}
/* 복리후생 체크박스 선택 시 팝업 결과창에 입력 */
$(".benefitChk").on("click", function(){
	//id값을 가져온다.(동적으로 생성되는 태그의 아이디로 주기위해)
	var selectChkboxId = ($(this).attr("id"));
	//실제값을 가져온다.
	var resultText = $(this).next().text();
	console.log($(this).prop("checked"));
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	if($(this).prop("checked"))
	{
		if($("#benefitList-select-result li").length > 5) alert("최대 5개까지 등록 가능합니다.");
		else if($("#benefitList-select-result li").length > 0) $("#benefitList-select-result").append("<li class='resultBenefit result-Frm' id='"+selectChkboxId+"'>"+" / "+resultText+"&nbsp;&nbsp;</li>");	
		else $("#benefitList-select-result").append("<li class='resultBenefit result-Frm' id='"+selectChkboxId+"'>"+resultText+"&nbsp;&nbsp;</li>");
	}
	else
	{
		/* console.log(searchTarget); */
		$("li#"+selectChkboxId).remove();
		/* $("#"+searchTarget).prop('checked', false); */
	}
});
/* 복리후생 팝업창 닫기 */
function returnPage_benefit()
{
	$("#benefit-popup-background").hide(250);
}
/* 복리후생 팝업창 띄우기 */
function benefitAll()
{
	if(!frm3_4changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#input-Benefits").val("");
			frm3_4changed = true;
		}
	}
		$("#benefit-popup-background").show(250);
}
/* 지하철-결과div초기화 */
function reset_subway()
{
	$("#subway-code-result-Div").hide();
	$("#subway-select-result li").remove();
	firstInputSubway = true;
}
/* 지하철-결과div에 추가하기 */
function subwayInput()
{
	if(!frm3_2changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#subway-select-result").text("");
			frm3_2changed = true;
			$("#subway-code-result-Div").hide();
		}
	}
	else
	{
		var category1 = $("#train-select option:selected").text();
		var category2 = $("#station-select option:selected").text();

		var check = category1+","+category2;
		console.log(check);
		if($("#subway-select-result li:contains('"+check+"')").text())	alert("중복된 항목입니다.");
		else $("#subway-select-result").append("<li style='list-style:none;'> - "+category1+","+category2+"</li>");
		firstInputSubway = false;
		$("#subway-code-result-Div").show();	
	}
	
}
/* 지하철 라인 선택 시 하위 목록 출력 */
$(document).on("change", "#train-select", function(){
	var selectTrain = $("#train-select option:selected").text();
	showStation(selectTrain);
});
function showStation(selectTrain)
{
	var result = "";

	for(var i in subwayStationAll)
	{
		result += subwayStationAll[i].lineName==selectTrain?"<option value='"+subwayStationAll[i].stationName+"'>"+subwayStationAll[i].stationName+"</option>":"";
	}
	$("#station-select option").remove();
	$("#station-select").append("<option value='지하철역'>지하철역</option>");
	$("#station-select").append(result);
}
/* 연령무관 선택시 */
$("#age-none").on("click", function(){
	$("#input-age-start").attr("disabled", true);
	$("#input-age-end").attr("disabled", true);
	$("#frm2-7").val($(this).next().text());
});
/* 연령제한 선택시 */
$("#age-cut").on("click", function(){
	$("#input-age-start").attr("disabled", false);
	$("#input-age-end").attr("disabled", false);
	console.log($(this).next().text());
	$("#frm2-7").val("연령제한/");
});
/* 우대사항 결과div에 입력 */
function preferenceResultAdd()
{
	var result_preference = $("#preference-select-result").text().trim();
	console.log("result_preference"+result_preference);
	$("#preference-select-result2").text("");
	$("#preference-code-result-Div").append(result_preference);
	$("#preference-popup-background").hide();
}
/* 우대사항 체크 */
$(".preference-popup li input").on("click", function (){
	//첫요소인지 확인하기 위한 변수, 있다면 구분자를 추가
	var divChar = firstInputPreferenceBool==true?"":"/&nbsp;";
	firstInputPreferenceBool = false;
	//id값을 가져온다.(동적으로 생성되는 태그의 아이디로 주기위해)
	var selectChkboxId = ($(this).attr("id"));
	//실제값을 가져온다.
	var resultText = $(this).next().text();
	console.log($(this).prop("checked"));
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	/* var searchTarget = $(this).attr("name");
	console.log(searchTarget); */
	if($(this).prop("checked"))
	{
		if($("#preference-select-result").length > 9)
		{
			alert("최대 10개까지 등록 가능합니다.");
			return;
		}
		$("#preference-select-result").append("<li class='resultPreference result-Frm' id='"+selectChkboxId+"'>"+divChar+resultText+"&nbsp;&nbsp;</li>");
		/* $("#"+searchTarget).prop('checked', true);
		console.log(searchTarget); */
	}
	else
	{
		/* console.log(searchTarget); */
		$("li#"+selectChkboxId).remove();
		/* $("#"+searchTarget).prop('checked', false); */
	}
});
/* 우대사항 전체보기 취소닫기 */
function closePreferencePopup()
{
	$("#preference-popup-background").hide();
}
/* 우대사항 전체보기 */
function preferenceAllbtn()
{
	if(!frm2_6changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#preference-code-result-Div").text("");
			frm2_6changed = true;
		}
	}
	else
	{
		$("#preference-popup-background").show();	
	}
}
/* 컴퓨터활용능력-결과div초기화 */
function reset_comAbill()
{
	$("#comAbill-code-result-Div").hide();
	$("#comAbill-select-result li").remove();
	firstInputComabill = true;
}
/* 컴퓨터활용능력-결과div에 추가하기 */
function foreInput()
{
	if(!frm2_4changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#comAbill-select-result li").remove();
			$("#comAbill-code-result-Div").hide();
			frm2_4changed = true;
		}
	}
	else
	{
		var category1 = $("#computer-ability option:selected").text();
		
		var otherInputCheckBool = $("#computer-ability option:selected").text()=="직접입력"?true:false;
		var category2;
		
		if(otherInputCheckBool) category2 = $("#otherInput-comabill").val();
		else category2 = $("#computer-ability-name option:selected").text();

		var check = " - "+category1+","+category2;
		console.log(check);
		if($("#comAbill-select-result li:contains('"+check+"')").text())	alert("중복된 항목입니다.");
		else $("#comAbill-select-result").append("<li style='list-style:none;'> - "+category1+","+category2+"</li>");
		firstInputComabill = false;
		$("#comAbill-code-result-Div").show();
	}
}
/* 컴퓨터활용능력-기능구분 선택 시 하위 목록 출력 */
$(document).on("change", "#computer-ability", function(){
	var comAbillityDiv = $("#computer-ability option:selected").text();
	showComAbillity(comAbillityDiv);
});
function showComAbillity(comAbillityDiv)
{
	var result = "";

	for(var i in computerAbiility)
	{
		result += computerAbiility[i].division==comAbillityDiv?"<option value='"+computerAbiility[i].functionName+"'>"+computerAbiility[i].functionName+"</option>":"";
	}
	$("#computer-ability-name option").remove();
	$("#computer-ability-name").append("<option value='기능명'>기능명</option>");
	$("#computer-ability-name").append(result);
}


/*
$("#computer-ability option").on("click", function(){
	var test = $(this).text();
	console.log(test);
});
*/

/* 외국어 결과를 초기화 시켜주는 버튼 */
function reset_fore()
{
	$("#fore-select-result li").remove();
	$("#fore-code-result-Div").hide();
}
/* 외국어 입력 시 결과 출력 */
function addFore()
{
	if(!frm2_3changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#fore-select-result").text("");
			$("#fore-code-result-Div").hide();
			frm2_3changed = true;
		}
	}
	else
	{
		var foreSelect = $("#fore-lang").text();
		
		if(foreSelect == "언어")
		{
			alert("언어를 선택해주세요.");
			return;
		}
		else
		{
			//최대 4개까지 등록가능
			if($("#fore-select-result li").length > 3)
			{
				alert("최대 4개까지 등록 가능합니다.");
				return;
			}
			
			//첫번째 요소가 있는지 검사
			var resultFirstBool = $("#fore-select-result li").length==0?true:false;
			var addLiId = $("#fore-lang option:selected").attr("name");
			var result_fore =  $("#fore-lang option:selected").text()+":"+$("#fore-level1 option:selected").text();
			console.log(result_fore);
			
			if(resultFirstBool)
			{
				$("#fore-select-result").append("<li class='fore-selectLi' id='"+addLiId+"'>"+result_fore+"</li>");
				$("#fore-code-result-Div").css("display","inline-block");
				$("#fore-code-result-Div").show();
			}
			else
			{
				//이미 추가된 요소인지 확인
				var check_deplicate = $("li.fore-selectLi:contains('"+result_fore+"')").text();
				var check_deplicateBool = (check_deplicate.match(result_fore))==null?false:true;
				
				if(check_deplicateBool) alert("이미 등록된 항목입니다.");			
				else $("#fore-select-result").append("<li class='fore-selectLi' id='"+addLiId+"'>&nbsp;/ "+result_fore+"</li>");			
			}
		}
	}
}
/* 모집직책/직급-팝업 결과 div에 추가 */
$(".position-chkBox-popup").on("click", function(){
	//첫요소인지 확인하기 위한 변수, 있다면 구분자를 추가
	var divChar = firstInputJobBool==true?"":"/&nbsp;";
	firstInputJobBool = false;
	console.log("도대체 길이가 얼마길래 : " + firstInputJobBool);
	//id값을 가져온다.(동적으로 생성되는 태그의 아이디로 주기위해)
	var selectChkboxId = ($(this).attr("id"));
	console.log("selectChkboxId : "+selectChkboxId);
	//실제값을 가져온다.
	var resultText = $(this).next().text();
	console.log("resultText : "+resultText);
	
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	var searchTarget = $(this).attr("name");
	console.log(searchTarget);
	if($(this).prop("checked"))
	{
		$("#jobList-select-result2").append("<li class='resultJob result-Frm' id='"+selectChkboxId+"'>"+divChar+resultText+"&nbsp;&nbsp;</li>");
		$("#"+searchTarget).prop('checked', true);
		console.log(searchTarget);
	}
	else
	{
		console.log(searchTarget);
		$("li#"+selectChkboxId).remove();
		$("#"+searchTarget).prop('checked', false);
	}
});

/* 모집직책/직급을 결과 div에 추가 */
$(".position-chkBox").on("click", function(){
	//첫요소인지 확인하기 위한 변수, 있다면 구분자를 추가
	console.log(firstInputJobBool+"g");
	var divChar = firstInputJobBool==true?"":"/&nbsp;";
	firstInputJobBool = false;
	//id값을 가져온다.(동적으로 생성되는 태그의 아이디로 주기위해)
	var selectChkboxId = ($(this).attr("id"));
	console.log("selectChkboxId : "+selectChkboxId);
	//실제값을 가져온다.
	var resultText = $(this).next().text();
	console.log("resultText : "+resultText);
	
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	var searchTarget = $(this).attr("name");
	console.log(searchTarget);
	if($(this).prop("checked"))
	{
		$("#job-select-result").append("<li class='resultJob result-Frm' id='"+selectChkboxId+"'>"+divChar+resultText+"&nbsp;&nbsp;</li>");
		$("#"+searchTarget).prop('checked', true);
		console.log(searchTarget);
	}
	else
	{
		console.log(searchTarget);
		$("li#"+selectChkboxId).remove();
		$("#"+searchTarget).prop('checked', false);
	}
	/*
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	if($(this).prop("checked"))	$("#job-select-result").append("<li class='resultJob result-Frm' id='"+selectChkboxId+"'>"+divChar+resultText+"&nbsp;&nbsp;</li>");	
	else $("li#"+selectChkboxId).remove();
	*/
});
function posotionResultAdd()
{
	var result = $("#jobList-select-result2").text().trim();
	$("#job-code-result-Div").text("");
	$("#job-code-result-Div").append(result);
	$("#position-popup-background").hide(250);
}

/* 모집직종을 최종등록 */
function addJob()
{
	var result = $("#jobList-select-result").text().trim();
	$("#jobs-select-result").text("");
	$("#jobs-select-result").append(result);
	$("#recruit-popup-background").hide(250);
}
/* 전형을 추가하는 함수 */
function processAdd()
{
	var id_index = ($("#process-td select").length);
	var html = "<span> > </span><select class='form-control formStyleChange inlineblock-select fore-select join-process' id='processBox-"+id_index+"'><option value='기능구분' >면접전형</option><option value='기능구분'>2차면접전형</option>	<option value='기능구분'>3차면접전형</option><option value='기능구분' selected>시험전형</option><option value='기능구분'>검사전형</option><option value='기능구분'>최종심사</option></select>";
	if(id_index > 3) return;
	else ($("#process-td select").last()).after(html);
}
/* 전공계열 입력 시 결과폼에 출력하는 함수 */
function input_major()
{
	if(!frm2_2changed)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			$("#major-select-result").text("");
			frm2_2changed = true;
			$("#major-code-result-Div").hide();
		}
	}
	else
	{
		/* 결과폼에 출력할 결과값 */
		var major_selected = $("#major-select option:selected").text();
		/* 아이디로 지정할 Option의 Val값 */
		var major_val = $("#major-select option:selected").val();
		
		//전공을 선택하지 않고 입력했을 경우
		if(major_selected == "전공계열")
		{
			alert("전공을 선택해주세요.");
			return;
		}
		
		//첫요소인지 확인하기 위한 변수, 있다면 구분자를 추가
		var divChar = $("ul#major-select-result li").length==0?"":"/&nbsp;";
		//이미 추가된 요소인지 확인
		var check_deplicate = $("li.result-major:contains('"+major_selected+"')").text();
		var check_deplicateBool = (check_deplicate.match(major_selected))==null?false:true;
		
		//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다. 최대 3개까지 등록 가능하다.
		if($("#major-select-result>li.result-Frm").length >= 3) alert("최대 3개까지 등록 가능합니다.");
		else if(!check_deplicateBool) $("#major-select-result").append("<li class='result-major result-Frm' id='"+major_val+"'>"+divChar+major_selected+"&nbsp;&nbsp;</li>");
		else alert("이미 등록된 전공입니다.");
		//입력된 것이 하나도 있는지 확인한다. 결과에 따라 div를 보여주거나 숨긴다.
		isChecked("major");
	}
}
/* 전공계열을 초기화 시켜주는 버튼 */
function reset_major()
{
	$("#major-code-result-Div li").remove();
	$("#major-code-result-Div").hide();
}
/* 체크된게 있는지 확인하여 div를 숨기고 보이는 함수 */
function isChecked(checkType)
{
	if($("#"+checkType+"-select-result li").length) $("#"+checkType+"-code-result-Div").show();
	else $("#"+checkType+"-code-result-Div").hide();
}
/* 모집직급/직책 선택 시 input태그에 추가하기 */
$(".job-chkBox").on("click", function(){
	//첫요소인지 확인하기 위한 변수, 있다면 구분자를 추가
	var divChar = $("ul#job-select-result li").length==0?"":"/&nbsp;";
	//id값을 가져온다.(동적으로 생성되는 태그의 아이디로 주기위해)
	var selectChkboxId = ($(this).next().attr("id"));
	//실제값을 가져온다.
	var resultText = $(this).next().text();
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	var searchTarget = $(this).attr("name");
	console.log(searchTarget);
	if($(this).prop("checked"))
	{
		$("#job-select-result").append("<li class='resultJob result-Frm' id='"+selectChkboxId+"'>"+divChar+resultText+"&nbsp;&nbsp;</li>");
		$("#"+searchTarget).prop('checked', true);
		console.log(searchTarget);
	}
	else
	{
		console.log(searchTarget);
		$("li#"+selectChkboxId).remove();
		$("#"+searchTarget).prop('checked', false);
	}
	//체크된 것이 하나도 있는지 확인한다. 결과에 따라 div를 보여주거나 숨긴다.
	isChecked("job");
});
/* 모직직급/직책 팝업 취소 */
$("#position-cancleBtn").on("click", function(){
	$("#position-popup-background").hide(250);
});
/* 모직집급/직책 전체보기 버튼 */
function positionAllBtn()
{

	if(frm1_7changed == false)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			frm1_7changed = true;
			$("#job-code-result-Div").text("");		
			$("#position-popup-background").show(250);
		}
	}
	else $("#position-popup-background").show(250);
}
/* 기간 직접입력 선택 시 - 알바 */
function input_date_check_rbar(str)
{
	if(str == "myinputDate-rbar")
	{
		$("#hiddenDiv-Date-rbar").css("display", "inline");
		$("#hiddenDiv-Date-rbar").show();
		
	}
	else
	{
		$("#hiddenDiv-Date-rbar").hide();
		
	}
}
/* 기간 직접입력 선택 시 - 위촉 */
function input_date_check_commision(str)
{
	if(str == "myinputDate-commision")
	{
		$("#hiddenDiv-Date-commision").css("display", "inline");
		$("#hiddenDiv-Date-commision").show();
		
	}
	else
	{
		$("#hiddenDiv-Date-commision").hide();
		
	}
}
/* 기간 직접입력 선택 시 - 프리랜서 */
function input_date_check_pre(str)
{
	if(str == "myinputDate-pre")
	{
		$("#hiddenDiv-Date-pre").css("display", "inline");
		$("#hiddenDiv-Date-pre").show();
		
	}
	else
	{
		$("#hiddenDiv-Date-pre").hide();
		
	}
}
/* 기간 직접입력 선택 시 - 인턴 */
function input_date_check_inturn(str)
{
	if(str == "myinputDate-inturn")
	{
		$("#hiddenDiv-Date-inturn").css("display", "inline");
		$("#hiddenDiv-Date-inturn").show();
	}
	else
	{
		$("#hiddenDiv-Date-inturn").hide();
	}
}
/* 기간 직접입력 선택 시 - 계약직 */
function input_date_check_contract(str)
{
	if(str == "myinputDate-contract")
	{
		$("#hiddenDiv-Date-Contract").css("display", "inline");
		$("#hiddenDiv-Date-Contract").show();
	}
	else
	{
		$("#hiddenDiv-Date-Contract").hide();
	}
}
/* 알바 */
var checked_rbar = false;
$("#Employ_Ty_Cd_select_7").on("click", function(){
	console.log("아오");
	checked_rbar = checked_rbar==true?false:true;
	if(checked_rbar == true) $("#employType6").show();
	else $("#employType6").hide();
});
/* 위촉직 */
var checked_commision = false;
$("#Employ_Ty_Cd_select_6").on("click", function(){
	checked_commision = checked_commision==true?false:true;
	if(checked_commision == true) $("#employType5").show();
	else $("#employType5").hide();
});
/* 프리랜서 */
var checked_pre = false;
$("#Employ_Ty_Cd_select_5").on("click", function(){
	checked_pre = checked_pre==true?false:true;
	if(checked_pre == true) $("#employType4").show();
	else $("#employType4").hide();
});
/* 인턴 */
var checked_inturn = false;
$("#Employ_Ty_Cd_select_4").on("click", function(){
	checked_inturn = checked_inturn==true?false:true;
	if(checked_inturn == true) $("#employType3").show();
	else $("#employType3").hide();
});
/* 병역특례 클릭 시 히든내용 view */
var checked_ms = false;
$("#Employ_Ty_Cd_select_3").on("click", function(){
	checked_ms = checked_ms==true?false:true;
	if(checked_ms == true) $("#employType2").show();
	else $("#employType2").hide();
});
/* 계약직 클릭 시 히든내용 view */
var checked_contract = false;
$("#Employ_Ty_Cd_select_2").on("click", function(){
	checked_contract = checked_contract==true?false:true;
	if(checked_contract == true) $("#employType1").show();
	else $("#employType1").hide();
});
/* 정규직 클릭 시 히든내용 view */
var checked_regular = false;
$("#Employ_Ty_Cd_select_1").on("click", function(){
	checked_regular = checked_regular==true?false:true;
	if(checked_regular == true) $("#employType0").show();
	else $("#employType0").hide();
});
/* 페이지 완전로딩 후 뷰 */
$(document).ready(function(){
	console.log(' dk\'dk ');
	//페이지에 필요한 정보를 가져오는 AJAX
	$.ajax({
		url: "${pageContext.request.contextPath}/company/recruitmentAddLoad.ithrer",
		dataType: "json",
		Type: "get",
		success: function(data)
		{
			console.log(data);
			dataJobList = data[1];
			//모집직종 - JOB1
			for(var i in data[0])
			{
				$("#job2").append("<li class='jobList-select jobList-selectLi'><span id='jobList-select-"+i+"'>"+data[0][i].job1+"</li>");
			}
			
			//컴퓨터활용능력 - 1
			for(var i in data[2])
			{
				$("#computer-ability").append("<option class='computerLi1' value='"+data[2][i].division+"'>"+data[2][i].division+"</option>");
			}
			//컴퓨터활용능력 - 2
			computerAbiility = data[3];
			
			//지하철노선도 - 호선
			for(var i in data[4])
			{
				$("#train-select").append("<option>"+data[4][i].lineName+"</option>");		
			}
			//지하철노선도 - 전체
			subwayStationAll = data[5];
			
		},
		error: function () 
		{
	        console.log("페이지 데이터 로드 실패_ajax");
	    }
	});
	
	
	$("html").css("display", "block");
	//서머노트 이미지 업로드
	var sendFile = function (upFile, el) {
	  var directory = 'images/summernote';
	  var form = $("#testFrm")[0];
      var form_data = new FormData();
      form_data.append('upFile', upFile);
      form_data.append("directory", directory);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '${pageContext.request.contextPath}/fileUploadSummernote.ithrer',
        cache: false,
        processData: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
        	console.log(url);
        	console.log("이미지 전송 성공!!!!!!");
        	var html = "<img src="+"${pageContext.request.contextPath}/displayFile.ithrer?fileName="+url+"&directory=summernote"+" alt='채용공고' width='100px'/>";
        	url = "${pageContext.request.contextPath}/displayFile.ithrer?fileName="+url+"&directory=summernote";
        	$(el).summernote('editor.insertImage', url);
            $('#imageBoard > ul').append('<li>'+html+'</li>');
        },
        error: function(){
        	console.log("이미지 전송 ajax 실패");
        }
      });
    }
	//서머노트 준비
	$("#summernote-area").summernote({
		width: "100%",
		height: 300,
		lang: 'ko-KR',
		fontNames: ['fontA',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
		callbacks: {
			// 이미지 업로드시 사용될 콜백함수
			onImageUpload: function(files, editor, welEditable){
				for(var i = files.length -1; i>=0; i--)
				{
					sendFile(files[i], this);				
				}
			}
		}
	});
	
	/* 기존정보 불러오기 rlwhs */
	//frm1-1 : 모집직종
	var result_frm1_1 = "<%=rect.getTypeOfOccupation()%>";
	console.log("모집직종:"+result_frm1_1);
	if(result_frm1_1 != 'null') $("#jobs-select-result").append(result_frm1_1);
	//frm1-2 : 경력
	var result_frm1_2 = "<%=rect.getCareer()%>";
	if(result_frm1_2 != 'null')
	{
		console.log("경력:"+result_frm1_2);
		var resultArr_frm1_2 = new Array(result_frm1_2.split("/"));
		var crr_Contentli = $("#crr-Content li");
		for(var i in crr_Contentli)
		{
			if(crr_Contentli[i].innerText == null) break;
			if(resultArr_frm1_2[0][0] == (crr_Contentli[i].innerText).trim())
			{
				$(crr_Contentli[i].children).find("input").trigger("click");
			}
		}
		if(result_frm1_2.includes("경력"))
		{
			if(resultArr_frm1_2[0][1] == "연차무관")
			{
				$("#irrelevant-crr").trigger("click");
				$("#crr-cntUp, #crr-cntDown").attr("disabled", "disabled");	
			}
			else
			{
				var result_frm1_2rate = new Array(resultArr_frm1_2[0][1].split("~"));
				$("#crr-cntUp option[value="+result_frm1_2rate[0][0]+"]").attr("selected", "selected");	
				$("#crr-cntDown option[value="+result_frm1_2rate[0][1]+"]").attr("selected", "selected");		
			}
		}
	}
	//frm1-3 : 고용형태
	var result_frm1_3 = "<%=rect.getEmploymentType()%>";
	if(result_frm1_3 != 'null')
	{
		console.log("고용형태:"+result_frm1_3);
		var frm1_3_Content = $("#employType-Div input");
		for(var i in frm1_3_Content)
		{
			if(frm1_3_Content[i].value == null) break;
			if(result_frm1_3.includes(frm1_3_Content[i].value))
			{
				$(frm1_3_Content[i]).trigger("click");
			}
		}
	}
	//frm1-4 : 모집인원
	var result_frm1_4 = "<%=rect.getRecruitmentPersonnel()%>";
	if(result_frm1_4 != 'null')
	{
		console.log("모집인원:"+result_frm1_4);
		$("#input-cnt").val(result_frm1_4);
	}
	//frm1-5 : 담당업무
	var result_frm1_5 = "<%=(rect.getAsignedTask()).replaceAll("(\r\n|\r|\n|\n\r)", "<br>")%>";
	if(result_frm1_5 != 'null')
	{
		console.log("담당업무:"+result_frm1_5);
		$("#asignedTaskArea").val(result_frm1_5.replace(/<br>/gi,"\r\n"));
	}
	//frm1-6 : 근무부서
	var result_frm1_6 = "<%=rect.getDepartment()%>";
	if(result_frm1_6 != 'null')
	{
		console.log("근무부서:"+result_frm1_6);
		$("#input-department").val(result_frm1_6);
	}
	//frm1-7 : 모집직책/직급
	var result_frm1_7 = "<%=rect.getPosition()%>";
	if(result_frm1_7 != 'null')
	{
		console.log("모집직책/직급:"+result_frm1_7);
		$("#job-code-result-Div").append(result_frm1_7);
	}
	
	//frm2-1 : 학력조건
	var result_frm2_1 = "<%=rect.getEducation()%>";
	if(result_frm2_1 != 'null')
	{
		console.log("학력조건:"+result_frm2_1)	;
		var frm2_1_Content = $("#education-select option");
		for(var i in frm2_1_Content)
		{
			if(frm2_1_Content[i].value == null) break;
			if($(frm2_1_Content[i]).val() == result_frm2_1)
				$(frm2_1_Content[i]).attr("selected", "selected");
		}
	}
	//frm2-2 : 전공계열
	var result_frm2_2 = "<%=rect.getMajor()%>";
	if(result_frm2_2 != 'null')
	{
		console.log("전공계열:"+result_frm2_2)	;
		$("#major-code-result-Div").show();
		var frm2_2_Content = $("#major-select option");
		$("#major-select-result").append(result_frm2_2);
	}
	//frm2-3 : 외국어
	var result_frm2_3 = "<%=rect.getForeLang()%>";
	if(result_frm2_3 != 'null')
	{
		console.log("외국어:"+result_frm2_3);
		$("#fore-code-result-Div").show();
		$("#fore-select-result").append(result_frm2_3);
	}
	//frm2-4 : 자격증
	var result_frm2_4 = "<%=(rect.getCertificate()).replaceAll("(\r\n|\r|\n|\n\r)", "<br>")%>";
	if(result_frm2_4 != 'null')
	{
		console.log("자격증:"+result_frm2_4);
		var result_frm2_4_end = new Array(result_frm2_4.split("-"));
		$("#comAbill-code-result-Div").show();
		for(var i in result_frm2_4_end[0])
		{
			if(i == 0) continue;
			$("#comAbill-select-result").append("<li style='list-style:none;'> - "+result_frm2_4_end[0][i]+"</li>");		
		}
	}
	//frm2-5 : 삭제됨
	//frm2-6 : 우대사항
	var result_frm2_6 = "<%=rect.getEmploymentPreference()%>";
	if(result_frm2_6 != 'null')
	{
		console.log("우대사항:"+result_frm2_6);
		$("#preference-code-result-Div").show();
		$("#preference-code-result-Div").append(result_frm2_6);
	}
	//frm2-7 : 연령
	var result_frm2_7_start = "<%=rect.getApplicantAgeStart()%>";
	var result_frm2_7_end = "<%=rect.getApplicantAgeEnd()%>";
	if(result_frm2_7_start != 'null' && result_frm2_7_end != 'null')
	{
		console.log("연령:"+result_frm2_7_start+"~"+result_frm2_7_end);
		if(result_frm2_7_start == 0 && result_frm2_7_end == 100)
		{
			$("#age-none").trigger("click");
		}
		else
		{
			$("#age-cut").trigger("click");
			$("#input-age-start").val(result_frm2_7_start);
			$("#input-age-end").val(result_frm2_7_end);
		}
	}
	//frm2-8 : 성별
	var result_frm2_8 = "<%=rect.getGenderCut()%>";
	if(result_frm2_8 != 'null')
	{
		console.log("성별:"+result_frm2_8);
		if(result_frm2_8 == 'M') $("#gender-m").trigger("click");
		else if(result_frm2_8 == 'F') $("#gender-f").trigger("click");
		else $("#gender-none").trigger("click");
	}
	//frm2-9 : 기타자격요건 ★테스트해봐야함
	var result_frm2_9 = "<%=rect.getEtcQualificationRequirement()%>";
	if(result_frm2_9 != 'null')
	{
		console.log("기타자격요건:"+result_frm2_9);
		$("#otherRequirement").val(result_frm2_9);
	}
	
	//frm3-0 : 근무지역명
	var result_frm3_0 = "<%=rect.getLocation().replaceAll(" ",":")%>";
	if(result_frm3_0 != 'null')
	{
		console.log("근무지역명:"+result_frm3_0);
		result_frm3_0_Arr = new Array(result_frm3_0.split(":"));
		console.log(result_frm3_0_Arr);
		var location1_Option = $("#location-select-1 option");
		
		for(var i in location1_Option)
		{
			if(location1_Option[i].innerText == null) break;
			if(result_frm3_0.includes(location1_Option[i].innerText))
			{
				$(location1_Option[i]).attr("selected","selected");
				selectLocation(result_frm3_0);
			}
		}
		
		
		
		
	}	
	//frm3-1 : 근무코드 - pass
	//frm3-2 : 인근전철역
	var result_frm3_2 = "<%=rect.getNearbyStation().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")%>";
	if(result_frm3_2 != 'null')
	{
		console.log("인근전철역:"+result_frm3_2);
		$("#subway-code-result-Div").show();
		$("#subway-select-result").append(result_frm3_2.replace("<br>","\r\n"));
	}
	//frm3-5 : 근무시간
	var result_frm3_5 = "<%=rect.getWorkDay()%>";
	if(result_frm1_3 != 'null')
	{
		console.log("근무시간:"+result_frm3_5);
		var frm3_5_Content = $(".workTime").next();
		var frm3_5_Chk = $(".workTime");
		for(var i in frm3_5_Content)
		{
			if(frm3_5_Content[i].innerText == null) break;
			if(result_frm3_5.includes(frm3_5_Content[i].innerText))
				$(frm3_5_Chk[i]).trigger("click");
		}
	}
	//frm3-3-1 : 급여조건 구분
	var result_frm3_3_1 = "<%=rect.getSalaryType()%>";
	if(result_frm3_3_1 != 'null')
	{
		console.log("급여조건(구분):"+result_frm3_3_1)	;
		var frm3_3_1_Content = $("#salary-select option");
		for(var i in frm3_3_1_Content)
		{
			if(frm3_3_1_Content[i].value == null) break;
			if($(frm3_3_1_Content[i]).val() == result_frm3_3_1)
				$(frm3_3_1_Content[i]).attr("selected", "selected");
		}
	}
	//frm3-3-2 : 급여금액
	var result_frm3_3_2 = "<%=rect.getPayCondition().replaceAll("만원","")%>";
	if(result_frm3_3_2 != 'null')
	{
		console.log("급여(금액):"+result_frm3_3_2);
		$("#salary").val(result_frm3_3_2);
	}
	//frm3-4 : 복리후생
	var result_frm3_4 = "<%=rect.getWelfare()%>";
	if(result_frm3_4 != 'null')
	{
		console.log("복리후생:"+result_frm3_4);
		$("#input-Benefits").val(result_frm3_4);
	}
	//frm4-1, frm4-2 : 접수기간
	var result_frm4_1 = "<%=rect.getOpeningDate().replaceAll(" 00:00:00","")%>";
	var result_frm4_2 = "<%=rect.getClosingDate().replaceAll(" 00:00:00","")%>";
	if(result_frm4_1 != 'null' && result_frm4_2 != 'null')
	{
		console.log("접수기간:"+result_frm4_1+"~"+result_frm4_2);
		$("#input-term-start").val(result_frm4_1);
		$("#input-term-end").val(result_frm4_2);
	}
	//frm4-3 : 접수방법
	var result_frm4_3 = "<%=rect.getApplicationMethod()%>";
	if(result_frm4_3 != 'null')
	{
		console.log("접수방법:"+result_frm4_3);
		var frm4_3_Content = $(".howCon").next();
		var frm4_3_Chk = $(".howCon");
		for(var i in frm4_3_Content)
		{
			if(frm4_3_Content[i].innerText == null) break;
			if(result_frm4_3.includes(frm4_3_Content[i].innerText))
				$(frm4_3_Chk[i]).trigger("click");
		}
	}
	//frm4-4 : 접수양식
	var result_frm4_4 = "<%=rect.getApplicationForm()%>";
	if(result_frm4_4 != 'null')
	{
		console.log("접수방법:"+result_frm4_4);
		var frm4_4_Content = $(".appForm").next();
		var frm4_4_Chk = $(".appForm");
		for(var i in frm4_4_Content)
		{
			if(frm4_4_Content[i].innerText == null) break;
			if(result_frm4_4.includes(frm4_4_Content[i].innerText))
				$(frm4_4_Chk[i]).trigger("click");
		}
	}
	//frm4-5 : 전형단계
	var result_frm4_5 = "<%=rect.getRecruitmentStage().replaceAll("-", "/")%>";
	if(result_frm4_5 != 'null')
	{
		result_frm4_5 = result_frm4_5.substr(5);
		result_frm4_5 = result_frm4_5.substr(0,result_frm4_5.length-5);
		var result_frm4_5_Arr = new Array(result_frm4_5.split("/"));
		var result_frm4_5_Arr_Cnt = result_frm4_5_Arr[0].length;
		console.log(result_frm4_5_Arr);
		console.log(result_frm4_5_Arr_Cnt);
		for(var i=2; i<result_frm4_5_Arr_Cnt; i++)
		{
			console.log("클릭");
			processAdd();
		}
		console.log(result_frm4_5_Arr);
		var frm4_5_selectCnt = $("#processBox-1 option").length;
		console.log("j길이"+frm4_5_selectCnt);
		console.log("i길이"+result_frm4_5_Arr_Cnt);
		for(var i=0; i<=result_frm4_5_Arr_Cnt; i++)
		{
			console.log(i+"번째 선택중");
			for(var j=0; j<frm4_5_selectCnt; j++)
			{
				console.log($("#processBox-"+i).children().eq(j).text() + " ::: " + result_frm4_5_Arr[0][i]);
				console.log(($("#processBox-"+i).children().eq(j).text()));
				console.log(result_frm4_5_Arr[0][i]);
				if($("#processBox-"+i).children().eq(j).text() == result_frm4_5_Arr[0][i])
				{
					console.log("적용");
					$("#processBox-"+i).children().eq(j).attr("selected","selected");
					break;
				}
			}
		}
	}
	//frm4-6 : 서머노트
	
	var result_frm4_6 = '<%=rect.getSummernoteHtml()%>';
	if(result_frm4_6 != 'null')
	{
		console.log("summernote:"+result_frm4_6);
		//$('#summernote').summernote('insertText', HTMLstring);
		$(".note-editable").append(result_frm4_6);
		//$('#imageBoard > ul').append('<li>'+result_frm4_6+'</li>');
	}
	
});
/* 경력 - 경력, 신입경력에서 연차무관을 선택할 경우 : 초기화 후 읽기전용 속성으로 변경 */
var checked_irrelevant_crr = false;
$("#irrelevant-crr").on("click", function(){
	checked_irrelevant_crr = checked_irrelevant_crr==true?false:true;
	
	if(checked_irrelevant_crr == true)
	{
		//연차입력사항 확인
		var crrCntUp = $("#crr-cntUp option:selected").text();
		var crrCntDown = $("#crr-cntDown option:selected").text();
		if(crrCntUp != "선택" || crrCntDown != "선택")
		{
			if(confirm("연차무관을 체크하면 직접선택한 연차가 초기화 됩니다.") == true)
			{
				$("#crr-cntUp option, #crr-cntDown option").removeAttr("selected");
				$("#crr-cntUp option").first().attr("selected", "selected");
				$("#crr-cntDown option").first().attr("selected", "selected");
				$("#crr-cntUp, #crr-cntDown").attr("disabled", "disabled");	
			}
			else
			{
				checked_irrelevant_crr = checked_irrelevant_crr==true?false:true;
				$("#irrelevant-crr").prop("checked", false);
			}
		}
	}
	else
	{
		$("#crr-cntUp, #crr-cntDown").removeAttr("disabled");
	}
});
/* 경력 - 신입 클릭 시 하단폼 삭제 */
$("#new-Crr").on("click", function(){
	$("#normal-Crr-Frm").hide();
});
/* 경력 - 경력, 신입+경력 라디오버튼 클릭 시 하단입력폼 보이기 */
$("#normal-Crr, #total-Crr").on("click", function(){
	$("#normal-Crr-Frm").css("display", "inline-block");
	$("#normal-Crr-Frm").show();
});
/* 모집직종 - 전체보기 - 취소 */
function returnPage()
{
	$("#recruit-popup-background").hide(250);
}
/* 직종에 대한 리스트를 가져와 출력한다. */
function recruitAll()
{
	if(frm1_1changed == false)
	{
		if(confirm("변경 시 입력된 정보가 초기화됩니다."))
		{
			frm1_1changed = true;
			$("#jobs-select-result").text("");		
			$("#recruit-popup-background").show(250);	
		}
	}
	else $("#recruit-popup-background").show(250);
}
/* 팝업창 선택 CSS */
$(document).on("click", ".jobList-selectLi", function(){
	$(".jobList-select").removeAttr("style");
	$(this).css("background-color", "blue");
	//모집직종 - JOB2
	$("#job3").empty();
	for(var i in dataJobList)
	{
		if(dataJobList[i].job1==$(this).text())
		$("#job3").append("<li class='jobList-select2'><input type='checkbox' class='ipt-chkBox jobList2' name='jobDetail-"+i+"'><label for='jobDetail-"+i+"'>"+dataJobList[i].job2+"</label></li>");
	}
});
/* 2차직종 선택 시 하단 결과 div출력 */
$(document).on("click", ".jobList2", function(){
	//결과폼에 출력할 결과값
	var resultSelect = $(this).next().text();
	//아이디값 저장을 위한값
	var resultId = $(this).attr("name");
	console.log("id값:"+resultId);
	//첫요소인지 확인하기 위한 변수, 있다면 구분자를 추가
	var divChar = $("#jobList-select-result li").length==0?"":"/&nbsp;";
	//체크가 될 경우 태그를 생성하고, 해제될 경우 제거한다.
	if($(this).prop("checked"))	$("#jobList-select-result").append("<li class='resultJob result-Frm' id='"+resultId+"'>"+divChar+resultSelect+"&nbsp;&nbsp;</li>");	
	else $("li#"+resultId).remove();
	
});
</script>

<!-- 스타일 영역 -->
<style>
/* 구분 하위텍스트 */
.subText-Th
{
	margin-left: 14px;
	font-size: 13px;
	color: #9d9ea0;
}
.explanation
{
	vertical-align: middle;
	text-align: center;
}
.explanation
{
	background-color: #F3F3F3;
	min-height: 150px;
}
.explanation-header h3
{
	font-size: 32px;
	letter-spacing: -0.075em;
	padding-top: 45px;
}
.explanation-footer p
{
	color: #9d9d9d;
	font-size: 14px;
}
/* #1.기본정보 컨테이너 */
.info-container{width: 940px; margin: 0 auto; background-color: #fff; border: 1px solid #f4f4f4; padding: 15px 0 10px 0;}
/* 테이블 */
#subTitle-content{padding-top: 31px; padding-bottom: 12px;}
.td-inputFrm{width: 100%; border-top: 1px solid #505050; margin-left: auto; margin-right: auto;}
/* 내용의 제목 */
.content-title{font-size: 16px; letter-spacing: -0.05em; vertical-align: middle; color: #494949; padding-left: 10px;}
/* 내용의 제목 서브 */
.content-title-in{padding-left: 15px;}
/* 타이틀 내용 */
#title-text{padding-bottom: 11px; border-bottom: 2px solid #344f77; float: left;}
/* 필수사항 특수문자 */
.essential{color: #ed2024; text-align: left; min-height: 27px; font-size: 24px; position: absolute;}
/* 사용자 입력사항 */
.input-content{position: relative; padding: 14px 0 14px 23px; font-size: 15px;}
/* 사용자 입력 - 텍스트 */
.input-textBox{padding: 8px 0 8px 7px; width: 100%; min-height: 48px; border: 1px solid #dadada; border-radius: 3px; resize: none;}
/* 테이블 하단라인 */
.td-line{border-bottom: 1px solid #ebeced;}
/* 체크박스 간격조정 */
.ipt-chkBox{margin: 3px 3px 3px 17px;}
/* 경력입력 */
.inlineblock-select, #benefitList-select-result
{
	list-style: none;
	margin: 0;
	padding: 0;
	border: 0;
	display: block;
	min-width: 20%;
}
.inlineblock-select li, #benefitList-select-result li
{
	float: left;
	width: 135px;
}
.inlineblock-jobExp li span
{
	font-size: 15px;
	line-height: 34px;
}
.radioDef
{
	/* background: url("라디오버튼 이미지 삽입하기"); */
}
.radio-select
{
	margin: 0;
	padding: 0;
}
/* 비필수사항 */
.none-essential
{
	color: #9d9ea0;
}
/* 모집인원 */
#input-cnt, #input-cnt-month, #input-cnt-month2, #input-cnt-month3, #input-cnt-month4, #input-cnt-month5, #input-cnt-month6, #input-cnt-workMonth
{
	width: 50px;
}
/* 지원자격 및 우대조건 */
/* 클래스 수정할 것 */
.formStyleChange
{
	width: 70%;
	position: relative;
	display: inline;
}
/* 외국어 select 설정 */
.fore-select
{
	border: 1px solid lightgray;
}
#computer-ability
{
	width: 165px;
}
#computer-ability-name
{
	width: 220px;
	margin-left: 40px;
}
.fore-select option
{
	border: 1px solid lightgray;
}
ul.inlineblock-select li
{
	margin-right: 3px;
}
.fore-setting, .near-setting
{
	display: grid;
	padding-bottom: 10px;
}
/* 접수기간 및 방법 컨테이너 */
/* 접수기간 */
#input-term-start, #input-term-end
{
	width: 150px;
}
#input-term-end
{
	margin-left: 30px;
}
.time-container
{
	display: inline;
}

/* 세부조정 */
/* 모집직종 */
#input-job, #job-code-result-Div
{
	display: inline-block;
	width: 85%;
}
#major-code-result-Div
{
	margin-bottom: 10px;
	height: 48px;
	border: 1px solid #dadada;
	border-radius: 3px;
	display: none;
}
#recruit-btn
{
	position: absolute;
	height: 48px;
	margin-left: 10px;
}
#recruit-popup-background
{
	z-index: 1;
	position: fixed;
	background-color: rgba(0,0,0, 0.4);
	min-height: 100%;
	min-width: 100%;
	display: none;
}
#recruit-popup
{
	width: 700px;
	height: 530px;
	background-color: white;
	vertical-align: middle;
	display: inline-block;
	margin-top: 50px;
}
.popup-background
{
	text-align: center;
}
#borderDiv
{
	border: 1px solid #dcdcdc;
	width: 90%;
	height: 57%;
	display: inline-block;
}
.popup-textTitle
{
	float: left;
	padding-left: 32px;
	padding-bottom: 15px;
	padding-top: 25px;
}
.borderDiv-Part
{
	border: 1px solid #dcdcdc;
	min-width: 50%;
	min-height: 100%;
	display: inline-block;
	float: left;
	overflow:scroll;
	overflow-x: hidden;
}
.jobList, .jobList2
{
	float: left;
	list-style: none;
	padding-left: 0;
	overflow-x: hidden;
}
.jobList li, .jobList2 li
{
	width: 295px;
	text-align: left;
	padding-left: 15px;
}
#result-jobList
{
	margin-left: 1px;
	width: 100%;
	height: 20%;
	border: 1px solid #dcdcdc;
	float: left;
	display: inline-block;
	background-color: #f8f9fb;
}
#result-jobList2
{
	margin-left: 32px;
	width: 91%;
	height: 9%;
	border: 1px solid #dcdcdc;
	float: left;
	display: inline-block;
	background-color: #f8f9fb;
}
.jobList-select, .jobList-select2
{
	min-height: 37px;
	padding-top: 4px;
}
.configBtn
{
	width: 110px;
	margin-right: 10px;
}
#configFrm
{
	display: inline-block;
	padding-top: 18px;
}
.result-jobSelect
{
	margin-left: 12px;
	margin-top: 14px;
	float: left;
}
.hiddenDiv
{
	background-color: #e3e3e4;
	min-width: 100%;
	display: none;
}
/* 경력 */
#normal-Crr-Frm
{
	min-height: 70px;
}
#recruitment
{
	padding-top: 14px !important;
}
/* 고용형태 */
.hiddenTitle
{
	font-size: 14px;
}
.employ-chkbox
{
	margin-left: 0px;
}
#workDateRange, #workDateRange-inturn, #workDateRange-Commission, #workDateRange-rbar, .work-dateCntType
{
	width: 1%;
	min-height: 48px;
}
.work-dateCntType
{
	min-width: 14% !important;
}
.ms-select
{
	margin-bottom: 0px;
}
.date-cnt
{
	width: 10%;
}
.hiddenDiv-Date
{
	display: none;
}
.content-content
{
	font-size: 13px !important;
}
#employ-ChangeLabel
{
	font-size: 14px !important;
}
/* 모집직책/직급 팝업 */
/* 검은필터 */
.popup-background
{
	z-index: 1;
	position: fixed;
	background-color: rgba(0,0,0, 0.4);
	min-height: 100%;
	min-width: 100%;
	display: none;
}
/* 팝업배경 */
.popup
{
	width: 700px;
	height: 580px;
	background-color: white;
	vertical-align: middle;
	display: inline-block;
	margin-top: 50px;
}
/* 팝업 제목 */
#textTitle-position
{
	text-align: left;
	min-width: 100%;
}
/* 테이블 */
#position-Table
{
	margin-left: 32px;
}
#position-Table, #position-Table tr, #position-Table th, #position-Table td
{
	border: 1px solid #dcdcdc;
}
#position-Table th
{
	width: 63px;
	text-align: center !important;
}
#position-Talbe td
{
	width: 570px;
}
.positionPopup
{
	width: 570px;
}
.position-th
{
	background-color: #dcdcdc;
}
#btnDiv
{
	margin-top: 62px;
}
.position-defaultChx
{
	margin-bottom: 0px;
}
#position-AllBtn, #preferenceBtn, #benefitAll-btn
{
	position: absolute;
	height: 48px;
	margin-left: 10px;
}
.result-Frm
{
	list-style: none;
	float: left;
}
.code-result-Div ul
{
	padding-left: 10px;
	padding-top: 13px;
}
.code-result-Div
{
	min-height: 48px;
	width: 100%;
	border: 1px solid #dcdcdc;
	border-radius: 3px;
	margin-bottom: 10px;
}
.join-process
{
	width: 0%;
	min-width: 15%;
}
.btnCss
{
	min-height: 48px;
}
/* 모집직종 팝업 스크롤 */
#borderDiv-Part1, #borderDiv-Part2
{
	height: 100px;
}
#jobList-select-result, #jobList-select-result2
{
	padding-left: 10px;
	padding-top: 15px;
}
/* 전공계열 */
#major-Btn, #major-Btn-cancle
{
	margin-left: 6px;
	position: absolute;
}
#major-Btn-cancle
{
	margin-left: 70px !important;
}
#education-select
{
	min-height: 48px;
}
#major-select
{
	min-height: 48px;
}
/* 외국어 */
.fore-select
{
	min-height: 48px;
}
#fore-lang
{
	width: 125px;
}
#fore-level1
{
	width: 160px;
}
#fore-lang-Btn
{
	margin-left: 33px;
}
#input-foreTest
{
	width: 400px;
	min-height: 48px;
	border: 1px solid #dadada;
	border-radius: 3px;
}
#fore-lang-Btn2
{
	margin-left: 6px;
}
#fore-result-Div
{
	display: none;
	min-height: 48px;
	border: 1px solid #dadada;
	border-radius: 3px;
	width: 100%;
	margin-bottom: 10px;
}
#fore-select-result li
{
	list-style: none;
	margin: 0;
	padding: 0;
	border: 0;
	display: block;
	min-width: 20%;
	float: left;
}
#fore-code-result-Div
{
	display: none;
	width: 100%;
	border: 1px solid #dadada;
	border-radius: 3px;
	margin-bottom: 10px;
	min-height: 48px;
}
#level-setting
{
	padding-bottom: 0px;
}
#fore-lang-Btn3
{
	margin-left: 132px;
}
#comAbill-lang-Btn3
{
	margin-left: 130px;
}
#comAbill-Btn-cancle
{
	margin-left: 10px;
}
.preference-popup li
{
	width: 194px !important;
}
#preference-select-result
{
	margin-left: 32px;
	width: 91%;
	height: 9%;
	border: 1px solid #dcdcdc;
	float: left;
	display: inline-block;
	background-color: #f8f9fb;
}
#preference-code-result-Div, #input-Benefits
{
	display: inline-block;
	width: 85% !important;
}
.ageInput
{
	width: 100px;
	display: inline-block;
}
.input-p
{
	display: inline-block;
}
.formStyleChange2
{
	width: 25%;
}
.subwayBtn
{
	width: 150px;
}
#subwayUl li
{
	width: 150px;
}
#near-setting
{
	padding-bottom: 0px;
}
#titleText-select-result
{
	border: 0;
	width: 100%;
	min-height: 30px;
}
#content-benefits-Part1
{
	min-width: 100%;
}
#content-benefits-Part1
{
	min-height: 86%;
}
#benefit-borderDiv
{
	min-height: 100%;
}
#result-benefitList
{
	min-height: 70px;
	background-color: white;
}
#benefitList-select-result li
{
	width: 140px;
}
#salary
{
	width: 50%;
}
#otherInput-comabill
{
	display: none;
	margin-left: 35px;
	width: 225px;
}
#workLocation-select-result li
{
	list-style: none;
}
</style>