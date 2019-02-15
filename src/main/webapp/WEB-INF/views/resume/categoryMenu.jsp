<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<style>
#category-container{
	border: 1px solid gray;
	max-width: 180px;
	background-color: #b89dff;
	color: white;
	margin-top: 200px;
	margin-left:75px;
	cursor: pointer;
	display: block;
	float: left;
	position: fixed;
}
#category-container ul {
	padding:10px;
	width : 200px;
}
#category-container ul li {
	list-style:none;
	font-size : 20px;
	margin-top : 5px;
}
</style>
<div id="category-container">
	<ul class="nav flex-column">
		<li class="nav-item"><a onclick="addEducation();"><span>학력</span></a></li>
		<li class="nav-item"><a onclick="addCareer();"><span>경력</span></a></li>
		<li class="nav-item"><a onclick="addIntern();"><span>인턴,대외활동</span></a></li>
		<li class="nav-item"><a onclick="addLearn();"><span>교육이수</span></a></li>
		<li class="nav-item"><a onclick="addCertificate();"><span>자격증</span></a></li>
		<li class="nav-item"><a onclick="addAward();"><span>수상</span></a></li>
		<li class="nav-item"><a onclick="addOverseas();"><span>해외경험</span></a></li>
		<li class="nav-item"><a onclick="addLanguage();"><span>어학</span></a></li>
		<li class="nav-item"><a onclick="addPotfolio();"><span>포트폴리오</span></a></li>
		<li class="nav-item"><a onclick="addPreference();"><span>취업우대</span></a></li>
		<li class="nav-item"><a onclick="addLetter();"><span>자기소개서</span></a></li>
	</ul>
</div>
<script>
function addEducation() {
	$("#educationTotal").show();
}
function addCareer() {
	$("#careerTotal").show();
}
function addIntern() {
	$("#internTotal").show();
}
function addLearn() {
	$("#learnTotal").show();
}
function addCertificate() {
	$("#certificateTotal").show();
}
function addAward() {
	$("#awardTotal").show();
}
function addOverseas() {
	$("#overseasTotal").show();
}
function addLanguage() {
	$("#languageTotal").show();
}
function addPotfolio() {
	$("#potfolioTotal").show();
}
function addPreference() {
	$("#preferenceTotal").show();
}
function addLetter() {
	$("#letterTotal").show();
}
</script>