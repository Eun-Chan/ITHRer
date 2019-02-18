<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fullcalendar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fullcalendar.min.css" />
<link
	href="${pageContext.request.contextPath}/resources/css/fullcalendar.print.min.css"
	rel='stylesheet' media='print' />

<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src='${pageContext.request.contextPath}/resources/js/moment.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/fullcalendar.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/ko.js"></script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-size: 14px;
}

#calendar {
	max-width: 1000px;
	
}
</style>

<script>
	
$('#calendar').fullCalendar('destroy');

$(document).ready(function() {

	var today_date = moment().format('YYYY-MM-DD');
	
	$('#calendar').fullCalendar(
	{
		header : {//공간 설정
			left : 'prev,next today',
			center : 'title',
			right : 'month,basicWeek,basicDay'
		},
		defaultDate : today_date,
		lang : "ko",
		navLinks : false, // can click day/week names to navigate views
		editable : true,
		eventLimit : true, // allow "more" link when too many events
		events : function(start, end, timezone, callback) {
	
			$.ajax({
						type : "POST", //"POST", "GET"
						url : "${pageContext.request.contextPath}/calendarView.ithrer", //Request URL
						dataType : "json", //전송받을 데이터�� 타입
						contentType : "application/json; charset=UTF-8",
						error : function(request,status,error) {
							alert("code : "	+ request.status+ "\r\nmessage : "+ request.reponseText);
						},
						success : function(doc) {
							console.log(doc);
							var events = [];//이벤트를 담을 배열
	
							for(var i = 0; i < doc.length; i++){
								var url = "${pageContext.request.contextPath}/index/ithrerNotice.ithrer?id="
										+ doc[i].RECRUITMENT_NO;//(수정 요!!)추후에 공고 번호로 바꿔야함
								var eventObject = {
									title : "시작  "+doc[i].COMP_NAME,
									start : doc[i].OPENING_DATE,
									url : url,
									allDay : true
								};//이벤트 객체 생성
								
								events.push(eventObject);
								
								eventObject = {
										title : "마감  "+doc[i].COMP_NAME,
										start : doc[i].CLOSING_DATE,
										url : url,
										allDay : true,
										color: "#FF0000"
									};
								
								console.log("eventObject",eventObject);
		
								events.push(eventObject);//배열에 이벤트를 담는다							
							}
	
							callback(events);//이벤트 배열을 돌려주어 이벤트를 등록
						}//success	
					})//ajax
		},
		eventClick : function(event) {//클릭시 이벤트 등록
			if (event.url) {
				window.open(event.url,"채용정보","width=1200px, height=800px");//새창으로 열리게
				return false;
			}
		}
	
	});

});
</script>
<div id="cal-container">
	<br /><br />
	<div id="guide">
		<h3 style="color:skyblue">ITHRer과 함께하는 채용!</h3>
	</div>
	
	<br />
	<div id="calendar"></div>

</div>
<style>
#cal-container{
    width: 1000px;
    margin: 0 auto;
}
</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>