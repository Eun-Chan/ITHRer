<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
#modify-card-container{
	max-width: 600px;
	margin: 0 auto;
	display: none;
}
#checkPassword{
	max-width: 600px;
	margin: 0 auto;
}
#content{
	min-height: 500px;	
}
</style>

<br /><br />

<div id="checkPassword">
	<h3 style="color:#f44283;">회원정보 수정</h3><br />
	<div class="col-md-7">
        <input type="password" class="form-control" placeholder="비밀번호입력" id="password" name="password" onkeyup="enterkey();">
    </div>
    <br />
    <div class="col-md-9">
        <input type="button" class="btn btn-primary" onclick="memberLoginCheck();" value="확인">
        <input type="button" class="btn btn-secondary" value="홈으로" onclick="goHome();">
    </div>
</div>

<div id="modify-card-container" class="card">

	<div class="card-header"><h3>회원정보/수정</h3></div>
	<div class="card-body">
		<div class="tab-content">
           	<div class="tab-pane container active" id="Member">
                <form action="" method="POST" class="form">
                    <div class="form-group row mb-2">
                        <label class="col-md-2 col-form-label form-control-label">이름</label>
                        <div class="col-md-7">
                            <input class="form-control" placeholder="이름(실명)" id="memberName" name="memberName" value="${memberInfo.memberName}" disabled>
                        </div>
                    </div>
                    <div class="form-group row mb-2">
                        <label class="col-md-2 col-form-label form-control-label">아이디</label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" placeholder="아이디"  value="${memberInfo.memberId}" disabled>
                            <span><p id="id-help"></p></span>
                        </div>
                    </div>
                    <div class="form-group row mb-2">
                        <label class="col-md-2 col-form-label form-control-label">휴대폰</label>
                        <div class="col-md-7">
                            <input class="form-control" type="tel" placeholder="휴대폰번호" maxlength="11" id="tel" name="phone" value="${memberInfo.phone}">
                            <span><p></p></span>
                        </div>
                    </div>
                    <div class="form-group row mb-2">
                        <label class="col-md-2 col-form-label form-control-label">이메일</label>
                        <div class="col-md-7">
                            <input class="form-control" type="email" placeholder="이메일" id="MemberEmail" name="email" value="${memberInfo.email}">
                            <span><p id="email-help"></p></span>
                        </div>
                        
                    </div>
                    
                    
                    <div class="form-group row mb-2">
                        <label class="col-md-2 col-form-label form-control-label"></label>
                        <div class="col-md-9">
                            <input type="button" class="btn btn-primary" id="btn-submit-modify" value="정보수정">
                            <input type="button" class="btn btn-secondary" value="홈으로" onclick="goHome();">
                        </div>
                    </div>
                </form>
               </div>
	</div>


	</div>
</div>
<script>
var memberId = "${memberInfo.memberId}";
//비밀번호 체크
function memberLoginCheck(){
	var memberPassword = $("#password").val().trim();
	var memberSaveId = false;
	
	console.log(memberPassword.length);
	
	if(memberPassword.length == 0){
		alert("비밀번호를 입력해 주시길 바랍니다.");
		
		return;
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/user/memberLogin.ithrer",
		type : "POST",
		data : {memberId : memberId , memberPassword : memberPassword, memberSaveId : memberSaveId},
		success : function(data){
			if(data.result == "true"){
				$("#checkPassword").hide();
				$("#modify-card-container").show();
			}	
			else if(data.result == "already"){
				$("#checkPassword").hide();
				$("#modify-card-container").show();
			}
			else if(data.result == "false"){
				alert("비밀번호가 알맞지 않습니다.");
			}
		}
	});
}



var regEmail = /^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/i;

function goHome(){
	location.href="/ITHRer";
}

/* 핸드폰 번호 숫자만 입력만 가능 */
$("#tel").on("keyup", function() {
	$(this).val($(this).val().replace(/[^0-9]/g,""));
});

/* 이메일 유효성 검사 */
$("#MemberEmail").keyup(function(e){
	var memberEmail = $("#MemberEmail").val().trim();
	
	if(!regEmail.test(memberEmail)){
		$("#email-help").text("올바르지 않은 이메일 형식 입니다.");
		$("#email-help").removeClass("text-success");
		$("#email-help").addClass("text-danger");
		
	}
	else {
		$("#email-help").text("알맞은 이메일 형식 입니다.");
		$("#email-help").removeClass("text-danger");
		$("#email-help").addClass("text-success");
		
	}
});

$("#btn-submit-modify").on("click", function(){
	var tempPhone = $("#tel").val();
	var phone;
	if(tempPhone.length > 11){
		phone = tempPhone;
	}else{
		phone = tempPhone.slice(0,3) + "-"+tempPhone.slice(3,7)+"-"+tempPhone.slice(7);		
	}
	var email = $("#MemberEmail").val();
	
	
	console.log(phone, email, memberId);
	var data = {
			phone:phone,
			email:email,
			memberId:memberId
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/index/memberUpdate.ithrer",
		contentType: "application/json; charset=utf-8",
		dataType:"JSON",
		data:JSON.stringify(data),
		type:"POST",
		success:function(data){
			alert("수정을 성공하셨습니다!");
			if(data.result==1){
				$(".memberEmail").html("이메일 :"+data.email);
				$(".memberPhone").html("전화번호 :"+data.phone);				
			}
		}
	});
	
});

function enterkey(){
	if(window.event.keyCode == 13){
		memberLoginCheck();
	}
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>