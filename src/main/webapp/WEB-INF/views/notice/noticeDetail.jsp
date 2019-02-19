<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
<!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

</head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd95d92bd2f84bc07966142257229bba&libraries=services"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

<style>
#address{
	color:gray;
}
#logo{
	overflow:hidden;float:left;width:260px;height:180px;line-height:155px;text-align:center
}
#compInfo dl{
	display:block;float:left;position:relative;margin-left:15px;width:190px;min-height:28px;line-height:28px
}
#compInfo dl dt{
	width:100%;color:#444;font-size:14px;line-height:28px;text-overflow:ellipsis;white-space:nowrap;
}
#compInfo dl dd{
	width:100%;color:#444;font-size:14px;line-height:28px;text-overflow:ellipsis;white-space:nowrap;
}

#compInfo dl dd>span {color:#949494}
#compInfo dl dd>a {display:inline-block;overflow:hidden;padding-right:1px;max-width:99%;color:#4876ef;text-decoration:underline;text-overflow:ellipsis;vertical-align:top;white-space:nowrap}
#compInfo dl.wide {width:465px}
#compInfo dl.wide dd {padding-top:5px;line-height:18px}

</style>

	
<body>
<div id="container">
	<section id="content">

<div class="job-searchDetail-Container">
	<div class="job-searchDetail-Header">
		<div class="searchDetail-Header">
			<a href="#" class="company-name">
				${selectOneJob.name }
			</a>
			<h1 class="company-title">
				${selectOneJob.title }
			</h1>
		</div>
	</div>
	<div class="searchDetail-summary">
		<div class="searchDetail-cont">
			<div class="searchDetail-content">
				<dl>
					<dt>경력</dt>
					<dd>${selectOneJob.exLevel }</dd>
				</dl>
				<dl>					
					<dt>학력</dt>
					<dd>${selectOneJob.level }</dd>
				</dl>
				<dl>
					<dt>급여</dt>
					<dd>${selectOneJob.salary }</dd>
				</dl>
			</div>
					<div class="searchDetail-content">
				<dl>
					<dt>근무형태</dt>
					<dd>${selectOneJob.jobType }</dd>
				</dl>
				<dl>					
					<dt>근무지역</dt>
					<dd>${selectOneJob.location }</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="notice-container">
		${doc}
	</div>
	
	<br /><br />
	
	<c:if test="${not empty address}">
		<div id="map-container">
			<h3><i class="fas fa-map-marker-alt"></i> 근무지 위치</h3><span id="address">${address}</span><br />
			<div id="map" style="width:900px;height:400px;padding:3px;"></div>			

		</div>
	</c:if>
	
	<br /><br />
	
	<div id="companyInfo-container">
		<h3><i class="fas fa-building"></i>  기업정보</h3>
		<div style="border:1px solid gray">
			<div id="logo">
				${logo}
			</div>
			<div id="compInfo">
				<dl>${compType}</dl>
				<dl>${empCount}</dl>
				<dl>${jobType}</dl>
				<dl>${publichedDate}</dl>
				<dl>${revenue}</dl>
				<dl>${representative}</dl>
				<dl>${homePage}</dl>
				<dl>${compAddr}</dl>
			</div>
		</div>
	</div>
	
</div>

<script>

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
geocoder.addressSearch('${address}', function(result, status) {

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
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${selectOneJob.name }</div>'
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

</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
