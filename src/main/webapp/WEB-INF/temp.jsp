<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.spring.ithrer.user.model.vo.*" %>
<%@ page import="com.spring.ithrer.company.model.vo.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
	// 개인 회원 세션에 있는 정보 가져오기
	Member member = (Member)session.getAttribute("member");
	// 기업 회원 세션에 있는 정보 가져오기\
	Company company = (Company)session.getAttribute("companyLoggedIn");
	
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
	
	System.out.println("여기서 나오면 세션 끝(개인회원) = "+member);
	System.out.println("여기서 나오면 세션 끝(기업회원) = "+company);
	
	// 네이버 로그인 시작
		String clientId = "RvdQ_2FS1H_N5lnKNCSX";//애플리케이션 클라이언트 아이디값";
 	    /* String redirectURI = URLEncoder.encode("http://localhost:9090/ithrer/user/naverLoginCallback.ithrer", "UTF-8"); */
 	    String redirectURI = URLEncoder.encode("http://52.78.61.219:8080/ITHRer/user/naverLoginCallback.ithrer", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	// 네이버 로그인 끝
%>

<!DOCTYPE html>
<html>
<style>
.memberNames{
	color:black;
	display: inline-block;
	padding-right: 2px
}
.headerMember{
	top: 7.1px;
}
.headerMemberTitle{
	color: rgba(0, 0, 0, 0.5);
    border: none;
    background: #f8f9fa!important;
    cursor: pointer;
}
</style>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>

<!-- 부트스트랩관련 라이브러리 -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- 카카오톡 로그인용 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 페이스북 로그인용(로그인 버튼) -->
<script async defer src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=1894308784031760&autoLogAppEvents=1"></script>

<!-- header.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" />

</head>
<body>
<div id="container">
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="${pageContext.request.contextPath}" style="color:#ffb6c1">
				<img src="${pageContext.request.contextPath }/resources/images/ITHRerLogo.png" alt="" width="50px" height="50px"/>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
		  	</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<!-- 좌우정렬을 위해 mr-auto 추가 -->
				<c:if test="${empty companyLoggedIn  and member.memberId ne 'ithreradmin'  }">
					<ul class="navbar-nav mr-auto">	     
				      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/resume/resume.ithrer">이력서</a></li>		
				      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/anonyBoardList">익명게시판</a></li>     
				      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/passBoardList">합소서 게시판</a></li>    
				      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/calendar.ithrer">ITHRer달력</a></li>
				      <c:if test="${not empty member or not empty company }">
				      	<li class="nav-item"><a class="nav-link" onclick="chatting();" id="chat_cnt">채팅</a></li>
				      </c:if>		     
				    </ul>
			    </c:if>
			    <c:if test="${member!=null and member.memberId eq 'ithreradmin' }">
			    	<ul class="navbar-nav mr-auto">	     
				      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/charedService.ithrer">배너관리</a></li>		
				    </ul>
			    </c:if>
			    <c:if test="${empty member and empty companyLoggedIn }">
			    	<ul class="navbar-nav">
					    <!-- 로그인,회원가입 버튼 -->
		        		<li class="nav-item"><a class="nav-link" href="" data-toggle="modal" data-target="#loginModal">로그인</a></li>
	        		</ul>
			 	</c:if>
			 	<c:if test="${!empty companyLoggedIn }">
			 	 	<ul class="navbar-nav mr-auto">	     	
				    </ul>
					<ul class="navbar-nav">
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/index.ithrer?compId=${companyLoggedIn.compId }">기업홈</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/info.ithrer?compId=${companyLoggedIn.compId }">기업정보관리</a></li>
		        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/company/recruitmentAdd.ithrer?compId=${companyLoggedIn.compId }">채용공고 등록</a></li>
		        	</ul>
		        	<button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/company/logout.ithrer'">로그아웃</button>
			 	</c:if>
			 	<c:if test="${member != null and member.memberId ne 'ithreradmin'}">
			 		<ul class="navbar-nav">
			 		<div class="dropdown headerMember">
					  <button type="button" data-toggle="dropdown" class="headerMemberTitle">
					   ${member.memberName }님&nbsp;<img src="${pageContext.request.contextPath }/resources/images/drop.svg" alt="" width="20px"/>
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" onclick="location.href='${pageContext.request.contextPath}/resume/resumeView.ithrer?memberId=${member.memberId}';">내 이력서</a>
					    <a class="dropdown-item" onclick="location.href='${pageContext.request.contextPath}/index/favoriteRecruitment.ithrer?memberId=${member.memberId}';">스크랩한 공고</a>
					  	<c:if test="${not empty member.password }">
					    	<a class="dropdown-item" href="${pageContext.request.contextPath}/user/modifyMemberInfo.ithrer">회원정보 수정</a>
					  	</c:if>					  
					  </div>
					</div>
				 		<li class="nav-item"><span><a href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" class="nav-link memberNames"></a></span></li>
				 		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/common/signUpGoing.ithrer">이력서 관리</a></li>
				 		<li class="nav-item"><button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.ithrer'">로그아웃</button></li>
			 		</ul>
			 	</c:if>
			 	<c:if test="${member != null and member.memberId eq 'ithreradmin' }">
			 	<ul class="navbar-nav">
			 			<span class="headerMemberTitle" style="padding: 8px;">
					   		${member.memberName }님
					   </span>
				 		<li class="nav-item"><button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.ithrer'">로그아웃</button></li>
			 	</ul>
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
				  				<!-- 카카오로그인 -->
				  				<img src="${pageContext.request.contextPath }/resources/images/kakao_login.png" class="rounded-circle" onclick="kakaoLogin()" width="50px">
				  				<!-- 페이스북로그인 -->
<!--  				  			<div class="fb-login-button" data-size="small" data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="false" onlogin="facebookLogin()"></div>  -->
								<%-- <img src="${pageContext.request.contextPath }/resources/images/facebook.png" class="rounded-circle" onclick="facebookLogin()" width="50px"/> --%>
				  				<!-- 네이버로그인 -->
				  				<img height="35" src="http://static.nid.naver.com/oauth/small_g_in.PNG" onclick="naverPopup();" style="cursor: pointer;"/>
				  			</div>
				  			<br />
				  			<div class="form-group">
				  				<p class="font-italic text-info">ITHRer 플친</p>
				  				<a href="javascript:void addPlusFriend()">
  									<img src="${pageContext.request.contextPath }/resources/images/plusFriend.png" width="50px"/>
								</a>
								<a href="javascript:void plusFriendChat()">
								  <img src="${pageContext.request.contextPath }/resources/images/chatbot.png" width="50px"/>
								</a>								
				  			</div>
						</form>	
					</div>
                    <div class="tab-pane container fade" id="company">
						<form name="loginForm2">
				  			<div class="form-group">
				    			<label for="text">아이디</label>
				    			<input type="text" class="form-control" id="companyId" value="<%=companyId%>">
				  			</div>
				  			<div class="form-group">
				    			<label for="userPassword">비밀번호</label>
				    			<input type="password" class="form-control" id="companyPassword" onkeyup="enterkey2();">
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

<!-- 채팅 -->
<div id="chatting_div">
   <div style="height: 90%">
   	<textarea id="messageWindow" readonly="true" style="height: 100%; width: 100%"></textarea>
   </div>
   <input id="inputMessage" class="form-control" type="text" onkeyup="chat_enterkey()" placeholder="채팅을 입력해줭"/>
   <input type="submit" id="sendBtn" class="btn btn-default" value="보내기" onclick="chat_send()" />
</div>

<script>
  	//<![CDATA[
    function addPlusFriend() {
      Kakao.PlusFriend.addFriend({
        plusFriendId: '_jFIej' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
      });
    }
 	 //]]>
  	
  	//<![CDATA[
    function plusFriendChat() {
      Kakao.PlusFriend.chat({
        plusFriendId: '_jFIej' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
      });
    }
  	//]]>
  
	/* 네이버 로그인 새창 띄우기용 */
	function naverPopup(){
		window.open("<%=apiURL%>","_blank","width=300, height=300;"); 
	}
	/* 네이버 로그인 새창에서 access token 받아와서 로그인 처리 */
	function naverLogin(accessToken){
		$.ajax({
    		url : "${pageContext.request.contextPath}/user/naverLogin.ithrer?naverAccessToken="+accessToken,
    		/* url : "http://52.78.61.219:8080/FP_ITHRer/user/naverLogin.ithrer?naverAccessToken="+accessToken, */
    		//data : {naverAccessToken: accessToken},
    		type : "POST",
    		success : function(data){
    			console.log(data);
   				// 네이버 로그인후 새로고침	
   				if(data.result == 'true')
    				location.reload();
   				else if(data.result == 'already'){
   					alert("이미 해당 네이버 아이디가 접속중입니다!");
					location.reload();
   				}
    		}
    	});
	}

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
   				if(data.result == 'true')
    				location.reload();
   				else if(data.result == 'already'){
   					alert("이미 해당 카카오톡 아이디가 접속중입니다!");
					location.reload();
   				}
    		}
    	});
    }

	/* Enter 로 바로 로그인 */
	function enterkey(){
		if(window.event.keyCode == 13)
			memberLoginCheck();
	}
	
	function enterkey2(){
		if(window.event.keyCode == 13){
			companyLoginCheck();
		}
	}
	
	function chat_enterkey(){
		if(window.event.keyCode == 13){
			chat_send();
		}
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
					/* 원래 있던  */
					location.reload();
					console.log("여긴 오지");
				}	
				else if(data.result == "false"){
					$("#login-help").text("아이디 혹은 비밀번호가 알맞지 않습니다.");
					$("#login-help").addClass("text-danger");
				}
				else if(data.result == "already"){
					$("#login-help").text("이미 아이디가 접속중입니다.");
					$("#login-help").addClass("text-danger");
				}
			}
		});
	}
	
	function companyLoginCheck(){
		var companyId = $("#companyId").val().trim();
		var companyPassword = $("#companyPassword").val().trim();
		var companySaveId = $("#companySaveId").is(":checked");
		
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
					console.log("기업회원 로그인 성공!");
					location.reload();
				}
				else if(data.result == "false"){
					$("#login-help2").text("아이디 혹은 비밀번호가 알맞지 않습니다.");
					$("#login-help2").addClass("text-danger");
				}
				else if(data.result == "already"){
					$("#login-help2").text("이미 아이디가 접속중입니다.");
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
	
	function chatting(){
		$("#chatting_div").toggle();
    }
	
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채팅ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	var textarea = $("#messageWindow");
	 <%if(member != null || company != null) {%>
    	var webSocket = new WebSocket('ws://52.78.61.219:8080/ITHRer/websocket/chat.ithrer');
    <%}%> 
    
    var inputMessage = $("#inputMessage"); 
    
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
		if(event.data.indexOf('접속자 : ') == 0){
			$("#chat_cnt").text("채팅 ("+event.data+")");
			return;
		}
        textarea.val(textarea.val() + event.data + "\n");
        const top = textarea.prop('scrollHeight');
        textarea.scrollTop(top);
    }
    function onOpen(event) {
        textarea.val("채팅방에 입장 하셨습니다❤\n");
        console.log(event);
    }
    function onError(event) {
      alert(event.data);
    }
    
    function chat_send() {
    	if(inputMessage.val().length != 0){
    	<%if(member != null){%>
        textarea.val(textarea.val() + '<%=member.getMemberName()%>님 : ' + inputMessage.val() + "\n");
        webSocket.send('<%=member.getMemberName()%>님 : ' + inputMessage.val());
        inputMessage.val("");
        /* 채팅창 스크롤 자동 내리기 */
        const top = textarea.prop('scrollHeight');
        textarea.scrollTop(top);
    	<%}else if(company != null){%>
        textarea.val(textarea.val() + '<%=company.getCompName()%>님 : ' + inputMessage.val() + "\n");
        webSocket.send('<%=company.getCompName()%>님 : ' + inputMessage.val());
        inputMessage.val("");
        /* 채팅창 스크롤 자동 내리기 */
        const top = textarea.prop('scrollHeight');
        textarea.scrollTop(top);
    	<%}%>
    	}
    }
	
</script>
	
	<section id="content">