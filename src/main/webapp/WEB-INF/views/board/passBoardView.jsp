<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.spring.ithrer.board.model.vo.PassBoard" %>
<%@ page import="com.spring.ithrer.board.model.vo.PassBoardComment" %>
<%@ page import="com.spring.ithrer.user.model.vo.*" %>
<%@ page import="java.util.*" %>
<%
	// 개인 회원 세션에 있는 정보 가져오기
	Member member = (Member)session.getAttribute("member");
	PassBoard passBoard = (PassBoard)request.getAttribute("passBoard");
	List<PassBoardComment> passBoardComment = (List<PassBoardComment>)request.getAttribute("passBoardComment");
%>	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="합소서 게시판" name="pageTitle"/>
</jsp:include>
	<style><!------------------------------------------------style------------------------------------------->
	
		div.text-center{width:100%;}
		div#board-container{width:1000px; margin:0 auto; text-align:center;}
		div#board-container{margin-top:40px;}		
		/*댓글 등록 버튼 */
		div#comment-container button#btn-insert{
			width: 60px;
			height: 50px;
			color: white;
			background: #30f;
			position: relative;	
			top: -20px;
		}
		
		/* 댓글테이블 */
		table#tbl-comment{
			width: 100%;
			margin: 0 auto;
			margin-top: 20px;
			border-collapse: collapse;
		}
		table#tbl-comment tr td{
			border-bottom: 1px solid;
			border-top: 1px solid;
			padding: 5px;
			text-align: left;
			line-height: 120%;
}
		table#tbl-comment tr td:first-of-type{
			padding: 5px 5px 5px 50px;
		}
		table#tbl-comment tr td:last-of-type{
			text-align: right;
			width: 131px;
		}
		table#tbl-comment button.btn-reply{
			display: none;
		}
		table#tbl-comment tr:hover {
			background: lightgray;
		}
		table#tbl-comment tr:hover button.btn-reply{
			display: inline;
		}
		table#tbl-comment sub.comment-writer {
			color: navy;
			font-size: 14px;	
		}
		table#tbl-comment sub.comment-date {
			color: tomato;
			font-size: 10px;	
		}
		/*대댓글*/
		table#tbl-comment tr.level2{
			color: gray;
			font-size: 14px;
		}
		table#tbl-comment tr.level2 td:first-of-type{
			padding-left: 100px; /* 대댓글 들여쓰기*/	
		}
		
		/* 대댓글 관련 */
		table#tbl-comment textarea{
			margin: 4px 0 0 0;
		}
		
		table#tbl-comment button.btn-insert2{
			width: 60px;
			height: 23px;
			color: white;
			background: #30f;
			position: relative;
			top: -5px;
			left: 10px; 
		}
		
		/*삭제버튼 */
		table#tbl-comment button.btn-delete{
			background: red;
			color: white;
			display: none;
		}
		table#tbl-comment tr:hover button.btn-delete{
			display: inline;
		}
	</style><!------------------------------------------------style------------------------------------------->
<script><!------------------------------------------------script------------------------------------------->
function fn_goBoardDelete(){
	var memberId = "<%=member.getMemberId()%>"
	var passBoardWriter = "<%=passBoard.getPassBoardWriter()%>"
	
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
		console.log(passBoardWriter);
		alert("이 글의 작성자만 삭제할수 있습니다.");
	}
	else if(memberId.length==0){
		console.log("여기오냐");
		alert("게시글 삭제 실패. 로그인후 이용해주세요.");
		location.href = "${pageContext.request.contextPath}/board/passBoardList";
	}
}
function fn_goBoardUpdate(){
		var memberId = "<%=member.getMemberId()%>"
		var passBoardWriter = "<%=passBoard.getPassBoardWriter()%>"
		var passBoardNo = $("#passNo").text();
	
		if(memberId!=passBoardWriter){
			console.log(passBoardWriter);
			alert("이 글의 작성자만 수정할수 있습니다.");
		}
		else{
			location.href = "${pageContext.request.contextPath}/board/passBoardMoveUpdate?passBoardNo="+passBoardNo;
		}
	};

</script><!------------------------------------------------script------------------------------------------->

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
			<td id="passNo">${passBoard.passBoardNo}</td>
			<th>작성자</th>
			<td id="writer">${passBoard.passBoardWriter}</td>
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
			  <input type="button" class="btn btn-warning" value="수정하기" onclick="fn_goBoardUpdate();">
			  <input type="button" class="btn btn-danger" value="삭제하기" onclick="fn_goBoardDelete();">
			  <input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='passBoardList'">
            </td>
        </tr>
     
		</div>
		
