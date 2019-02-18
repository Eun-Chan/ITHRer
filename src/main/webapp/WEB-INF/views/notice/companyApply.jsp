<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원하기</title>
</head>
<!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<style>
	.main{
		padding: 20px;
	    margin: 0 auto;
	    border: 1px solid #dce1eb;
	    background: #e9ecef;
	}
	.applyHeader{
		height: 50px;
		background-color: #3399ff;
		padding: 13px;
	}
	.headerContent{
		color:white;
		font-size: 1.1em;
	}
	.applyCompanytitle{
		height: 100px;
		padding: 20px 20px 13px 20px;
		border-bottom: 1px solid #d1d4d7;
	}
	.applyCompanyName{
		color: #3399ff;
		letter-spacing: 1px;
		display: block;
		margin-bottom: 3px;
	}
	.row1{
		border-bottom: 1px solid #d1d4d7;
		padding: 15px;
	}
	.content{
		width:100%;
		margin-left: 0px;
		border: 1px solid #d1d4d7;
		background: white;
	}
	.row2{
		padding: 15px;
		border-bottom: 1px solid #d1d4d7;
	}
	.btn{
		float: right;
		padding: 2px;
	}
	.row3{
		padding: 15px;
	}
	.row3 span{
		font-size: 0.8em;
		letter-spacing: 0.8px;
	}
	.memberPhone{
		margin-left: 3px;
	}
	.applybutton{
		margin: 0 auto;
	    margin-top: 20px;
	    width: 200px;
	    height: 50px;
	}
	.two{
		margin-top:20px;
	}
</style>
<body>
	<div class="applyHeader">
		<span class="headerContent">입사지원</span>
	</div>
	<form action="">
		<div class="applyCompanytitle">
			<span class="applyCompanyName"><img src="${pageContext.request.contextPath }/resources/images/company.svg" alt="" style="width: 30px"/></span>
			<span class="applyRctitle"></span>
		</div>
		<div class="row main">
			<div class="row content">
				<div class="col-sm-12 row1">
					<strong>지원이력서</strong>
				</div>
				<div class="col-sm-12 row2">
					<span style="font-size: 0.9em; letter-spacing: 1px;" >이력서 제목(이력서가 없다면 추가버튼 만들어야함.)</span>
				</div>
				<div class="col-sm-12 row3">
					<span class="memberEmail">이메일 : ysm165@naver.com</span>
					<span class="memberPhone">전화번호 : 010-1111-1111</span>	
					<button type="button" class="btn btn-info">수정</button>		
				</div>
			</div>
			<div class="row content two">
				<div class="col-sm-12 row1">
					<strong>포트폴리오</strong>
				</div>
				<div class="col-sm-12 row2">
					<span style="font-size: 0.9em; letter-spacing: 1px;" >포트폴리오 제목(이력서가 없다면 추가버튼 만들어야함.)</span>
				</div>
			</div>
			<button type="submit" class="btn btn-success applybutton">지원 하기</button>			
		</div>
	</form>
<script>
$(function(){
	var compName = $(".noticeCompanyName", opener.document).html();
	$(".applyCompanyName").append(compName);
	var rcContent = $(".rcContent",opener.document).html();
	$(".applyRctitle").html(rcContent);
});
</script>
</body>
</html>