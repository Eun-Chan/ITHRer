<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.spring.ithrer.board.model.vo.AnonyBoard" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="익명게시판" name="pageTitle"/>
</jsp:include>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center;}
		div#board-container{margin-top:40px;}		
	</style>

<!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<title>익명게시판 - 상세보기</title>
</head>
<section id="board-container" class="container">
	
	 <div id="board-container" class="table table-responsive">
	<table id="" class="table table-bordered">
		<%-- <tr>
			<th class="success">번호</th>
			<th class="success">제목</th>
			<th class="success">작성자</th>
			<th class="success">작성내용</th>
			<th class="success">조회수</th>
		</tr>
		<tr>
			<td>${anonyBoard.anonyBoardNo}</td>
			<td>${anonyBoard.anonyBoardTitle}</td>
			<td>${anonyBoard.anonyBoardWriter}</td>
			<td>${anonyBoard.anonyBoardContent}</td>
			<td>${anonyBoard.readCount}</td>
		</tr> --%>
		<tr class="table-primary">
			<th>번호</th>
			<td>${anonyBoard.anonyBoardNo}</td>
			<th>작성자</th>
			<td>${anonyBoard.anonyBoardWriter}</td>
			<th>조회수</th>
			<td>${anonyBoard.readCount}</td>
		</tr>
		<tr class="table-primary">	
			<th>제목</th>
			<td colspan="6">${anonyBoard.anonyBoardTitle}</td>
		</tr>	
		<tr>	
			<th class="table-primary">작성내용</th>
			<td colspan="6" >${anonyBoard.anonyBoardContent}</td>
		</tr>
	</table>
		<tr>
            <td colspan="6" class="text-center">
			  <input type="button" class="btn btn-warning" value="수정하기" onclick="">          
			  <input type="button" class="btn btn-danger" value="삭제하기" onclick="">
			  <input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='anonyBoardList'">
            </td>
        </tr>
		</div>
<%
	AnonyBoard anonyBoard = (AnonyBoard)request.getAttribute("anonyBoard");

%>	

 	 </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>