<!-- 댓글시작 -->
    <div id="comment-container"  class="table table-responsive">
    	<div>
    		<form action="${pageContext.request.contextPath}/board/passBoardAddComment.ithrer"
    			  method="post" name="boardCommentFrm">
    			<input type="hidden" name="no" value="${passBoard.passBoardNo}" />
    			<input type="hidden" name="pbBoardRef" value="${passBoard.passBoardNo}" />
    			<input type="hidden" name="pbCommentWriter" value="${member.memberId}" />
    			<input type="hidden" name="pbCommentLevel" value="1" /><!-- 댓글레벨 : 1  -->
    			<input type="hidden" name="pbCommentRef" value="0" />
    			<textarea name="pbCommentContent" id="reply-textarea" cols="60" rows="3" placeholder="댓글을 입력해주세요~" style="width:100%"></textarea>
    			<button type="submit" class="btn btn-outline-success">등록</button>
    		</form>	
    	</div><!-- end of .comment-editor -->
    	
    	<!-- 댓글목록테이블 -->
    	
    	<table id="tbl-comment">
    	<c:forEach items="${list}" var="p">
    		<c:if test="${p.pbCommentLevel ==1}">
    		<tr class="level1">
    			<td>
    				<sub class="comment-writer">
    					${p.pbCommentWriter}
    				</sub>
    				<sub class="comment-date">
    					${p.pbCommentDate}
    				</sub>
    				<br />
    					${p.pbCommentContent}
    			</td>
    			<td>
    				<button class="btn btn-outline-success rereply" value="${p.pbCommentNo}">
    					답글
    				</button>
   				<!-- 관리자이거나, 본인이 쓴 댓글(대댓글)에 대해서만 삭제버튼이 보여야 한다.
    							삭제요청처리후에는 현재페이지가 다시 보여줘야 한다. -->
    				<button class="btn btn-outline-danger replyDelete">삭제</button>
    			</td>
    		</tr>
    		</c:if>
    		<c:if test="${p.pbCommentLevel ==2}">
    		<tr class="level2">
    			<td>
    				<sub class="comment-writer" id="rereWriter">
    					${p.pbCommentWriter}
    				</sub>
    				<sub class="comment-date">
    					${p.pbCommentDate}
    				</sub>
    				<br />
    					${p.pbCommentContent}
    			</td>
    			<td>
    				<button class="btn btn-outline-danger rereplyDelete">삭제</button>
    			</td>
    		</tr>
    	
    	</c:if>
   		</c:forEach> 
    	</table>
    </div><!-- end of .comment-container -->
    <!-- 댓글 끝 -->
    <script>
    //textarea click이벤트핸들러
    $("[name=pbCommentContent]").on('click', function(){
    	if(member == null)
    		loginAlert();
    });
    //댓글form submit이벤트핸들러
    $("[name=boardCommentFrm]").submit(function(e){
    	if(member == null){
    		loginAlert();
    		e.preventDefault();//submit 방지
    		return;
    	}
    	//boardCommentContent 유효성검사
    	var len = $("[name=pbCommentContent]").val().trim().length;
    	 if(len == 0){
			alert("댓글을 작성하세요.");    		
    		e.preventDefault();
    	}
    });
    
    function loginAlert(){
    	alert("로그인 후 이용할 수 있습니다.");
    	$("#memberId").focus();
    }
    
    $(".replyDelete").on("click", function(){
    	var rereWriter = $("#rereWriter").text().trim();
    	var memberId = "<%=member.getMemberId()%>"
    	console.log(rereWriter);
    	console.log(memberId);
    	if(memberId!=rereWriter){
    		alert("댓글의 작성자만 삭제할수 있습니다.");
    	}
    	
    });
    
    $(".rereplyDelete").on("click", function(){
    	var rereWriter = $("#rereWriter").text().trim();
    	var memberId = "<%=member.getMemberId()%>"
    	console.log(rereWriter);
    	console.log(memberId);
    	if(memberId!=rereWriter){
    		alert("댓글의 작성자만 삭제할수 있습니다.");
    	}
    	
    });
    
    
    $(".rereply").on("click", function(){
    	if(member != null){
    	<%--로그인한경우--%>
			var tr = $("<tr></tr>");
			var html = '<td style="display:none; text-align:left;" colspan="2">';
			html += '<form action="${pageContext.request.contextPath}/board/passBoardAddComment.ithrer" method="post">';
			html += '<input type="hidden" name="pbBoardRef" value="${passBoard.passBoardNo}"/>';
			html += '<input type="hidden" name="pbCommentWriter" value="${member.memberId}"/>';
			html += '<input type="hidden" name="pbCommentLevel" value="2"/>';
			html += '<input type="hidden" name="pbCommentRef" value="'+$(this).val()+'"/>';
			html += '<textarea name="pbCommentContent" cols="60" rows="1" style="width:100%"></textarea>';
			html += '<button type="submit" class="btn btn-outline-success">등록</button>';
			html += '</form></td>';
			tr.html(html);
			
			tr.insertAfter($(this).parent().parent())
			  .children("td").slideDown(800);
			
			//한번 실행후 이벤트핸들러 제거
			$(this).off('click');
			
			//생성된 폼에 대해 submit이벤트핸들러
			tr.find('form').submit(function(e){
				var len = $(this).find("#textarea").val().trim().length;
				if(len == 0)
					e.preventDefault();
			});
    		
    	}
    	else{
    	<%--로그인하지 않은경우--%>
    		loginAlert();
   
    	 }
    });
    </script>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>