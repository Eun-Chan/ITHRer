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
table tr.table-info:hover{cursor:pointer; color: #a8bdff;}

#board-container {width: 70%; margin: 0 auto; padding-top: 3%;}
.table > thead > tr > th {text-align: center;}
.table > tbody > tr > td {text-align: center;}
.table > tbody > tr > #title {text-align: left;}
</style>
<script>
function fn_goBoardInsert(){
	location.href = "${pageContext.request.contextPath}/board/anonyBoardInsert";
}
$(function(){
	$("tr[no]").on("click",function(){
		var anonyBoardNo = $(this).attr("no");
		var anonyBoardRealNo = $(this).children(":first").text();
		console.log(anonyBoardRealNo);
		/* console.log("anonyBoardNo="+anonyBoardNo); */
		location.href = "${pageContext.request.contextPath}/board/anonyBoardView.do?no="+anonyBoardNo+"&anonyBoardRealNo="+anonyBoardRealNo;
	});
});
</script>

</head>
<body>
<section id="board-container" class="container">
	<p>총 ${totalContents}건의 게시물이 있습니다.</p>
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardInsert();"/>
	<table id="tbl-board" class="table table-bordered table-blue">
		<thead>
			<tr class="table-primary">
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="b" varStatus="vs" > 
			<tr no="${b.ANONYBOARDNO}" class="table-info">
				<td>${vs.count}</td>
				<td id="title">${b.ANONYBOARDTITLE}</td>
				<td>${b.ANONYBOARDWRITER}</td>
				<td><fmt:formatDate value="${b.ANONYBOARDDATE}" type="date"/></td>
				<td>${b.ANONYBOARDREADCOUNT }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="finder" class="text-center">
		<form id="myFrm" action="${pageContext.request.contextPath}/board/anonyBoardSearch.ithrer">
		<div id="search-container">
			<label for="searchType">검색타입 :</label>
			<select name="searchOption" class="">
				<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}" /> >전체</option>
				<option value="anonyBoardTitle" <c:out value="${map.searchOption == 'anonyBoardTitle'?'selected':''}" /> >글제목</option>
				<option value="anonyBoardWriter" <c:out value="${map.searchOption == 'anonyBoardWriter'?'selected':''}" /> >작성자</option>
			</select>
		<!-- </div> -->
 		<!--<div class="form-group myformgroup"> -->
		<input type="text" name="keyword" value="${map.keyword}" id="search" placeholder = " 내용을 입력하세요." class=""/>
<!-- 		<input type="submit" value="검색" id="btn-search" class=""/> -->		
		<button id="btn-search">검색</button>
		</div>
		</form><br />
	</div>
	
</section>
	
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>