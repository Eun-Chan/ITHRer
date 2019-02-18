<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findingIdPwd.css" />
	
<body class="bg-light">
	<div class="container py-4">
		<div class="row">
			<div class="mx-auto col-sm-6">
				<div class="card">
					<!-- 카드 헤더 -->
					<div class="card-header mb-3">
						<h3>아이디/비밀번호찾기</h3>
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#ID">아이디 찾기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#Password">비밀번호 찾기</a>
							</li>
						</ul>
					</div>
					<!-- 카드 헤더 끝 -->
					<!-- 카드 body -->
					<div class="card-body">
						<div class="tab-content">
							<div class="tab-pane container active" id="ID">
								<!-- 개인회원 / 기업회원 으로 나누기 -->
								<ul class="nav nav-pills nav-justified mb-5">
									<li class="nav-item">
										<a class="nav-link active" href="#member">개인회원</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#company">기업회원</a>
									</li>									
								</ul>
								<div class="tab-content">
										<!-- 개인회원 -->
										<div class="tap-pane active" id="member">
											<form action="${pageContext.request.contextPath}/user/memberIdFindCheck.ithrer" method="POST" class="form" method="POST" onsubmit="return memberIdFind()">
												<div class="form-group row mb-2">
													<div class="col">
														<input class="form-control" placeholder="이름" id="memberName" name="memberName"/>
														<span><p id="name-help"></p></span>
													</div>
												</div>
												<div class="form-group row mb-2">
													<div class="col">
														<input class="form-control" placeholder="이메일주소(ithrer@ithrer.com)" type="email" id="memberEmail" name="memberEmail"/>
														<span><p id="email-help""></p></span>
													</div>
												</div>
												<div class="form group row mb-2">
													<div class="col">
														<input type="submit" class="btn btn-secondary submitBtn" value="확인"/>
														<span><p id="memberIdCheck-help"></p></span>
													</div>
												</div>
											</form>
										</div>
										
										<!-- 기업회원 -->
										<div class="tap-pane" id="company">
											<form action="" method="POST" class="form">
												<div class="form-group row mb-2">
													<div class="col">
														
													</div>
												</div>
											</form>
										</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 카드 body 끝 -->
				</div>
				
				
			</div>
		</div>
	</div>
</body>

<script>	
	var memberName_OK = 0;
	var memberEmail_OK = 0;

	var regName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
	var regEmail = /^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/i;
	
	/* 개인회원 이름 유효성 */
	$("#memberName").keyup(function(e){
		var memberName = $("#memberName").val().trim();
		
		if(!regName.test(memberName)){
			$("#name-help").text("이름은 한글만 가능하며, 2자리 이상이어야 합니다.");
			$("#name-help").removeClass("text-success");
			$("#name-help").addClass("text-danger");
			memberName_OK = 0;
		}
		else{
			$("#name-help").text("이름 OK");
			$("#name-help").removeClass("text-danger");
			$("#name-help").addClass("text-success");
			memberName_OK = 1;
		}
	});
	
	/* 개인회원 이메일 유효성 */
	$("#memberEmail").keyup(function(e){
		var memberEmail = $("#memberEmail").val().trim();
		
		if(!regEmail.test(memberEmail)) {
			$("#email-help").text("올바르지 않은 이메일 형식 입니다.");
			$("#email-help").removeClass("text-success");
			$("#email-help").addClass("text-danger");
			memberEmail_OK = 0;
		}
		else {
			$("#email-help").text("알맞은 이메일 형식 입니다.");
			$("#email-help").removeClass("text-danger");
			$("#email-help").addClass("text-success");
			memberEmail_OK = 1;
		}
	});
	
	function memberIdFind(){
		/* 이름과 이메일이 DB에 있을 경우 true */
		if(memberName_OK == 1 && memberEmail_OK == 1){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/memberIdFindCheck.ithrer",
				data : {memberName : memberName , memberEmail : memberEmail},
				type : "POST",
				success : function(data){
					if(data.result == "true"){
						alert("true");
						return true;
					}
					else {
						$("#memberIdCheck-help").text("해당 회원정보는 존재하지 않습니다.");
						alert("false");
					}
				}
			});
		}
		
		return false;
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>