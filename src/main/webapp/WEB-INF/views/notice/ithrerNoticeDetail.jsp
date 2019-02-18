<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />
<style>
	.DetailHeader{
	    width: 1000px;
	    position: relative;
	    padding: 10px 10px 0px 0;
	    margin: 0 auto;
	}
	.main{
		width:1000px;
		position: relative;
		padding: 20px;
		margin: 0 auto;
		border:1px solid #dce1eb;
	}
	.Receipt{
		width:1000px;
		position: relative;
		padding: 20px;
		margin: 0 auto;
		border:1px solid #dce1eb;
	}
	.noticeCompanyName{
		display: block;
		color: #333;
   		margin-bottom: 5px;
    	letter-spacing: -1px;
    	font-size: 1em;
    	font-family: 'sungDongGothic';
	}
	h1{
		font-size: 20px;
	    color: #000;
	    padding: 0 0 10px 2px;
	    margin-top: -7px;
	    font-family: 'sungDongGothic';
	}
	h3{
		font-size: 27px;
	    color: #000;
	    padding: 5px 0 20px 0;
	    border-bottom: 1px solid #dde2eb;
	    letter-spacing: -2px;
	}
	.contentHeader{
		font-size: 14px;
	    color: #333;
	    font-weight: bold;
	    letter-spacing: -1px;
	    margin-top: 5px;
	}
	dt{
		display: inline-block;
	}
	dd{
		display: inline-block;
	}
	.HeaderDl dt{
		color: #999;
		font-size: 0.8em;
		width: 63px;
	}
	.HeaderDl dd{
		font-size: 0.8em;	
		width: 220px;
	}
	.timeDl{
		position: relative;
    	left: 15%;
	}
	.timeDl dt{
		letter-spacing: -1px;
		color: #999;
	    font-size: 0.8em;
	    width: 43px;
	    border-right: 1px solid #dee2e7;
	}
	.timeDl dd{
		width: 150px;
		font-size: 0.8em;
	}
	.timeimg{
		text-align: center;
	}
	.btn{
		width: 200px;
    	height: 65px;
    	margin-bottom: 5px
	}
	.resumeDl dt{
		letter-spacing: -1px;
		color: #999;
	    font-size: 0.8em;
	    width: 67px;
	    border-right: 1px solid #dee2e7;
	}
	.resume{
		height: 105px;
		border-bottom: 1px solid #dee2e7;
	}
	.personnel dt{
		letter-spacing: -1px;
		color: #999;
	    font-size: 0.8em;
	    width: 67px;
	    border-right: 1px solid #dee2e7;
	}
	em{
		font-size: 1.5em;
    	font-style: initial;
	}
</style>
<div class="DetailHeader">
	<h1>채용정보</h1>
