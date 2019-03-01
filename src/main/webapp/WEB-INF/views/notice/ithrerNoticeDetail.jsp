<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd95d92bd2f84bc07966142257229bba&libraries=services"></script>

<!-- 구글 차트 스크립트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
	#apply{
		width: 200px;
    	height: 65px;
    	margin-bottom: 5px;
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
	rect[Attributes]:last{
		display: none;
	}
	.detailStar{
		width: 65px;
		height:60px;
		background:white;
		border:1px solid #e9e9e9;
	}
</style>
<div class="DetailHeader">
	<h1>채용정보</h1>
</div>
<div class="row main">
	<div class="col-sm-8">
	<div class="row">
		<div class="col-sm-10">
		<h3>
			<span class="noticeCompanyName">${com.compName }</span>
			<span class="rcContent">${rc.recruitmentTitle }</span>
		</h3>
		</div>
		<div class="col-sm-2">
		<c:if test="${empty member }">
			<button class="detailStar">
				<img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;">
			</button>
		</c:if>
		<c:if test="${not empty member }">
       		<c:if test="${rc.favoritesCount == 1 }">
       			<button class="detailStar"><img src="${pageContext.request.contextPath }/resources/images/yelloStar.svg" alt="" style="width: 20px;"></button>
       		</c:if>
       		<c:if test="${rc.favoritesCount ==0 }">
       			<button class="detailStar"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
       		</c:if>
	   </c:if>
		</div>
	</div>
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
				<dd>${com.dateOfEstablishment }</dd>
				<dt>기업형태</dt>
				<dd>${com.bussinessScale }</dd>
			</dl>
	</div>
	<div class="DetailHeader">
		<h1>채용정보</h1>
	</div>
	<div class="row main">
		여기에 채용정보가 들어가 보리기이이이
		이이이이꾸요이이이잇
		아아아아앙아아아아아
	</div>
	<div class="DetailHeader">
		<h1>접수기간/방법</h1>
	</div>
	<div class="row main">
		<div class="col-sm-3 timeimg">
			<dl>
				<dt style="width: 130px; position: relative; left: -7px;">
					<img src="${pageContext.request.contextPath }/resources/images/time.svg" alt="" style="width: 50px;height: 50px;display: block; margin-bottom: 5px; position: relative; left: 38px;"/>
					<span style="font-size: 0.8em;">남은시간</span>
					<br />
					<span id="d-day"></span>
				</dt>
			</dl>
		</div>
		<div class="col-sm-9 resume">
			<button type="button" class="btn btn-outline-primary" id="apply">지원하기</button>
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
				<dd style="font-size: 0.8em">${rc.recruitmentPersonnel }명</dd>
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
					<em>${list.size() }명</em>
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
			<span>연령별</span>
			<div  id="age" style="width: 220px; height: 160px;">
			</div>
		</div>
		<div class="col-sm-3">
			<span>성별</span>
			<div id= "gender" style="width: 220px; height: 160px;"></div>
		</div>
		<div class="col-sm-3">
			<span>학력별</span>
			<div id="education" style="width: 220px; height: 160px;"></div>
		</div>
	</div>
	<div class="DetailHeader">
		<h1>근무자위치</h1>
		<h1 style="color: #ffb6c1"><img src="${pageContext.request.contextPath }/resources/images/companylocation.svg" alt="" width="30px" height="30px"/>${com.location }</h1>
	</div>
	<div class="row main" id="map" style="height: 400px;">

	</div>
	<input type="hidden" value="${rc.recruitmentNo }" id="hiddenRNo"/>
	<input type="hidden" value="${com.compName }" id="hiddenCName"/>
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
	
	
 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 2 // 지도의 확대 레벨
	};  

	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder.addressSearch('${com.location}', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {

	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: coords
	    });

	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">${com.compName }</div>'
	    });
	    infowindow.open(map, marker);

	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});    

	//마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	map.setZoomable(false);    
		
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	
	
	//차트를 최신버전으로 불러오고
	google.charts.load('current', {packages: ['corechart', 'bar']});
	//차트를 로드한다!(drawVisulization)는 차트를 불러오는 곳 함수 
	//연령 차트
	google.charts.setOnLoadCallback(ageChart);
	function ageChart(){
		 var list = new Array();
		 var date = new Date();
		 var one = 0; //25세이하
		 var two = 0; //26~30
		 var three = 0; //31~35
		 var four = 0; //36~40
		 var five = 0; //40~
		 
		 
		 <c:forEach items="${list}" var="item">
			list.push("${item.birth}");
		 </c:forEach>
		 
		 for(var i = 0 ; i<list.length ; i++){
			 console.log(date.getFullYear()-list[i].substr(0,4)+1);
			 if(date.getFullYear()-list[i].substr(0,4)+1 <= 25){
				 one++;
			 }
			 else if(date.getFullYear()-list[i].substr(0,4)+1 > 25 &&
					 date.getFullYear()-list[i].substr(0,4)+1 < 31){
				 two++;
			 }
			 else if(date.getFullYear()-list[i].substr(0,4)+1 > 30 &&
					 date.getFullYear()-list[i].substr(0,4)+1 < 36){
				 three++;
			 }
			 else if(date.getFullYear()-list[i].substr(0,4)+1 > 35 &&
					 date.getFullYear()-list[i].substr(0,4)+1 < 41){
				 four++;
			 }
			 else{
				 five++;
			 }
		 }
	 	 var data = google.visualization.arrayToDataTable([
		        ['연령', '인원',{role:'style'}],
		        ['25세 이하', one,'color:#6d8ff3'],
		        ['26~30세', two,'color:#6d8ff3'],
		        ['31~35세', three,'color:#6d8ff3'],
		        ['36~40세', four,'color:#6d8ff3'],
		        ['40세 이상', five,'color:#6d8ff3']
		      ]);
		      var options = {
				 legend: 'none',
				 fontSize:8,
				 hAxis: {
				     minValue: 0
				 }
		      }; 

		      var chart = new google.visualization.BarChart(document.getElementById('age'));
		      chart.draw(data, options);
	}
	//학력 차트
	google.charts.setOnLoadCallback(educationChart);
	function educationChart(){
	 	 var data = google.visualization.arrayToDataTable([
		        ['학력', '인원',{role:'style'}],
		        ['고졸', 2,'color:#6d8ff3'],
		        ['초대졸', 6,'color:#6d8ff3'],
		        ['대졸', 3,'color:#6d8ff3'],
		        ['대학원졸', 6,'color:#6d8ff3'],
		      ]);
		      var options = {
				 legend: 'none',
				 fontSize:8,
				 hAxis: {
				     minValue: 0
				 }
		      }; 

		      var chart = new google.visualization.BarChart(document.getElementById('education'));
		      chart.draw(data, options);
	}
