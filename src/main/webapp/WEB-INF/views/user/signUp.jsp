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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/signUp.css" />

<script type="text/javascript">
    $(document).ready(function () {
        // popover demo
        $("[data-toggle=popover]").popover({trigger: "hover"});
        
    });
</script>

</head>

<body class="bg-light">
	<div class="container py-5" style="max-width: 1000px">
    <div class="row">
        <div class="mx-auto col-sm-7">
                    <!-- form user info -->
                    <div class="card">
                        <div class="card-header">
                            <h4>회원가입</h4>
                            <!-- Nav tabs -->
                			<ul class="nav nav-tabs">
                    			<li class="nav-item">
                    				<a class="nav-link" data-toggle="tab" href="#Member">개인회원</a>
                   				</li>
                    			<li class="nav-item">
                    				<a class="nav-link" data-toggle="tab" href="#Company">기업회원</a>
                    			</li>
                			</ul>
                        </div>
                        <div class="card-body">
                        	<div class="tab-content">
                        	<div class="tab-pane container active" id="Member">
	                            <form action="${pageContext.request.contextPath }/user/createMember.ithrer" method="POST" class="form" onsubmit="return createMemberSubmit();">
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">이름</label>
	                                    <div class="col-md-10">
	                                        <input class="form-control" placeholder="이름(실명)" id="memberName" name="memberName">
	                                        <span><p id="name-help"></p></span>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">아이디</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="text" placeholder="아이디" id="memberId" name="memberId">
	                                        <span><p id="id-help"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                    	<button type="button" class="btn btn-primary" id="idCheck">중복 검사</button>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label" style="padding-left:12px">비밀번호</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="password" placeholder="비밀번호" id="MemberPassword" name="password">
	                                        <span><p id="password-help"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                   		<button type="button" class="btn btn-secondary" data-container="body" data-toggle="popover" data-placement="top" data-content="8~15자의 영문, 숫자, 특수기호 포함">?</button>
	                                    </div>
	                                    <div class="col-md-2">
	                                    	<label class="btn btn-secondary"><input type="checkbox" class="btn btn-primary" id="pwd_see"> 표시</label>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">휴대폰</label>
	                                    <div class="col-md-10">
	                                        <input class="form-control" type="tel" placeholder="휴대폰번호" maxlength="11" id="tel" name="phone">
	                                        <span><p></p></span>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">이메일</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="email" placeholder="이메일" id="MemberEmail" name="email">
	                                        <span><p id="email-help"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                    	<button type="button" class="btn btn-primary" id="MemberEmailAuth" disabled="disabled">인증번호 전송</button>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2 authDiv" style="display:none">
	                                    <label class="col-md-2 col-form-label form-control-label">인증번호</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="text" placeholder="인증번호" id="MemberAuthNum">
	                                        <span><p id="emailAuth-help"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                    	<button type="button" class="btn btn-primary" onclick="auth_Check()">인증번호 확인</button>
	                                    </div>
	                                </div>
	                                
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label"></label>
	                                    <div class="col-md-9">
	                                        <input type="submit" class="btn btn-primary" value="회원가입">
	                                        <input type="button" class="btn btn-secondary" value="홈으로" onclick="location.href='/ithrer'">
	                                    </div>
	                                </div>
	                            </form>
                            </div>
                            <div class="tab-pane container fade" id="Company">
                            	<form action="${pageContext.request.contextPath }/user/createCompany.ithrer" method="POST" onsubmit="return createCompanySubmit()">
                            		<h2>기업정보</h2>
                            		<br />
                            		<div class="form-group row mb-4">
                            			<label class="col-md-4 col-form-label form-control-label" style="padding-left:12px">기업형태</label>
                            			<div class="col-md-8">
	                            			<select id="classification" class="form-control" required="required">
	                            				<option selected placeholder="기업형태"></option>
	                            				<option>대기업</option>
	                            				<option>대기업 계열사&자회사</option>
	                            				<option>중소기업(300명이하)</option>
	                            				<option>중견기업(300명이상)</option>
	                            				<option>벤처기업</option>
	                            				<option>외국계(외국 투자기업)</option>
	                            				<option>외국계(외국 법인기업)</option>
	                            				<option>국내 공공기관&공기업</option>
	                            				<option>비영리단체&협회&교육재단</option>
	                            				<option>외국 기관&비영리기구&단체</option>
	                            			</select>
                            			</div>
                            		</div>
                            		<div class="form-group row mb-4">
                            			<label class="col-md-4 col-form-label form-control-label">사업자등록번호</label>
                            			<div class="col-md-8">
                            				<input class="form-control" type="text" placeholder="사업자등록번호" name="licenseNo" required="required" maxlength="10"/>
                            			</div>
                            		</div>
                            		<div class="form-group row mb-4">
                            			<label class="col-md-4 col-form-label form-control-label">회사명</label>
                            			<div class="col-md-8">
                            				<input class="form-control" type="text" placeholder="회사명" name="compName" required="required"/>
                            			</div>
                            		</div>
                            		<div class="form-group row mb-4">
                            			<label class="col-md-4 col-form-label form-control-label">대표자명</label>
                            			<div class="col-md-8">
                            				<input class="form-control" type="text" placeholder="대표자명" name="representive" required="required"/>
                            			</div>
                            		</div>
                            		<div class="form-group row mb-4">
                            			<label class="col-md-4 col-form-label form-control-label">회사주소</label>
                            			<div class="col-md-8">
                            				<input class="form-control" type="text" placeholder="회사주소" id="address" name="location" required="required"/>
                            			</div>
                            		</div>
                            		
                            		<div class="form-group row mb-4" style="border-bottom: 1px solid">
                            			<label class="col-md-4 col-form-label form-control-label"></label>
                            		</div>
                            		
                            		<h2>회원정보</h2>
                            		<br />
									<div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">아이디</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="text" placeholder="아이디" id="compId" name="compId">
	                                        <span><p id="comp-id-help"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                    	<button type="button" class="btn btn-primary" id="compIdCheck">중복 검사</button>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label" style="padding-left:12px">비밀번호</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="password" placeholder="비밀번호" id="companyPassword" name="password">
	                                        <span><p id="comp-password-help"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                   		<button type="button" class="btn btn-secondary" data-container="body" data-toggle="popover" data-placement="top" data-content="8~15자의 영문, 숫자, 특수기호 포함">?</button>
	                                    </div>
	                                    <div class="col-md-2">
	                                    	<label class="btn btn-secondary"><input type="checkbox" class="btn btn-primary" id="pwd_see2"> 표시</label>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">휴대폰</label>
	                                    <div class="col-md-10">
	                                        <input class="form-control" type="tel" placeholder="휴대폰번호" maxlength="11" id="tel2" name="phone">
	                                        <span><p></p></span>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label">이메일</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="email" placeholder="이메일" id="companyEmail" name="compEmail">
	                                        <span><p id="email-help2"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                    	<button type="button" class="btn btn-primary" id="CompanyEmailAuth" disabled="disabled">인증번호 전송</button>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2 authDiv2" style="display:none">
	                                    <label class="col-md-2 col-form-label form-control-label">인증번호</label>
	                                    <div class="col-md-7">
	                                        <input class="form-control" type="text" placeholder="인증번호" id="CompanyAuthNum">
	                                        <span><p id="emailAuth-help2"></p></span>
	                                    </div>
	                                    <div class="col-md-1">
	                                    	<button type="button" class="btn btn-primary" onclick="auth_Check2()">인증번호 확인</button>
	                                    </div>
	                                </div>
	                                <div class="form-group row mb-2">
	                                    <label class="col-md-2 col-form-label form-control-label"></label>
	                                    <div class="col-md-9">
	                                        <input type="submit" class="btn btn-primary" value="회원가입">
	                                        <input type="button" class="btn btn-secondary" value="홈" onclick="location.href='/ithrer'">
	                                    </div>
	                                </div>
                            	</form>
                            </div>
                        </div>
                        </div>
                    </div>
                    <!-- /form user info -->
                    
        </div>
    </div>
