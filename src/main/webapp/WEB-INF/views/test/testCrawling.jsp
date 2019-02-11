<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


	<div>
		될라나 어쩔라나
		${doc}
	</div>
<script>
	$(function(){
		function IframeResize(id){
		    var ifrm = document.getElementById("iframe_content_0");
		    var the_height = ifrm.contentWindow.document.body.scrollHeight;
		    console.log(ifrm.height);
		}
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>