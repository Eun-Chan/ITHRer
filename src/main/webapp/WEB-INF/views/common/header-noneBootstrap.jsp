<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.spring.ithrer.user.model.vo.*" %>
<%
	// 개인 회원 세션에 있는 정보 가져오기
	Member member = (Member)session.getAttribute("member");

	// 전송된 쿠키확인
	boolean memberSaveId = false;
	boolean companySaveId = false;
	String memberId = "";
	String companyId = "";
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie c : cookies){
			String key = c.getName();
			String value = c.getValue();
			System.out.printf("@header.jsp %s = %s\n", key , value);
			if("memberSaveId".equals(key)){
				memberSaveId = true;
				memberId = value;
			}
			if("companySaveId".equals(key)){
				companySaveId = true;
				companyId = value;
			}
		}
	}
	
	System.out.println("여기서 나오면 세션 끝 = "+member);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- 카카오톡 로그인용 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div id="container">
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="${pageContext.request.contextPath}" style="color:#ffb6c1">
				ITHRer
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
		  	</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<!-- 좌우정렬을 위해 mr-auto 추가 -->

				<ul class="navbar-nav mr-auto">	     
			      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/resume/resume">이력서</a></li>		
			      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/anonyBoardList">익명게시판</a></li>     
			      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/calendar.ithrer">ITHRer달력</a></li>		     
			    </ul>
			    
			    
			    <c:if test="${empty memberLoggedIn and empty company }">
			    	<ul class="navbar-nav">
					    <!-- 로그인,회원가입 버튼 -->
		        		<li class="nav-item"><a class="nav-link" href="" data-toggle="modal" data-target="#loginModal">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/login.ithrer">기업로그인(임시)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer">이력서 관리</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/recruitmentAdd.ithrer">공고등록 테스트</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer"><img src="${pageContext.request.contextPath }/resources/images/AsCenter.svg" alt="고객센터" width="30px" height="30px" /></a></li>

	        		</ul>
			 	</c:if>
			 	<c:if test="${!empty company }">
					<ul class="navbar-nav">
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/index.ithrer?compId=${company.compId }">기업홈</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/info.ithrer?compId=${company.compId }">기업정보관리</a></li>
		        	</ul>
		        	<button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/company/logout.ithrer'">로그아웃</button>
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
                    	<a class="nav-link active" data-toggle="tab" href="#member">개인회원</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link" data-toggle="tab" href="#company">기업회원</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane container active" id="member">
						<form name="loginForm">
				  			<div class="form-group">
				    			<label for="text">아이디</label>
				    			<input type="text" class="form-control" id="memberId" value="<%=memberId%>">
				  			</div>
				  			<div class="form-group">
				    			<label for="userPassword">비밀번호</label>
				    			<input type="password" class="form-control" id="memberPassword" onkeyup="enterkey();">
				    			<span><p id="login-help"></p></span>
				  			</div>
				  			<div class="form-group form-check">
				    			<label class="form-check-label">
				      				<input class="form-check-input" type="checkbox" id="memberSaveId" <%=memberSaveId?"checked":""%>/> 아이디 저장
				    			</label>
				  			</div>
				  			<button type="button" class="btn btn-primary" onclick="memberLoginCheck();">로그인</button>
				  			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/user/signUpGoing.ithrer?index=0'">회원가입</button>
				  			<br /><br />
				  			<a href="${pageContext.request.contextPath}/user/findingIdPwd.ithrer">아이디/비밀번호찾기</a>
				  			<div class="form-group">
				  			<br />
				  				<p class="font-italic text-info">다른 계정으로 로그인</p>
				  				<img src="${pageContext.request.contextPath }/resources/images/kakao_login.png" class="rounded-circle" onclick="kakaoLogin()" width="50px">
				  			</div>
						</form>	
					</div>
                    <div class="tab-pane container fade" id="company">
						<form name="loginForm">
				  			<div class="form-group">
				    			<label for="text">아이디</label>
				    			<input type="text" class="form-control" id="companyId" value="<%=companyId%>">
				  			</div>
				  			<div class="form-group">
				    			<label for="userPassword">비밀번호</label>
				    			<input type="password" class="form-control" id="companyPassword" onkeyup="enterkey();">
				    			<span><p id="login-help2"></p></span>
				  			</div>
				  			<div class="form-group form-check">
				    			<label class="form-check-label">
				      				<input class="form-check-input" type="checkbox" id="companySaveId" <%=companySaveId?"checked":""%>/> 아이디 저장
				    			</label>
				  			</div>
				  			<button type="button" class="btn btn-primary" onclick="companyLoginCheck();">로그인</button>
				  			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/user/signUpGoing.ithrer?index=1'">회원가입</button>
				  			<br /><br />
				  			<a href="${pageContext.request.contextPath}/user/findingIdPwd.ithrer">아이디/비밀번호찾기</a>
						</form>
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

