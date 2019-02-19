<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="idsearchview">
		
		<br /><br /><br /><br /><br />
 			<div class="div">
			<h3><p class="text-alert">해당 메일로 고객님의 개인정보를 전송 했습니다.</p></h3>
			<h3><p class="text-alert">이메일을 확인해 주십시오</p></h3>
			<br />
			<button class="btn-success" onclick="location.href='${pageContext.request.contextPath}/'">
				메인 페이지 가기
			</button>
			</div>
		</div>
		
<style>
.idsearchview{
	background-color : #96ffff;
  	padding-right:  15px;
  	padding-left:  15px;
  	margin-left: 33%;
  	margin-top: 10%;
  	width: 500px;
    height: 350px;
    border-radius: 20px 20px 20px 20px;
   
}
.text-alert {
  color: #337ab7;
  text-align : center;
  
}
.btn-success {
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
  padding: 5px;
  display: block; 
  margin: 0 auto;
  
}

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>