</div>
<script>
	/* 유효성 통과 확인 변수 */
	var memberName_OK = 0;
	var memberId_OK = 0;
	var memberPassword_OK = 0;
	var memberEmail_OK = 0;
	var auth_OK = 0;
	/* ----- 유효성 통과 확인 변수 끝 */
	
	/* 유효성 검사 변수 시작 */
	var regName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
	var regId = /^[a-z][a-z0-9]{7,14}$/;
	var regPassword = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	var regEmail = /^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/i;
	/* ----- 유효성 검사 변수 끝 */
	
	/* 이메일 인증번호 저장 변수 */
	var authNum;
	
	/* 이름 유효성 검사 */
	$("#memberName").keyup(function(e){
		var name = $("#memberName").val().trim();
		
		if(!regName.test(name)){
			$("#name-help").text("이름은 한글만 가능하며, 2자리 이상이어야 합니다.");
			$("#name-help").removeClass("text-success");
			$("#name-help").addClass("text-danger");
	
		}
		else{
			$("#name-help").text("");
			memberName_OK = 1;
		}
	});
	
	/* 아이디 유효성 검사 - ajax */
	$("#idCheck").on("click", function(){
		var id = $("#memberId").val().trim();
		
		if(!regId.test(id)){
			$("#id-help").text("아이디는 영소문자/숫자만 가능하고, 단 소문자로 시작해야합니다.(8~15자리)");
			$("#id-help").removeClass("text-success");
			$('#id-help').addClass('text-danger');
			memberId_OK = 0;
			return;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/user/idCheck.ithrer",
			data: {id:id},
			success: function(data){
				if(data.result == "1"){
					$("#id-help").text("이미 사용중인 아이디거나 탈퇴된 아이디입니다.");
					$("#id-help").removeClass("text-success");
					$("#id-help").addClass("text-danger");
					memberId_OK = 0;
				}
				else{
					$("#id-help").text("사용 가능한 아이디 입니다.");
					$("#id-help").removeClass("text-danger");
					$("#id-help").addClass("text-success");
					memberId_OK = 1;
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
                alert(jqXHR);
                alert(textStatus);
                alert(errorThrown);
            }
		});
	});
	/* 비밀번호 유효성 검사 */
	$("#MemberPassword").keyup(function(e){
		console.log(e.key);
		/* 공백 못하게 막기 */
		if(e.keyCode == 32){
			$(this).val($(this).val().replace(/[\s]/g,""));
		}
		
		var memberPassword = $(this).val().trim();
		if(!regPassword.test(memberPassword)){
			$("#password-help").text("비밀번호는 숫자/문자/특수문자 포함형태로 8~15자리 입니다.");
			$("#password-help").removeClass("text-success");
			$("#password-help").addClass("text-danger");
			memberPassword_OK = 0;
		}
		else {
			$("#password-help").text("사용 가능한 비밀번호 입니다.");
			$("#password-help").removeClass("text-danger");
			$("#password-help").addClass("text-success");
			memberPassword_OK = 1;
		}
	});
	
	/* 비밀번호 표시 클릭 시 비밀번호 보여주기 */
	$("#pwd_see").on("click", function(){
		if($("#pwd_see").prop("checked") == true){
			$("#MemberPassword").attr('type','text');
		}
		else {
			$("#MemberPassword").attr('type','password');
		}
	});
	
	/* 핸드폰 번호 숫자만 입력만 가능 */
	$("#tel").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	/* 이메일 유효성 검사 */
	$("#MemberEmail").keyup(function(e){
		var memberEmail = $("#MemberEmail").val().trim();
		/* 이메일 인증 버튼을 알맞은 이메일 형식을 작성했을 경우 클릭 */
		var memberEmailAuth = $("#MemberEmailAuth");
		
		if(!regEmail.test(memberEmail)){
			$("#email-help").text("올바르지 않은 이메일 형식 입니다.");
			$("#email-help").removeClass("text-success");
			$("#email-help").addClass("text-danger");
			memberEmail_OK = 0;
			/* 이메일 버튼 비활성화 */
			memberEmailAuth.prop("disabled" , true);
		}
		else {
			$("#email-help").text("알맞은 이메일 형식 입니다.");
			$("#email-help").removeClass("text-danger");
			$("#email-help").addClass("text-success");
			memberEmail_OK = 1;
			/* 이메일 버튼 활성화 */
			memberEmailAuth.prop("disabled" , false);
		}
	});
	
	/* 이메일 인증 버튼 눌렀을 때 클릭 이벤트 */
	$("#MemberEmailAuth").on("click", function(){
		var memberEmail = $("#MemberEmail").val().trim();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/emailAuth.ithrer",
			data : {memberEmail : memberEmail},
			success : function(data){
				if(data.result == "false"){
					alert("이미 회원가입된 이메일 입니다.");
					$("#email-help").text("이미 회원가입된 이메일입니다!");
					$("#email-help").removeClass("text-success");
					$("#email-help").addClass("text-danger");
				}
				else {
					console.log(data);
					$(".authDiv").css("display","flex");
					
					/* 인증번호 변수에 저장하기 */
					authNum = data.result;
				}
			}
		});
	});
	
	/* 인증번호 확인 버튼 눌렀을 시 클릭 이벤트 */
	function auth_Check(){
		/* 유저가 입력한 인증번호 */
		var input_Auth_Num = $("#MemberAuthNum").val().trim();
		
		
		if(input_Auth_Num == authNum){
			console.log("인증 완료!");
			auth_OK = 1;
			$("#emailAuth-help").text("인증 완료!");
			$("#emailAuth-help").removeClass("text-danger");
			$("#emailAuth-help").addClass("text-success");
			
		}
		else{
			console.log("인증 실패!");
			auth_OK = 0;
			$("#emailAuth-help").text("인증번호 인증 실패!");
			$("#emailAuth-help").removeClass("text-success");
			$("#emailAuth-help").addClass("text-danger");
		
		}
	}

	/* 개인회원 폼 - onSubmit */
	function createMemberSubmit(){
		if(memberName_OK == 1 && memberId_OK == 1 && memberPassword_OK == 1 && memberEmail_OK == 1 && auth_OK == 1){
			alert("ITHRer ! 회원가입에 완료되었습니다.");
			console.log($("#memberName").val().trim());
			console.log($("#memberId").val().trim());			
			return true;
		}
		console.log(memberName_OK , memberId_OK , memberPassword_OK , memberEmail_OK , auth_OK);
		alert("모든 입력사항을 제대로 입력 하십시오.");
		return false;
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 개인 회원가입 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 기업 회원가입 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	var comp_Id_OK = 0;
	var comp_Password_OK = 0;
	var comp_Email_OK = 0;
	var comp_Email_Auth_OK = 0;
	
	var authNum2;
	
	$("#license_no_Check").on("click" , function(){
		var license_no = $("#license_no").val().trim();
		console.log(license_no);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/license_Check",
			data : {license_no : license_no},
			success : function(data){
				console.log(data)
			}
		});
	});
	
	/* 주소 추가 */
	$(document).on("click","[id=address]",function(){
		
		var $this = $(this);
		
		new daum.Postcode({
			oncomplete: function(data) {
		        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        console.log(data.address);
		        console.log($this);
		    	$this.val(data.address);
		    }
		}).open();
	});	
	
	/* 기업 아이디 유효성 검사 */
	$("#compId").keyup(function(e){
		var compId = $(this).val().trim();
		console.log(compId);
		
		if(!regId.test(compId)){
			$("#comp-id-help").text("아이디는 영소문자/숫자만 가능하고, 단 소문자로 시작해야합니다.(8~15자리)");
			$("#comp-id-help").removeClass("text-success");
			$('#comp-id-help').addClass('text-danger');
		}
		else{
			$("#comp-id-help").text("");
			comp_Id_OK = 0;
		}
	});
	
	/* 기업 아이디 유효성 검사 - ajax */
	$("#compIdCheck").on("click", function(){
		var compId = $("#compId").val().trim();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/compIdCheck.ithrer",
			data : {compId : compId},
			success : function(data){
				if(data.result == "true"){
					$("#comp-id-help").text("아이디 OK");
					$("#comp-id-help").removeClass("text-danger");
					$("#comp-id-help").addClass("text-success");
					comp_Id_OK = 1
				}
				else{
					$("#id-help").text("이미 사용중인 아이디거나 탈퇴된 아이디입니다.");
					$("#id-help").removeClass("text-success");
					$("#id-help").addClass("text-danger");
					comp_Id_OK = 0;
				}
			}
		});
	});
	
	$("#companyPassword").keyup(function(e){
		var password = $(this).val().trim();
		
		if(!regPassword.test(password)){
			$("#comp-password-help").text("비밀번호는 숫자/문자/특수문자 포함형태로 8~15자리 입니다.");
			$("#comp-password-help").removeClass("text-success");
			$("#comp-password-help").addClass("text-danger");
			comp_Password_OK = 0;
		}
		else {
			$("#comp-password-help").text("사용 가능한 비밀번호 입니다.");
			$("#comp-password-help").removeClass("text-danger");
			$("#comp-password-help").addClass("text-success");
			comp_Password_OK = 1;
		}
	});
	
	/* 비밀번호 표시 클릭 시 비밀번호 보여주기 */
	$("#pwd_see2").on("click", function(){
		if($("#pwd_see2").prop("checked") == true){
			$("#companyPassword").attr('type','text');
		}
		else {
			$("#companyPassword").attr('type','password');
		}
	});
	
	/* 이메일 유효성 검사 */
	$("#companyEmail").keyup(function(e){
		var email = $(this).val().trim();
		var companyEmailAuth = $("#CompanyEmailAuth"); 
		
		if(!regEmail.test(email)){
			$("#email-help2").text("올바르지 않은 이메일 형식 입니다.");
			$("#email-help2").removeClass("text-success");
			$("#email-help2").addClass("text-danger");
			comp_Email_OK = 0;
			
			/* 이메일 버튼 비활성화 */
			companyEmailAuth.prop("disabled", true);
		}
		else {
			$("#email-help2").text("알맞은 이메일 형식 입니다.");
			$("#email-help2").removeClass("text-danger");
			$("#email-help2").addClass("text-success");
			comp_Email_OK = 1;
			/* 이메일 버튼 활성화 */
			companyEmailAuth.prop("disabled", false);
		}
	});
	
	/* 이메일 인증 버튼 눌렀을 때 클릭 이벤트 */
	$("#CompanyEmailAuth").on("click" , function(){
		var email = $("#companyEmail").val().trim();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/compEmailAuth.ithrer",
			data : {email : email},
			success : function(data){
				if(data.result == "false"){
					alert("이미 회원가입된 이메일 입니다.");
					$("#email-help2").text("이미 회원가입된 이메일입니다!");
					$("#email-help2").removeClass("text-success");
					$("#email-help2").addClass("text-danger");
				}
				else{
					console.log(data);
					$(".authDiv2").css("display","flex");
					
					/* 인증번호 변수에 저장하기 */
					authNum = data.result;
				}
				
			}
		});
	});
	
	/* 인증번호 확인 버튼 눌렀을 시 클릭 이벤트 */
	function auth_Check2(){
		/* 유저가 입력한 인증번호 */
		var input_Auth_Num = $("#CompanyAuthNum").val().trim();
		if(input_Auth_Num == authNum){
			console.log("인증 완료!");
			var comp_Email_Auth_OK = 1;
			$("#emailAuth-help2").text("인증 완료!");
			$("#emailAuth-help2").removeClass("text-danger");
			$("#emailAuth-help2").addClass("text-success");
		}
		else{
			console.log("인증 실패!");
			var comp_Email_Auth_OK = 1;
			$("#emailAuth-help2").text("인증 실패!");
			$("#emailAuth-help2").removeClass("text-success");
			$("#emailAuth-help2").addClass("text-danger");
		}
	}
	var comp_Id_OK = 0;
	var comp_Password_OK = 0;
	var comp_Email_OK = 0;
	var comp_Email_Auth_OK = 0;
	/* 기업회원 onSubmit */
	function createCompanySubmit(){
		if(comp_Id_OK == 1 && comp_Password_OK == 1 && comp_Email_OK == 1 && comp_Email_Auth_OK == 1){
			alert("ITHRer ! 회원가입에 완료되었습니다.");	
			return true;
		}
		alert("모든 입력사항을 제대로 입력 하십시오.");
		return false;
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 기업 회원가입 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
</script>
</body>
</html>