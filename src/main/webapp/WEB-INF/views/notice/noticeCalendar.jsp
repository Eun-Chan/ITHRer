<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css" />
<script type='text/javascript' src='fullcalendar/gcal.js'></script>

<script type='text/javascript'>

$(function() {
  $('#calendar').fullCalendar({
    googleCalendarApiKey: '<YOUR API KEY>',
    events: {
      googleCalendarId: 'abcd1234@group.calendar.google.com'
    }
  });
});

</script>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>