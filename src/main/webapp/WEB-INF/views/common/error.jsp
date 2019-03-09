<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩관련 라이브러리 -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</head>
<body>
	<div style="width: 1000px; margin: 0 auto; height: 700px; text-align: center; margin-top: 5%;">
		<img src="${pageContext.request.contextPath }/resources/images/error.svg" alt="" style="height: 300px;"/>
		<h3 style="color: skyblue;">죄송합니다. 현재 찾을수 없는 페이지를 요청 하셨습니다.</h3>
		<br/>
		<span> 존재하지 않는 주소를 입력하셨거나,</span>
		<br/>
		<span>요청하신 페이지의 주소가 변경 , 삭제 되어 찾을수 없습니다.</span>
		<br/>
		<br/>
		<span>관리자에게 문의 바랍니다.</span>
		<br/>
		<br />
		<span>감사합니다.</span>
		<br />
		<br />
		<input type="button" value="메인으로 " class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/'"/>
		<input type="button" value="이전페이지" class="btn btn-secondary" onclick="history.back();"/>
	</div>
</body>
</html>