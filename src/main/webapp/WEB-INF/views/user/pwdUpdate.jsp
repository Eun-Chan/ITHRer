<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	
<div class="contentwrap">
	<article class="container">
		<div class="page-header">
			<h1>비밀번호 변경</h1>
		</div>
		<form action="<%=request.getContextPath()%>/sign/passwordUpdate.do" class="form-horizontal" onsubmit="return passwordUpdateSubmit();">
			<div class="form-group">
				<label for="userId" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId" value="${member.memberId }" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="userPassword" class="col-sm-2 control-label">비밀번호 변경</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="변경하실 비밀번호를 입력하세요."/>
					<span><p id="password-help"></p></span>
				</div>
			</div>
			<div class="form-group">
				<label for="userPasswordOk" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="userPasswordOk" name="userPasswordOk" placeholder="비밀번호를 한번 더 입력하세요."/>
					<span><p id="passwordOk-help"></p></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="location.href='index.jsp'">나가기</button>
				</div>
			</div>
		</form>
	</article>
</div>

<script>
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>