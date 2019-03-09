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
	var title = $("[name=anonyBoardTitle]").val();
	var content = $("[name=anonyBoardContent]").val();
	var password = $("[name=anonyBoardPassword]").val();
		if(title.trim().length==0){
			alert("제목을 입력해주세요.");
				return false;
		}	
		else if(content.trim().length==0){
			alert("내용을 입력해주세요.");
				return false;
		}
		else if(password.trim().length==0){
			alert("비밀번호를 입력해주세요.")
				return false;
		}
}
/* $(function(){
	$("#boardFrm").on("click", function(){
		var title = $("#anonyBoardTitle").val();
		var content = $("#anonyBoardContent").val();
		console.log("여기오냐시발");
		$.ajax({
			url : "${pageContext.request.contextPath}/board/anonyBoardList"
			
		});
	});
}); */
</script>
<div id="board-container">
	<form name="boardFrm"
		  action="${pageContext.request.contextPath}/board/anonyBoardInsertContent.ithrer"
		  method="post" accept-charset="UTF-8" >
		
		<input type="text" class="form-control" name="anonyBoardTitle" id="anonyBoardTitle"  placeholder="제목" required>
		
<!-- 		<label for="anonyBoardWriter">작성자</label> -->
		<input type="text" class="form-control" name="anonyBoardWriter" value="익 명" required>
<!-- 		<label for="password">비밀번호</label> -->
		<input type="password" class="form-control" name="anonyBoardPassword" placeholder="비밀번호"/>
	    
	    <textarea class="form-control" rows="10"  name="anonyBoardContent" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" onclick="return validate();">
		<input type="button" class="btn btn-primary" value="돌아가기" onclick="location.href='anonyBoardList'">
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>