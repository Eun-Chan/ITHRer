<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
<div class="contentwrap">
	<article class="container">
		<div class="page-header">
			<h1>비밀번호 변경</h1>
		</div>
		<form action="${pageContext.request.contextPath }/user/memberPasswordUpdate.ithrer" method="POST" class="form-horizontal" onsubmit="return passwordUpdateSubmit();">
			<div class="form-group">
				<label for="userId" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="memberId" name="memberId" value="${member.memberId }"readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="userPassword" class="col-sm-2 control-label">비밀번호 변경</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password" placeholder="변경하실 비밀번호를 입력하세요."/>
					<span><p id="password-help"></p></span>
				</div>
			</div>
			<div class="form-group">
				<label for="userPasswordOk" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="memberPasswordOk" placeholder="비밀번호를 한번 더 입력하세요."/>
					<span><p id="passwordOk-help"></p></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="location.href='/ithrer'">나가기</button>
				</div>
			</div>
		</form>
	</article>
</div>

<script>
	// 비밀번호 유효성 검사 변수
	var regPassword = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	var memberPassword_OK = 0;
	var pwd_Same = 0;
	
	$("#password").keyup(function(e){
		var pwd = $(this).val().trim();
		
		if(!regPassword.test(pwd)){
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
	
	$("#memberPasswordOk").keyup(function(e){
		var pwd = $("#password").val().trim();
		var pwd_ok = $("#memberPasswordOk").val().trim();
		
		if(memberPassword_OK == 0){
			$("#passwordOk-help").text("유효하지 않은 비밀번호 입니다.");
			$("#passwordOk-help").removeClass("text-success");
			$("#passwordOk-help").addClass("text-danger");
			pwd_Same = 0;
		}
		else if(memberPassword_OK == 1 && (pwd != pwd_ok)){
			$("#passwordOk-help").text("비밀번호가 일치하지 않습니다.");
			$("#passwordOk-help").removeClass("text-success");
			$("#passwordOk-help").addClass("text-danger");
			pwd_Same = 0;
		}
		else {
			$("#passwordOk-help").text("비밀번호 일치!");
			$("#passwordOk-help").removeClass("text-danger");
			$("#passwordOk-help").addClass("text-success");
			pwd_Same = 1;
		}
		
	});
	
	function passwordUpdateSubmit(){
		if(memberPassword_OK == 1 && pwd_Same == 1){
			return true;
		}
		console.log(memberPassword_OK);
		console.log(pwd_Same);
		return false;
	}
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>