<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<title>스크랩 공고창</title>
</head>
<style>
	.row ul{
		list-style: none;
		width: 100%;
		padding: 0;
	}
	.headerUl li{
		display: inline-block;
	}
	.headerUl li:first-of-type{
		float: left;
	}
	.headerUl:first-of-type button{
	    float: left;
	    padding: 8px 12px 10px;
	    min-width: 54px;
	    color: #333;
	    background: white;
	    border: 1px solid #ccc;
	}
	.headerUl li:last-of-type{
		float: right;
	}
	.row{
		padding: 25px;
	}
	.favoriteHeader{
	    width: 100%;
	    background: #fcfcfc;
	    border-top: 1px solid #bfbfbf;
	    border-bottom: 1px solid #bfbfbf;
	    margin:0;
	    padding: 10px 25px 15px 25px;
	}
	.favoriteContent{
		padding: 10px 25px 15px 25px;
	}
</style>
<body>
	<div class="container">
		<div class="row">
			<span style="font-size: 24px;">스크랩 공고</span>
		</div>
		<div class="row">
			<ul class="headerUl">
				<li><button>삭제</button></li>
				<li>
					<select name="" id="" style="width: 100px;height: 44px; border: border: 1px solid #ccc;">
						<option value="마감일순">마감일순</option>
						<option value="지원자순">지원자순</option>
					</select>
				</li>
			</ul>
		</div>
		<div>
			<div class="row favoriteHeader">
				<div class="col-sm-2"><input type="checkbox" name="" id="" /></div>
				<div class="col-sm-8" style="text-align: center;"><span style="font-size: 0.9em;" >채용공고</span></div>
				<div class="col-sm-2" style="text-align: center;"><span style="font-size: 0.9em;">마감일</span></div>
			</div>
			<c:forEach items="${favorites }" var="favorite">
			<div class="row favoriteContent">
				<ul class="col-sm-2" style="padding-left:29px;">
					<li><input type="checkbox" name="" id="" /></li>
				</ul>
				<ul class="col-sm-8" style="text-align: center;">
					<li><span style="font-size: 0.8em;">${favorite.memberId }</span></li>
				</ul>
				<ul class="col-sm-2" style="text-align: center;">
					<li><span style="font-size: 0.8em;">${favorite.compId }</span></li>
				</ul>
			</div>
			</c:forEach>
		</div>
			<!-- 페이징 바 부분 -->
		<div class="page-bar">
		<br /><br />
			${pageBar}
		</div>
	</div>
</body>
</html>