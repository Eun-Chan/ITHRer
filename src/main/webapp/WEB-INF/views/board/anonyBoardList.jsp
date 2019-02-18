<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="익명게시판" name="pageTitle"/>
</jsp:include>
<style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}

table tr.table-info:hover{cursor:pointer;}
</style>
<script>
function fn_goBoardInsert(){
	location.href = "${pageContext.request.contextPath}/board/anonyBoardInsert";
}
$(function(){
	$("tr[no]").on("click",function(){
		var anonyBoardNo = $(this).attr("no");
		/* console.log("anonyBoardNo="+anonyBoardNo); */
		location.href = "${pageContext.request.contextPath}/board/anonyBoardView.do?no="+anonyBoardNo;
	});
});
</script>

</head>
<body>
<section id="board-container" class="container">
	<p>총 ${totalContents}건의 게시물이 있습니다.</p>
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardInsert();"/>
	<table id="tbl-board" class="table table-striped table-blue">
		<tr class="table-primary">
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="b"> 
		<tr no="${b.ANONYBOARDNO}" class="table-info">
			<td>${b.ANONYBOARDNO}</td>
			<td>${b.ANONYBOARDTITLE}</td>
			<td>${b.ANONYBOARDWRITER}</td>
			<td><fmt:formatDate value="${b.ANONYBOARDDATE}" type="date"/></td>
			<td>${b.ANONYBOARDREADCOUNT }</td>
		</tr>
		</c:forEach>
	</table>
	
	
	<% 
		int totalContents = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		
		String cPageTemp = request.getParameter("cPage");
		int cPage = 1;
		try{
			cPage = Integer.parseInt(cPageTemp);
		} catch(NumberFormatException e){
			
		}
	%>
  	<%= com.spring.ithrer.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "anonyBoardList") %></section> 
 	 </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>