<script>
	/* 카카오톡 api 로그인 */
	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('acffe25b588a09ee41d548b51a594b50');
 	/* 카카오 로그인 */
 	function kakaoLogin() {
      // 로그인 창을 띄웁니다.
 		Kakao.Auth.loginForm({
			
			// 세션이 종료된 이후에도 토큰을 유지.
			persistAccessToken: true,
			// 세션이 종료된 이후에도 refresh토큰을 유지.
			persistRefreshToken: true,
			
			success: function(authObj) {
				console.log("success!");
				console.log(authObj);
				console.log("ㅡㅡㅡㅡㅡㅡㅡㅡ");
				userGetProfile();
			},
			fail: function(err) {
				alert("로그인 에러");
				console.log(err);
			}
		});
    };	
    
 	/* 카카오 api로 로그인한 유저 프로필 가져오기 */
    function userGetProfile(){
 		Kakao.API.request({
 			url : '/v1/user/me',
 			success : function(res){
 				console.log(res);
 				console.log("res.id = " , res.id);
 				console.log("res.acount_email = ", res.kaccount_email);
 				console.log("res.usernickName = ", res.properties.nickname);
 				/* 카카오톡 유저 회원으로 추가 */
 				kakaoUserSignUp(res.id , res.kaccount_email, res.properties.nickname);	
 			}
 		});
 	};
    
    function kakaoUserSignUp(kakaoId, kakaoEmail, kakaoName){
    	$.ajax({
    		url : "${pageContext.request.contextPath}/user/kakaoLogin.ithrer",
    		data : {kakaoId : kakaoId , kakaoEmail : kakaoEmail , kakaoName : kakaoName},
    		type : "POST",
    		success : function(data){
   				// 카카오톡 로그인후 새로고침	
   				if(data == 'true')
    				location.reload();
   				else if(data == 'false'){
   					$("#login-help").text("이미 아이디가 접속중입니다!");
					$("#login-help").addClass("text-danger");
   				}
    		}
    	});
    }

	/* Enter 로 바로 로그인 */
	function enterkey(){
		if(window.event.keyCode == 13)
			console.log("하앙");
	}
	
	function memberLoginCheck(){
		var memberId = $("#memberId").val().trim();
		var memberPassword = $("#memberPassword").val().trim();
		var memberSaveId = $("#memberSaveId").is(":checked")
		console.log("$memberSaveId는 바로 ! = " , memberSaveId)
		if(memberId == 0 || memberPassword == 0){
			$("#login-help").text("아이디 혹은 비밀번호를 입력해 주시길 바랍니다.");
			$("#login-help").addClass("text-danger");
			return;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/memberLogin.ithrer",
			type : "POST",
			data : {memberId : memberId , memberPassword : memberPassword, memberSaveId : memberSaveId},
			success : function(data){
				if(data.result == "true"){
					location.reload();
					console.log("여긴 오지");
				}	
				else if(data.result == "false"){
					$("#login-help").text("아이디 혹은 비밀번호가 알맞지 않습니다.");
					$("#login-help").addClass("text-danger");
				}
			}
		});
	}
	
	function companyLoginCheck(){
		var companyId = $("#companyId").val().trim();
		var companyPassword = $("#companyPassword").val().trim();
		
		if(companyId == 0 || companyPassword == 0){
			$("#login-help2").text("아이디 혹은 비밀번호를 입력해 주시길 바랍니다.");
			$("#login-help2").addClass("text-danger");
			return;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/companyLogin.ithrer",
			data : {companyId : companyId , companyPassword : companyPassword , companySaveId : companySaveId},
			success : function(data){
				if(data.result == "true"){
					location.reload();
				}
				else if(data.result == "false"){
					$("#login-help2").text("아이디 혹은 비밀번호가 알맞지 않습니다.");
					$("#login-help2").addClass("text-danger");
				}
			}
		});
	}
	$(".nav-link").hover(function(){
		$(this).css("color","#ffb6c1");
	},function(){
		$(this).css("color","rgba(0,0,0,.5)");
	})
</script>
	
	<section id="content">