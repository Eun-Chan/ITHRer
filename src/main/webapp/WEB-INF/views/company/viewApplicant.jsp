<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.spring.ithrer.resume.model.vo.Letter" %>
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

div#letter-box{
	border-top: 3px solid !important;
	border-bottom: 3px solid !important;
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
					<c:if test="${empty profile.photo }">
					<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" alt="이력서 사진 없는 회원 사진" width="150px" />
					</c:if>
					<c:if test="${not empty profile.photo }">
					<img src="${pageContext.request.contextPath}/displayFile.ithrer?fileName=${profile.photo }&directory=memberPhoto" alt="회원사진" width="150px"/>
					</c:if>
				</div>
				<div class="col">
					<div class="row">
						<div class="col text-center pb-3">
							<h2>
								<span class="align-middle">${profile.name }</span>
							</h2>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h6>
								<img src="${pageContext.request.contextPath }/resources/images/birth.svg" alt="birth icon" width="30px" class="mr-3"/>
								<span id="member-birth"></span>년 (${profile.age }세)
							</h6>
							<h6><img src="${pageContext.request.contextPath }/resources/images/phone.svg" alt="phone icon" width="30px" class="mr-3"/> ${profile.phone }</h6>
							<h6><img src="${pageContext.request.contextPath }/resources/images/address.svg" alt="address icon" width="30px" class="mr-3"/> ${profile.address }</h6>
						</div>
						<div class="col">
							<h6><img src="${pageContext.request.contextPath }/resources/images/gender.svg" alt="gender icon" width="30px" class="mr-3"/> ${profile.gender }</h6>
							<h6><img src="${pageContext.request.contextPath }/resources/images/email.svg" alt="email icon" width="30px" class="mr-3"/> ${profile.email }</h6>
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
					<!-- <div class="col">포트폴리오</div> -->
				</div>
				<div class="row mb-2">
					<div class="col">
						${education.graduactionArr[fn:length(education.graduactionArr)-1] }
						<c:if test="${fn:length(education.graduactionArr) eq 1 }">
						${education.highgraduationstateArr[0] }
						</c:if>
						<c:if test="${fn:length(education.graduactionArr) gt 1 }">
						${education.graducationstateArr[fn:length(education.graducationstateArr)-1] }
						</c:if>
					</div>
					<div class="col">
						${career.workingPeriod }
					</div>
					<div class="col">${hopework.wantpay } 만원</div>
					<div class="col">${hopework.jobtype }</div>
					<div class="col">${hopework.hopeplace }</div>
					<!-- <div class="col">6</div> -->
				</div>
			</div>
		</div>
		
		<h1>${profile.userresumetitle }</h1>
				
		<c:if test="${fn:length(education.graduactionArr) != 0 }">
		<div id="education-info-container" class="container my-5">
			<h3>학력</h3>
			<span>
				최종학력 
				 | 
				${education.graduactionArr[fn:length(education.graduactionArr)-1] }
				<c:if test="${fn:length(education.graduactionArr) eq 1 }">
				 ${education.highgraduationstateArr[0] }
				</c:if>
				<c:if test="${fn:length(education.graduactionArr) gt 1 }">
				 ${education.graducationstateArr[fn:length(education.graducationstateArr)-1] }
				</c:if>
			</span>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					재학기간
				</div>
				<div class="col">
					구분
				</div>
				<div class="col">
					학교명
				</div>
				<div class="col">
					전공
				</div>
				<div class="col">
					학점
				</div>
			</div>
			<c:if test="${fn:length(education.graduactionArr) != 0 }">
			<c:forEach var="i" begin="0" end="${fn:length(education.graduactionArr)-1 }">
				<div class="row py-2 border-bottom">
					<div class="col">
						<c:if test="${i == 0 }">
						${education.highgraduationdateArr[0] } ~ ${education.highgraduationdateArr[0] + 3 }
						</c:if>
						<c:if test="${i != 0 }">
						${education.admissiondateArr[i] } ~ ${education.graduationdateArr[i] }
						</c:if>
					</div>
					<div class="col">
						${education.graduactionArr[i] }
					</div>
					<div class="col">
						${education.schoolnameArr[i] }
					</div>
					<div class="col">
						${education.majorArr[i] }
					</div>
					<div class="col">
						<c:if test="${i != 0 }">
						${education.scoreArr[i] } / ${education.totalscoreArr[i-1] }
						</c:if>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
		</c:if>
		
		<c:if test="${fn:length(career.corpnameArr) != 0 }">
		<div id="career-info-container" class="container my-5">
			<h3>경력</h3>
			<span>총 ${career.workingPeriod }</span>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<div class="col">
					근무기간
				</div>
				<div class="col">
					회사명
				</div>
				<div class="col">
					부서/직급
				</div>
				<div class="col">
					설명
				</div>
				<div class="col">
					연봉
				</div>
			</div>
			<c:forEach var="i" begin="0" end="${fn:length(career.corpnameArr)-1 }">
				<div class="row py-2 border-bottom">
					<div class="col">
						${career.hireddateArr[i] } ~ ${career.retireddateArr[i] }
					</div>
					<div class="col">
						${career.corpnameArr[i] }
					</div>
					<div class="col">
						${career.departmentArr[i] }/${career.jobpositionArr[i] }
					</div>
					<div class="col">
						${career.descriptionArr[i] }
					</div>
					<div class="col">
						${career.incomeArr[i] } 만원
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
		
		<c:if test="${fn:length(intern.interndivisionArr) != 0 }">
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
			<c:forEach var="i" begin="0" end="${fn:length(intern.interndivisionArr)-1 }">
				<div class="row py-2 border-bottom">
					<div class="col">
						${intern.internstartdateArr[i] } ~ ${intern.internenddateArr[i] }
					</div>
					<div class="col">
						${intern.interndivisionArr[i] }
					</div>
					<div class="col">
						${intern.socialinstArr[i] }
					</div>
					<div class="col">
						${intern.interntextareaArr[i] }
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
		
		<c:if test="${fn:length(award.awardnameArr) != 0 or fn:length(certification.certnameArr) != 0 or fn:length(language.languagedivisionArr) != 0}">
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
			<c:if test="${fn:length(award.awardnameArr) != 0 }">
			<c:forEach var="i" begin="0" end="${fn:length(award.awardnameArr)-1 }">
				<div class="row py-2 border-bottom">
					<div class="col">
						${award.awarddateArr[i] }
					</div>
					<div class="col">
						수상내역
					</div>
					<div class="col">
						${award.awardnameArr[i] }
					</div>
					<div class="col">
						${award.awardagencyArr[i] }
					</div>
					<div class="col">
						-
					</div>
				</div>
			</c:forEach>
			</c:if>
			<c:if test="${fn:length(certification.certnameArr) != 0 }">
			<c:forEach var="i" begin="0" end="${fn:length(certification.certnameArr)-1 }">
				<div class="row py-2 border-bottom">
					<div class="col">
						${certification.certdateArr[i] }
					</div>
					<div class="col">
						자격증
					</div>
					<div class="col">
						${certification.certnameArr[i] }
					</div>
					<div class="col">
						${certification.certpublisherArr[i] }
					</div>
					<div class="col">
						최종합격
					</div>
				</div>
			</c:forEach>
			</c:if>
			<c:if test="${fn:length(language.languagedivisionArr) != 0 }">
			<c:forEach var="i" begin="0" end="${fn:length(language.languagedivisionArr)-1 }">
				<div class="row py-2 border-bottom">
					<div class="col">
						<c:if test="${empty language.examdateArr[i] }">
						-
						</c:if>
						<c:if test="${not empty language.examdateArr[i] }">
						${language.examdateArr[i] }
						</c:if>
					</div>
					<div class="col">
						${language.languagedivisionArr[i] }
					</div>
					<div class="col">
						<c:if test="${empty language.selfexamArr[i] }">
						-
						</c:if>
						<c:if test="${not empty language.selfexamArr[i] }">
						${language.selfexamArr[i] }
						</c:if>
					</div>
					<div class="col">
						${language.languagenameArr[i] }
					</div>
					<div class="col">
						<c:if test="${empty language.examscoreArr[i] }">
						${language.speakingdivisionArr[i] }
						</c:if>
						<c:if test="${not empty language.examscoreArr[i] }">
						${language.examscoreArr[i] }
						</c:if>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
		</c:if>
	
		<c:if test="${fn:length(preference.prefercheck) != 0 }">
		<div id="preference-info-container" class="container my-5">
			<h3>취업우대사항</h3>
			<div class="row py-3 mt-3 rounded border-top border-bottom font-weight-bold">
				<c:forEach var="i" begin="0" end="${fn:length(preference.prefercheck)-1 }">
				<div class="col">
					${preference.prefercheck[i] }
					<c:if test="${preference.prefercheck[i] eq '장애' }">
					(${preference.disoderselectArr[0] })
					</c:if>
					<c:if test="${preference.prefercheck[i] eq '병역' }">
					(${preference.militaryselectArr[0] })
					</c:if>
				</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		
		<c:if test="${fn:length(letter.letterareaArr) != 0 }">
		<div id="letter-info-container" class="container my-5">
			<h3>자기소개서</h3>
			<div id="letter-box" class="container border">
			<h2>${letter.lettertextArr[0] }</h2>
			<br />
			<%-- ${letter.letterareaArr[0] } --%>
			<%=((Letter)request.getAttribute("letter")).getLetterareaArr()[0].replaceAll("(\r\n|\r|\n|\n\r)", "<br>")%>
			</div>
		</div>
		</c:if>
</div>
</div>

<script>
	// 생년월일 잘라서 년도만 보여주기
	var birth = "${profile.birth}".substr(0,4);
	$("span#member-birth").text(birth);

	// 페이지 로딩 후 관심인재 버튼 이미지 보여줄 것 정하기
	if(${profile.count} == 0){
		$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
		$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
	}
	else{
		$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
		$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
	}

	// 관심인재 버튼(별모양) 클릭 이벤트
	var count = ${profile.count};
	$("div.clearfix img").on("click",function(){
		
		if(count == 1){
			$.ajax({
				url: "${pageContext.request.contextPath}/company/favorite?compId=${companyLoggedIn.compId}&memberId=${profile.memberId}&recruitmentNo=${recruitmentNo}",
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
				url: "${pageContext.request.contextPath}/company/favorite?compId=${companyLoggedIn.compId}&memberId=${profile.memberId}&recruitmentNo=${recruitmentNo}",
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