</script>
<script>
google.charts.load('current', {packages:['corechart']});
google.charts.setOnLoadCallback(genderChart);


function genderChart() {
	var list = new Array();
	var man = 0 ;
	var girl = 0;
	//el을 스크립트 안에서 쓰는법
	<c:forEach items="${list}" var="item">
		list.push("${item.gender}");
	</c:forEach>
	for(var i = 0 ; i<list.length ; i++){
		if(list[i]=='남'){
			man++;
		}
		else{
			girl++;
		}
	}
	// 차트 데이터 설정
	var data = google.visualization.arrayToDataTable([
		['성별', '인원수',{role:'style'},{role: 'annotation'}], // 항목 정의
		['남', man,'opacity:0.3;color:blue',man], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
		['여', girl,'red',girl],
	]);

	// 그래프 옵션
	var options = {
		legend : 'none',
		bar : {
			groupWidth : '30%' // 그래프 너비 설정 %
		}
	};

	var chart = new google.visualization.ColumnChart(document.getElementById('gender'));
	chart.draw(data, options);
}
$("#apply").on("click",function(){
	 if(${empty member}){
			alert("로그인 후 이용 해 주세용");
			return;
	 }
	 if("${count}"==1){
		 alert("해당회사에 지원한 이력이 존재합니다.");
		 return;
	 }
	window.open("${pageContext.request.contextPath}/notice/companyApply.ithrer?recruitmentNo=${rc.recruitmentNo}","apply","width=570, height=600, resizable = no, scrollbars = no");
});
$(".detailStar").on("click",function(){
	var recNo = "${rc.recruitmentNo}";
	var compId = "${com.compId}";
	var img = $(this).children("img");
	 if(${empty member}){
		alert("로그인 후 이용 해 주세용");
		return;
 		}
	 else{		 
		$.ajax({
				url:"${pageContext.request.contextPath}/index/favorites.ithrer?memberId=${member.memberId}&recruitment_no="+recNo+"&compId="+compId,
				success:function(data){
					if(data == 1){
						img.attr("src","${pageContext.request.contextPath}/resources/images/yelloStar.svg");
					}
					else {
						img.attr("src","${pageContext.request.contextPath}/resources/images/star.svg");
					}
				}
		});		 
	 }
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>