<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="익명게시판" name="pageTitle"/>
</jsp:include>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		div#board-container{margin-top:40px;}
		
	</style>
		<script>
		function validate(){
			var content = $("[name=anonyBoardContent]").val();
			if(content.trim().length==0){
				alert("내용을 입력하세요");
				return false;
			} 
			return true;
		}
		</script>
		
<div id="board-container">
	<form name="boardFrm" 
		  action="${pageContext.request.contextPath}/board/anonyBoardList.do" 
		  method="post" onsubmit="return validate();">
		<input type="text" class="form-control" placeholder="제목" name="anonyBoardTitle" id="anonyBoardTitle" required>
		<input type="text" class="form-control" name="anonyBoardWriter" value="anonyBoardWriter" readonly required>
<%-- 		<input type="text" class="form-control" name="anonyBoardWriter" value="${memberLoggedIn.memberId}" readonly required> --%>
		
	    <textarea class="form-control" rows="10"  name="anonyBoardContent" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>