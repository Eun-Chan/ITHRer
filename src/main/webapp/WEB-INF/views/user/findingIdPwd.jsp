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
								
								<div class="tab-content">
										<!-- 개인회원 -->
										<div class="tap-pane container active" id="member">
											<h3>개인회원</h3>
											<form action="${pageContext.request.contextPath }/user/memberIdView.ithrer" method="POST" id="memberIdView">
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
														<span><p id="memberIdCheck-help"></p></span>														
														<input type="button" class="btn btn-secondary submitBtn" value="확인" onclick="memberIdFind();"/>
														<br />
													</div>
												</div>
											</form>
										</div>
										
										<div class="tb-1" style="border-bottom: 1px solid; margin-top: 30px; margin-bottom: 30px"></div>
										
										<!-- 기업회원 -->
										<div class="tap-pane container mt-3" id="company">
											<h3>기업회원</h3>
											<form class="form">
												<div class="form-group row mb-2">
													<div class="col">
														<input class="form-control" placeholder="가입자명" id="compName" name="compName"/>
														<span><p id="name-help2"></p></span>
													</div>	
												</div>
												<div class="form-group row mb-2">
													<div class="col">
														<input class="form-control" placeholder="사업자번호(10자리)" type="text" id="licenseNo" name="licenseNo" maxlength="10"/>
													</div>
												</div>
												<div class="form group row mb-2">
													<div class="col">
														<span><p id="companyIdCheck-help"></p></span>														
														<input type="button" class="btn btn-secondary submitBtn" value="확인" onclick="companyIdFind();"/>
														<br />
													</div>
												</div>
											</form>
										</div>
								</div>
							</div>
							<!-- 비밀번호 찾기 -->
							<div class="tab-pane container" id="Password">
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
										<form action="${pageContext.request.contextPath }/user/memberPasswordUpdateGoing.ithrer" method="POST" id="memberPasswordUpdateGoing">
											<div class="form-group row mb-2">
												<div class="col">
													<input class="form-control" placeholder="아이디" id="memberId2" name="memberId2"/>
													<span><p id="id-help"></p></span>
												</div>
											</div>
											<div class="form-group row mb-2">
												<div class="col-8">
													<input class="form-control" placeholder="이메일주소(ithrer@ithrer.com)" type="email" id="memberEmail2" name="memberEmail2"/>
													<span><p id="email-help2""></p></span>
												</div>
												<div class="col-4">
													<input type="button" class="btn btn-secondary" value="인증번호 전송" onclick="memberEmailAuth();"/>
												</div>
											</div>
											<div class="form-group row mb-2">
												<div class="col">
													<input class="form-control" placeholder="이메일 인증번호" type="text" id="emailAuth" name="emailAuth"/>
													<span><p id="emailAuth-help"></p></span>
												</div>
											</div>
											<div class="form group row mb-2">
												<div class="col">
													<span><p id="memberPasswordCheck-help"></p></span>												
													<input type="button" class="btn btn-secondary submitBtn" value="확인" onclick="memberInfoCheck();"/>
													<br />
												</div>
											</div>
										</form>
									</div>
									
									<!-- 기업회원 -->
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
	
	var memberName = $("#memberName").val().trim();
	var memberEmail = $("#memberEmail").val().trim();
	
	/* 개인회원 이름 유효성 */
	$("#memberName").keyup(function(e){
		memberName = $("#memberName").val().trim();
		
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
		memberEmail = $("#memberEmail").val().trim();
		
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
						alert("메일에서 아이디를 확인하시기 바랍니다.");
						memberIdViewForm();
					}
					else if(data.result == "false"){
						$("#memberIdCheck-help").text("해당 회원정보는 존재하지 않습니다.");
						alert("일치하는 회원정보가 없습니다. \n회원정보를 다시 확인하거나 회원가입을 진행해주십시오.");
						location.reload();
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
	                alert(jqXHR);
	                alert(textStatus);
	                alert(errorThrown);
	            }
			});
		}
	}
	
	/* 멤버 아이디 form 전송 */
	function memberIdViewForm(){
		
		$("#memberIdView").submit();
	}
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 개인회원 비밀번호 찾기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	var authNum;
	
	/* 이메일 인증번호 보내기 */
	function memberEmailAuth(){
		var memberId2 = $("#memberId2").val().trim();
		var memberEmail2 = $("#memberEmail2").val().trim();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/findPasswordEmailAuth.ithrer",
			type : "POST",
			data : {memberId2 : memberId2 , memberEmail2 : memberEmail2},
			success : function(data){
				if(data.result =="true"){
					alert("메일에서 인증번호를 확인하시기 바랍니다.");
					authNum = data.authNum;
				}
				else{
					alert("일치하는 회원정보가 없습니다. \n회원정보를 다시 확인하거나 회원가입을 진행해주십시오.");
					location.reload();
				}
			}
		});
	}
	
	function memberInfoCheck(){
		var inputAuthNum = $("#emailAuth").val().trim();
		
		if(authNum == inputAuthNum){
			$("#memberPasswordUpdateGoing").submit();
		}
		else{
			$("#emailAuth-help").text("인증번호가 틀립니다.");
			$("#name-help").removeClass("text-success");
			$("#name-help").addClass("text-danger");
		}
	}
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 개인회원 비밀번호 찾기  끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 기업회원 아이디 찾기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
	function companyIdFind(){
		var compName = $("#compName").val().trim();
		var licenseNo = $("#licenseNo").val().trim();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/user/findCompanyId.ithrer",
			type : "POST",
			data : {compName : compName, licenseNo : licenseNo},
			success : function(data){
				
			}
		});
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>