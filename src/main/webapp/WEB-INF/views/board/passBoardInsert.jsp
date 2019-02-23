<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="익명게시판" name="pageTitle"/>
</jsp:include>
	<style>
		div#board-container{width:70%; margin:0 auto; text-align:center; padding-top: 3%; margin-top:40px;}
		div#board-container input{margin-bottom:15px;}
	</style>
<script>
function validate(){
	var title = $("[name=passBoardTitle]").val();
	var content = $("[name=passBoardContent]").val();
		if(title.trim().length==0){
			alert("제목을 입력하세요");
				return false;
		}	
		else if(content.trim().length==0){
			alert("내용을 입력하세요");
				return false;
		}
		else{
			console.log("여기 오긴 오냐 시부럴");
			location.href = "passBoardList";
				return true;
		}
}
</script>
		
<div id="board-container">
	<form name="boardFrm"
		  action="${pageContext.request.contextPath}/board/passBoardInsertContent.ithrer"
		  method="post" accept-charset="UTF-8" >

		<input type="text" class="form-control" placeholder="제목" name="passBoardTitle" id="passBoardTitle" required>
 		<input type="text" class="form-control" name="passBoardWriter" value="${memberLoggedIn.memberId}" readonly required>
		
	    <textarea class="form-control" rows="10"  name="passBoardContent" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" onclick="return validate();">
		<input type="button" class="btn btn-primary" value="돌아가기" onclick="location.href='passBoardList'">
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>