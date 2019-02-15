<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd95d92bd2f84bc07966142257229bba&libraries=services"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

<style>
#address{
	color:gray;
}
</style>

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
	
	


</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
