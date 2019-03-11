<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<%-- <!-- 부트스트랩관련 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script> --%>
<style>
#category-container{
	border: 1px solid gray;
	width : 1140px;
	background-color: lightsteelblue;
	color: white;
	left: 50%; 
	margin-left : -570px;
	position : fixed;
	z-index : 1; 
}
#category-table {
	margin : 0 auto;
	width : 800px;
	font-size : 20px;
}
#category-table th{
	text-align : center;
}
#category-table td{
	text-align : center;
}
#category-table td a{
	cursor : pointer;
}
</style>
<div id="category-container">
	<table id="category-table">
		<tr>
			<th colspan="5">이력서 항목</th>
		</tr>
		<tr>
			<td><a name="hovercheck" onclick="addEducation();"><span>학력</span></a></td>
			<td><a name="hovercheck" onclick="addCareer();"><span>경력</span></a></td>
			<td><a name="hovercheck" onclick="addOverseas();"><span>해외경험</span></a></td>
			<td><a name="hovercheck" onclick="addLearn();"><span>교육이수</span></a></td>
			<td><a name="hovercheck" onclick="addCertificate();"><span>자격증</span></a></td>
		</tr>
		<tr>
			<td><a name="hovercheck" onclick="addAward();"><span>수상</span></a></td>
			<td><a name="hovercheck" onclick="addLanguage();"><span>어학</span></a></td>
			<td><a name="hovercheck" onclick="addIntern();"><span>인턴,대외활동</span></a></td>
			<td><a name="hovercheck" onclick="addPreference();"><span>취업우대</span></a></td>
			<td><a name="hovercheck" onclick="addLetter();"><span>자기소개서</span></a></td>
		</tr>
	</table>
</div>
<br /><br /><br /><br />
<script>
var educount = 0;
var carerrcount = 0;
var interncount = 0;
var learncount = 0;
var certificatecount = 0;
var awardcount = 0;
var overseascount = 0;
var languagecount = 0;
var potfoliocount = 0;
var preferencecount = 0;
var lettercount = 0;
function addEducation() {
	educount++;
	if(educount%2==0) {
		$("#educationTotal").show();	
	}
	else {
		$("#educationTotal").hide();	
		$("#educationTotal input").val('');	
		$("#educationTotal select").val('');	
		$("#educationTotal textarea").val('');	
	}
}
function addCareer() {
	carerrcount++;
	if(carerrcount%2==0) {
		$("#careerTotal").hide();
		$("#careerTotal input").val('');	
		$("#careerTotal textarea").val('');	
	}
	else {
		$("#careerTotal").show();		
	}
}
function addIntern() {
	interncount++;
	if(interncount%2==0) {
		$("#internTotal").hide();
		$("#internTotal input").val('');	
		$("#internTotal select").val('');	
		$("#internTotal textarea").val('');	
		
	}
	else {
		$("#internTotal").show();		
	}
}
function addLearn() {
	learncount++;
	if(learncount%2==0) {
		$("#learnTotal").hide();
		$("#learnTotal input").val('');	
		$("#learnTotal textarea").val('');
	}
	else {
		$("#learnTotal").show();	
	}
}
function addCertificate() {
	certificatecount++;
	if(certificatecount%2==0) {
		$("#certificateTotal").hide();	
		$("#certificateTotal input").val('');		
	}
	else {
		$("#certificateTotal").show();
	}
}
function addAward() {
	awardcount++;
	if(awardcount%2==0) {
		$("#awardTotal").hide();
		$("#awardTotal input").val('');	
		$("#awardTotal textarea").val('');	
	}
	else {
		$("#awardTotal").show();
	}
}
function addOverseas() {
	overseascount++;
	if(overseascount%2==0) {
		$("#overseasTotal").hide();
		$("#overseasTotal input").val('');	
		$("#overseasTotal textarea").val('');	
	}
	else {
		$("#overseasTotal").show();
	}
}
function addLanguage() {
	languagecount++;
	if(languagecount%2==0) {
		$("#languageTotal").hide();
		$("#languageTotal input").val('');	
		$("#languageTotal select").val('');	
	}
	else {
		$("#languageTotal").show();
	}
}
/* function addPotfolio() {
	potfoliocount++;
	if(potfoliocount%2==0) {
		$("#potfolioTotal").hide();
		$("#potfolioTotal input").val('');	
	}
	else {
		$("#potfolioTotal").show();
	}
} */
function addPreference() {
	preferencecount++;
	if(preferencecount%2==0) {
		$("#preferenceTotal").hide();
		$("#preferenceTotal input").val('');	
		$("#preferenceTotal input").prop("checked",false);
		$("#preferenceTotal select").val('');	
	}
	else {
		$("#preferenceTotal").show();
	}
}
function addLetter() {
	lettercount++;
	if(lettercount%2==0) {
		$("#letterTotal").hide();
		$("#letterTotal input").val('');	
		$("#letterTotal textarea").val('');	
	}
	else {
		$("#letterTotal").show();
	}
}
</script>