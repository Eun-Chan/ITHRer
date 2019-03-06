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
div.clearfix img:hover{
	cursor: pointer;
}
img.visible-on{
	display: inline-block;
}
img.visible-off{
	display: none;
}

div#applicant-info-container{
	margin-bottom: 60px;
}

/* border 두께 설정 */
div.border-top.border-bottom{
	border-width: 3px !important;
}
</style>

<div id="all-container" class="container">

	<div id="applicant-info-container" class="container my-5">
	
		<div class="clearfix">
			<img src="${pageContext.request.contextPath }/resources/images/bookmarkoff.svg" alt="bookmark off" id="bookmarkoff" width="30px"/>
			<img src="${pageContext.request.contextPath }/resources/images/bookmarkon.svg" alt="bookmark on" id="bookmarkon" width="30px"/>
			<button class="btn btn-sm btn-primary float-right" onclick="location.href='${pageContext.request.contextPath}/company/index.ithrer?compId=${companyLoggedIn.compId }'">되돌아가기</button>
		</div>
		
		<div id="applicant-info-container" class="container mt-3 shadow rounded border border-primary">
			<div class="row mt-4">
				<div class="col-sm-4 text-center my-auto">
					<img src="${pageContext.request.contextPath }/resources/images/avatar.jpg" alt="temp image" width="150px"/>
				</div>
				<div class="col">
					<div class="row">
						<div class="col text-center">
							<h2>
								<span class="align-middle">${member.memberName }</span>
							</h2>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h6>
								<img src="${pageContext.request.contextPath }/resources/images/birth.svg" alt="birth icon" width="30px" class="mr-3"/>
								<span id="member-birth"></span>년 (${member2.age }세)
							</h6>
							<h6><img src="${pageContext.request.contextPath }/resources/images/phone.svg" alt="phone icon" width="30px" class="mr-3"/> ${member2.phone }</h6>
							<h6><img src="${pageContext.request.contextPath }/resources/images/address.svg" alt="address icon" width="30px" class="mr-3"/> ${member2.address }</h6>
						</div>
						<div class="col">
							<h6><img src="${pageContext.request.contextPath }/resources/images/gender.svg" alt="gender icon" width="30px" class="mr-3"/> ${member2.gender }</h6>
							<h6><img src="${pageContext.request.contextPath }/resources/images/email.svg" alt="email icon" width="30px" class="mr-3"/> ${member2.email }</h6>
						</div>
					</div>
				</div>
			</div>
			<div class="text-center border my-4">
				<div class="row mt-2">
					<div class="col">학력사항</div>
					<div class="col">경력사항</div>
					<div class="col">희망연봉</div>
					<div class="col">희망근무형태</div>
					<div class="col">희망근무지</div>
					<div class="col">포트폴리오</div>
				</div>
				<div class="row mb-2">
					<div class="col">1</div>
					<div class="col">2</div>
					<div class="col">3</div>
					<div class="col">4</div>
					<div class="col">5</div>
					<div class="col">6</div>
				</div>
			</div>
		</div>
		
		<h1>${profile.userResumeTitle }</h1>
		${education }
		<div id="education-info-container" class="container my-5">
			<h3>학력</h3>
			<span>최종학력 | (예시) 대학교 4년 졸업예정</span>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					재학기간
				</div>
				<div class="col">
					구분
				</div>
				<div class="col">
					학교명(소재지)
				</div>
				<div class="col">
					전공
				</div>
				<div class="col">
					학점
				</div>
			</div>
		</div>
		
		<div id="career-info-container" class="container my-5">
			<h3>경력</h3>
			<span>총 *년 *개월</span>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					근무기간
				</div>
				<div class="col">
					회사명
				</div>
				<div class="col">
					부서/직급/연차
				</div>
				<div class="col">
					지역/직종
				</div>
				<div class="col">
					연봉
				</div>
			</div>
		</div>
		
		<div id="activity-info-container" class="container my-5">
			<h3>대외활동</h3>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					기간
				</div>
				<div class="col">
					구분
				</div>
				<div class="col">
					기관/장소
				</div>
				<div class="col">
					내용
				</div>
			</div>
		</div>
		
		<div id="etc-info-container" class="container my-5">
			<h3>자격증/어학/수상내역</h3>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					취득일
				</div>
				<div class="col">
					구분
				</div>
				<div class="col">
					자격/어학/수상명
				</div>
				<div class="col">
					발행처/기관/언어
				</div>
				<div class="col">
					합격/점수
				</div>
			</div>
		</div>
	
		<div id="preference-info-container" class="container my-5">
			<h3>취업우대사항</h3>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					결혼여부
				</div>
				<div class="col">
					병역대상
				</div>
			</div>
		</div>
		
		<div id="careerletter-info-container" class="container my-5">
			<h3>경력기술서</h3>
			<div class="container border">
			내용
			</div>
		</div>
		
		<div id="letter-info-container" class="container my-5">
			<h3>자기소개서</h3>
			<div class="container border">
			내용
			</div>
		</div>
</div>
</div>

<script>
	// 생년월일 잘라서 년도만 보여주기
	var birth = "${member2.birth}".substr(0,4);
	$("span#member-birth").text(birth);

	// 페이지 로딩 후 관심인재 버튼 이미지 보여줄 것 정하기
	if(${member2.count} == 0){
		$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
		$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
	}
	else{
		$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
		$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
	}

	// 관심인재 버튼(별모양) 클릭 이벤트
	var count = ${member2.count};
	$("div.clearfix img").on("click",function(){
		
		if(count == 1){
			$.ajax({
				url: "${pageContext.request.contextPath}/company/favorite?compId=${companyLoggedIn.compId}&memberId=${member2.memberId}&recruitmentNo=${recruitmentNo}",
				type: "delete",
				success: function(data){
					var newCount = data.newCount;
					count = data.newCount;
					
					if(newCount == 0){
						$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
						$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
					}
					else{
						$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
						$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
					}
				},
				error: function(){
					console.log("관심인재 삭제 ajax error!");
				}
			});
		}
		else if(count == 0){
			$.ajax({
				url: "${pageContext.request.contextPath}/company/favorite?compId=${companyLoggedIn.compId}&memberId=${member2.memberId}&recruitmentNo=${recruitmentNo}",
				type: "post",
				success: function(data){
					var newCount = data.newCount;
					count = data.newCount;
					
					if(newCount == 0){
						$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
						$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
					}
					else{
						$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
						$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
					}
				},
				error: function(){
					console.log("관심인재 추가 ajax error!");
				}
			});
		}
	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>