</div>
<div class="row main">
	<div class="col-sm-8">
		<h3>
			<span class="noticeCompanyName">${com.compName }</span>
			${rc.recruitmentTitle }
		</h3>
	</div>
	<div class="col-sm-4" style="border-left:1px solid #dde2eb;">
		<div style="text-align: center;">
			<img src="${pageContext.request.contextPath }/resources/images/google.svg" alt="" width="150px;" height="80px;" style="position: relative; top: 10px;"/>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="row">
			<div class="col-sm-6">
				<h4 class="contentHeader">
					지원자격
				</h4>
				<dl class="HeaderDl">
					<dt>경력</dt>
					<dd style="color:#ffb6c1;">${rc.career }</dd>
					<dt>학력</dt>
					<dd style="color:#ffb6c1;">${rc.education }</dd>
					<dt>우대</dt>
					<dd>${rc.employmentPreference }</dd>
				</dl>
			</div>
			<div class="col-sm-6">
			 	<h4 class="contentHeader">
					근무조건
				</h4>
				<dl class="HeaderDl">
					<dt>고용형태</dt>
					<dd style="color:#ffb6c1;">${rc.employmentType }</dd>
					<dt>급여</dt>
					<dd>${rc.payCondition }</dd>
					<dt>지역</dt>
					<dd>${rc.location }</dd>
					<dt>근무시간</dt>
					<dd>7시~10시</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="col-sm-4" style="border-left:1px solid #dde2eb; margin-top: 20px;">
			<h4 class="contentHeader">
				기업정보
			</h4>
			<dl class="HeaderDl">
				<dt>산업(업종)</dt>
				<dd>${com.category }</dd>
				<dt>설립년도</dt>
				<dd>${com.enrollDate }</dd>
				<dt>기업형태</dt>
				<dd>${com.businessScale }</dd>
			</dl>
	</div>
	
	<div class="DetailHeader">
		<h1>접수기간/방법</h1>
	</div>
	<div class="row main">
		<div class="col-sm-3 timeimg">
			<dl>
				<dt>
					<img src="${pageContext.request.contextPath }/resources/images/time.svg" alt="" style="width: 50px;height: 50px;display: block; margin-bottom: 5px; position: relative; left: 25px;"/>
					<span style="font-size: 0.8em;">남은시간</span>
					<br />
					<span id="d-day"></span>
				</dt>
			</dl>
		</div>
		<div class="col-sm-9 resume">
			<button type="button" class="btn btn-outline-primary">지원하기</button>
			<dl class="resumeDl">
				<dt>지원양식</dt>
				<dd style="font-size: 0.8em;">ITHRer 이력서 양식</dd>
			</dl>
		</div>
		<div class="col-sm-3">
			<dl class="timeDl">
				<dt>시작일</dt>
				<dd>${rc.openingDate }일</dd>
				<dt>마감일</dt>
				<dd>${rc.closingDate }일</dd>
			</dl>
		</div>
		<div class="col-sm-9">
			<dl class="personnel">
				<dt>모집인원</dt>
				<dd style="font-size: 0.8em">${rc.recruitmentPersonnel }</dd>
			</dl>
		</div>
	</div>
	<div class="DetailHeader">
		<h1>지원자 현황 통계</h1>
	</div>
	<div class="row main">
		<div class="col-sm-3">
			<div class="col">
				<div style="padding-top: 15px; line-height: 1.33;">
					지원자수
				</div>
				<div>
					<em>00명</em>
				</div>
			</div>
			<div class="col">
				<div style="padding-top: 15px; line-height: 1.33;">
					모집인원
				</div>
				<div>
					<em>00명</em>
				</div>
			</div>
		</div>
		<div class="col-sm-3">
			연령차트
		</div>
		<div class="col-sm-3">
			성별차트
		</div>
		<div class="col-sm-3">
			학력차트
		</div>
	</div>
</div>
<script>
/* 	var time = '${rc.closingDate}';
	var year = time.substr(0,4);
 	var month = time.substr(5,7);
	var day = time.substr(8,10); */
	var date = new Date("${rc.closingDate}").getTime(); 
	//1초마다 갱신되도록 함수 생성,실행
	var x = setInterval(function() {
	    // 오늘 날짜 등록
	    var now = new Date().getTime();

	    // 종료일자에서 현재일자를 뺀 시간
	    var distance = date - now;

	    // 각 변수에 일, 시, 분, 초를 등록
	    var d = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var s = Math.floor((distance % (1000 * 60)) / 1000);

	    //id가 d-day인 HTML코드에 내용 삽입
		document.getElementById("d-day").innerHTML = d +"일  " + h + ":" + m + ":" + s ;
		if(m<10){
		    document.getElementById("d-day").innerHTML = d +"일  " + h + ":0" + m + ":" + s ;	
		}
		if(m<10 && s<10){
		    document.getElementById("d-day").innerHTML = d +"일  " + h + ":0" + m + ":0" + s ;				
		}
		if(m>=10 && s<10){
		    document.getElementById("d-day").innerHTML = d +"일  " + h + ":" + m + ":0" + s ;							
		}
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>