<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
iframe{
	height: 100vh;
}

#notice-container{
	text-align: center;
}

</style>

	<div id="notice-container">
		될라나 어쩔라나 <br /> <br />
		${doc}
		
		
	</div>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>