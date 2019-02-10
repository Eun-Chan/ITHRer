<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
<!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

</head>
<body>
<div id="container">
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">
				<img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" alt="스프링로고" width="50px" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
		  	</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<!-- 좌우정렬을 위해 mr-auto 추가 -->
				<ul class="navbar-nav mr-auto">
			      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}">Home</a></li>		     
			    </ul>
			    
			    
			    <c:if test="${memberLoggedIn == null }">
			    	<ul class="navbar-nav">
					    <!-- 로그인,회원가입 버튼 -->
		        		<!--https://getbootstrap.com/docs/4.1/components/buttons/#outline-buttons-->
		        		<li class="nav-item"><a class="nav-link" href="" data-toggle="modal" data-target="#loginModal">로그인</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer">회원가입</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer">개인회원</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer">기업회원</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer">고객센터</a></li>
	        		</ul>
			 	</c:if>
			 	<c:if test="${memberLoggedIn != null }">
			 		<a href="${pageContext.request.contextPath}/member/memberView.do?memberId=${memberLoggedIn.memberId}">${memberLoggedIn.memberName }</a>님, 안녕하세요
			 		&nbsp;
			 		<button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
			 	</c:if>
			 </div>
		</nav>
	</header>
	
	
	
<!-- 로그인모달 : https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
<!-- The Modal 로그인 버튼 클릭시 나오는 팝업창-->
<div class="modal fade" id="loginModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" id="loginModal-header">
        <h4 class="modal-title" id="test">로그인</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
   		<div role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                    	<a class="nav-link active" data-toggle="tab" href="#login1">개인회원</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link" data-toggle="tab" href="#login2">기업회원</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane container active" id="login1">
						<form name="loginForm">
				  			<div class="form-group">
				    			<label for="text">아이디</label>
				    			<input type="text" class="form-control" id="userId"">
				  			</div>
				  			<div class="form-group">
				    			<label for="userPassword">비밀번호</label>
				    			<input type="password" class="form-control" id="userPassword" onkeyup="enterkey();">
				  			</div>
				  			<div class="form-group form-check">
				    			<label class="form-check-label">
				      				<input class="form-check-input" type="checkbox" id="saveId"/> 아이디 저장
				    			</label>
				    			<span><p id="login-help"></p></span>
				  			</div>
				  			<button type="button" class="btn btn-primary" onclick="loginCheck();">로그인</button>
				  			<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/signUp.do'">회원가입</button>
				  			<br /><br />
				  			<a href="<%=request.getContextPath()%>/idAndPwdSearch.do">아이디 찾기</a>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/idAndPwdSearch.do">비밀번호 찾기</a>
				  			<div class="form-group">
				  			<br /><br />
				  				<!-- <a id="kakao-login-btn"></a> -->
				  				<a onclick="kakaoLogin()">카카오톡 로그인</a>
				  			</div>
						</form>	
					</div>
                    <div class="tab-pane container fade" id="login2">
						기업회원
					</div>
                </div>
        </div>        
      </div> <!-- modal-body 끝 -->
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">나가기</button>
      </div>
    </div> <!-- modal-content 끝 -->
  </div> <!-- modal-dialog 끝 -->
</div> <!-- modal fade 끝 -->
	
	<section id="content">