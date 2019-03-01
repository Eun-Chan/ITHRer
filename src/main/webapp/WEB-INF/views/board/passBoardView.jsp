<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.spring.ithrer.board.model.vo.PassBoard" %>
<%@ page import="com.spring.ithrer.user.model.vo.*" %>
<%
	// 개인 회원 세션에 있는 정보 가져오기
	Member member = (Member)session.getAttribute("member");
	PassBoard passBoard = (PassBoard)request.getAttribute("passBoard");
%>	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="합소서 게시판" name="pageTitle"/>
</jsp:include>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center;}
		div#board-container{margin-top:40px;}		
	</style>
<script>

function fn_goBoardDelete(){
	var memberId = "<%=member.getMemberId()%>"
	var passBoardWriter = $("#writer").val();
	
/* 	console.log(memberId);
	console.log(passBoardWriter); */
	
	if(memberId==passBoardWriter){
		$.ajax({
			url: "${pageContext.request.contextPath}/board/passBoardDelete?passBoardNo=${passBoard.passBoardNo}",
		  	success : function(data){
		  		console.log(data);
			if(data==0){
				alert("게시글 삭제 실패.");
				location.href = "${pageContext.request.contextPath}/board/passBoardList";
			}
			else if(data==1){
				alert("게시글 삭제에 성공하였습니다.");
				location.href = "${pageContext.request.contextPath}/board/passBoardList";
			}
			},
			error: function(){
				console.log("ajax에러 발생");
			}
		});
  	}
	else if(memberId!=passBoardWriter){
		alert("게시글은 본인이 작성한 글만 삭제 가능합니다.");
	}
	else if(memberId.length==0){
		console.log("여기오냐");
		alert("게시글 삭제 실패. 로그인후 이용해주세요.");
		location.href = "${pageContext.request.contextPath}/board/passBoardList";
	}
}
</script>

<!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<title>합소서게시판 - 상세보기</title>
</head>
<section id="board-container" class="container">
	
	 <div id="board-container" class="table table-responsive">
	<table id="" class="table table-bordered">
		<tr class="table-primary">
			<th>번호</th>
			<td>${passBoard.passBoardNo}</td>
			<th>작성자</th>
			<td id="userId">${passBoard.passBoardWriter}</td>
			<th>조회수</th>
			<td>${passBoard.passBoardReadCount}</td>
		</tr>
		<tr class="table-primary">	
			<th>제목</th>
			<td colspan="6">${passBoard.passBoardTitle}</td>
		</tr>	
		<tr>	
			<th class="table-primary">작성내용</th>
			<td colspan="6" >${passBoard.passBoardContent}</td>
		</tr>
	</table>
		<tr>
            <td colspan="6" class="text-center">
			  <input type="button" class="btn btn-warning" value="수정하기" onclick="">          
			  <input type="button" class="btn btn-danger" value="삭제하기" onclick="fn_goBoardDelete();">
			  <input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='passBoardList'">
            </td>
        </tr>
		</div>
		<input type="hidden" id="writer" value="${passBoard.passBoardWriter}" />

 	 </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>