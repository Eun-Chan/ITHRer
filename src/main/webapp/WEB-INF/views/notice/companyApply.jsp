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
<script src="http://malsup.github.com/jquery.form.js"></script>
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
	.uploadFile label 
	{
		display: inline-block; 
		padding: .5em .75em;
		 color: #999; font-size: 
		 inherit; 
		 line-height: normal; 
		 vertical-align: middle; 
		 background-color: #fdfdfd; 
		 cursor: pointer; 
		 border: 1px solid #ebebeb; 
		 border-bottom-color: #e2e2e2; 
		 border-radius: .25em;
		 float: right;
	 } 
	 .uploadFile input[type="file"] { 
		  position: absolute; 
		  width: 1px; 
		  height: 1px; 
		  padding: 0; 
		  margin: -1px;
		   overflow: hidden;
		   clip:rect(0,0,0,0); 
		   border: 0; 
	}
	.emaillabel{
		display: inline-block;
	    padding-left: 4px;
	    width: 53px;
	    font-size: 12px;
	    font-weight: normal;
	    font-family: Gulim, sans-serif;
	    color: #666;
	    vertical-align: middle;
	}

	.modal-title{
		padding: 15px 0 15px;
	    text-align: center;
	    font-size: 15px;
	    color: #333;
	    font-weight: bold;
	}
	.emailtext{
		height: 28px;
	    padding: 0 5px;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	}
	.selectDiv{
		display: inline-block;
	}
	.portfolioDiv{
		margin-top: 5px;
	}
	.update{
		float: right;
	}
</style>
<body>
	<div class="applyHeader">
		<span class="headerContent">입사지원</span>
	</div>
		<div class="applyCompanytitle">
			<span class="applyCompanyName"><img src="${pageContext.request.contextPath }/resources/images/company.svg" alt="" style="width: 30px"/>${com.compName }</span>
			<span class="applyRctitle">${rc.recruitmentTitle }</span>
		</div>
		<div class="row main">
			<div class="row content">
				<div class="col-sm-12 row1">
					<strong>지원이력서</strong>
				</div>
				<div class="col-sm-12 row2">
				<c:if test="${not empty pf.userResumeTitle }">
					<span style="font-size: 0.9em; letter-spacing: 1px;" class="pfTitle">${pf.userResumeTitle }</span>
				</c:if>
				<c:if test="${empty pf.userResumeTitle }">
					<span style="font-size: 0.9em; letter-spacing: 1px;" >이력서가 존재하지 않습니다 작성해주세요.</span>
					<input type="button" value="작성하기" class="btn btn-info" style="float: right" id="profileInsert"/>
				</c:if>
				</div>
				<div class="col-sm-12 row3">
					<span class="memberEmail">이메일 : ${pf.email }</span>
					<span class="memberPhone">전화번호 : ${pf.phone }</span>	
					<button type="button" class="btn btn-info update" data-toggle="modal" data-target="#myModal">수정</button>		
				</div>
			</div>
			<div class="row content two">
				<div class="col-sm-12 row1">
					<div class="uploadFile">
					<strong style="padding: 10px 0px 0px 5px; float: left;">포트폴리오(최대 3개까지 추가 가능)</strong>
				 	<form enctype="multipart/form-data" id="uploadForm" method="post">
							<label for="Addportfolio">파일 추가</label>
							<input type="file" name="portfolio" id="Addportfolio" accept=".ppt, .pdf"/>
 					</form>
					</div>
				</div>
				<div class="col-sm-12 row2 port">
						<c:forEach items="${portFolio }" var="port">
						<c:if test="${not empty port.url}">
							<div class="portfolioDiv">
								<span style="font-size: 0.9em; letter-spacing: 1px;" >${port.url }</span>
								<button class="btn btn-outline-danger deletePortFolio">삭제</button>
								<input type="hidden" value="${port.pfNo }" id="hiddenPfNo"/>
								<input type="hidden" value="${port.url }" id="hiddenUrl" />
							</div>
						</c:if>
						</c:forEach>	
				</div>
			</div>
			<button type="button" class="btn btn-success applybutton">지원 하기</button>	
			 <input type="hidden" name="memberId" value="${member.memberId }"/>
		     <input type="hidden" name="recruitmentNo" value="${rc.recruitmentNo }" />
		     <input type="hidden" name="compId" value="${com.compId }" />
		</div>
		<div id="myModal" class="modal">
	     <div class="modal-dialog">
	          <div class="modal-content">
	               <div class="modal-header">
	                    <h4 class="modal-title">이메일/전화번호 수정</h4>
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	               </div>
	               <div class="modal-body">
	              	 	<div style="margin-top: 20px">
		                   <span class="emaillabel">이메일</span>
		                   <input type="text" name="email1" style="width: 97px" class="emailtext"/>
		                   <input type="text" name="email2" style="width: 97px" class="emailtext"/>
		                   <div class="selectDiv">
		                   	<select name="email3" id="emailSelect" style="width: 110px;height: 28px;">
		                   		<option value="">선택하세요</option>
		                   		<option value="naver.com" selected="selected">naver.com</option>
		                   		<option value="hanmail.net">hanmail.net</option>
		                   		<option value="nate.com">nate.com</option>
		                   		<option value="daum.net">daum.net</option>
		                   		<option value="gmail.com">gmail.com</option>
		                   		<option value="dreamwiz.com">dreamwiz.com</option>
		                   		<option value="etc">직접입력</option>
		                   	</select>
		              		</div>
		                </div>
		                <div style="margin-top: 15px;" >
		                   	<span class="emaillabel" style="height: 28px;">휴대폰</span>
		                   	<select name="phone1" id="phoneSelect">
		                   		<option value="010" selected="selected">010</option>
		                   		<option value="011">011</option>
		                   		<option value="016">016</option>
		                   		<option value="017">017</option>
		                   		<option value="018">018</option>
		                   		<option value="019">019</option>
		                   	</select>
		                   <input type="text" name="phone2" style="width: 68px" class="emailtext" maxlength="4"/> -
		                   <input type="text" name="phone3" style="width: 68px" class="emailtext" maxlength="4"/>
		                </div>
		              </div>
		               <div class="modal-footer">
		               		<input type="button" value="수정하기" class="btn btn-default" id="memberUpdate" data-dismiss="modal"/>
		                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		               </div>		              
          			</div>
    		</div>
  		</div>
<script>
$(function(){
/* 	var phone1 = "${member.phone}".substr(0,3);
	var phone2 = "${member.phone}".substr(4,4);
	var phone3 = "${member.phone}".substr(9);
	var phone = phone1+"-"+phone2+"-"+phone3; */
	var email = "${member.email}".split("@");

	
	/* $(".memberPhone").append(phone); */
	$("input[name=phone2]").val(phone2);
	$("input[name=phone3]").val(phone3);
	$("input[name=email1]").val(email[0]);
	$("input[name=email2]").val(email[1]);

});

$("#profileInsert").on("click",function(){
	/* location.href="${pageContext.request.contextPath}/resume/resume"; */
	window.open('${pageContext.request.contextPath}/resume/resume','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	self.close();
});
$("#emailSelect").on("change",function(){
	console.log("아아");
	if($("#emailSelect option:selected").val()=="etc" || $("#emailSelect option:selected").val()==""){
		$("input[name=email2]").val("");
	}else{
		$("input[name=email2]").val($("#emailSelect option:selected").val());		
	}
});

$("#Addportfolio").on("change",function(){
	if($(".portfolioDiv").length == 3){
		alert("포트폴리오 추가는 3개 까지만 가능합니다.");
		return;
	}
	var formData = new FormData();
	formData.append("file",$(this)[0].files[0]);
	var div = $(".port"); 
	var html = "<div class='portfolioDiv'><span class ='portFolioName' style='font-size: 0.9em; letter-spacing: 1px; margin-right: 4px;' >"
	$.ajax({
		url:"${pageContext.request.contextPath}/index/uploadPortfolio.ithrer",
		contentType: false,
		cache: false,
		processData: false,
		data:formData,
		type:"POST",
		success:function(data){
			/* var url = JSON.parse(data).url.substr(JSON.parse(data).url.indexOf("_")+1); */
			html+=JSON.parse(data).url+"</span>";
			html+="<button class='btn btn-outline-danger'>삭제</button></div>";
			div.append(html);
		}	
	});
});

$("#memberUpdate").on("click",function(){
	var phone = $("select[name=phone1]").val()+"-"+$("input[name=phone2]").val()+"-"+$("input[name=phone3]").val();
	var email = $("input[name=email1]").val()+"@"+$("input[name=email2]").val();
	var memberId = $("input[name=memberId]").val();
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
			if(data.result==1){
				$(".memberEmail").html("이메일 :"+data.email);
				$(".memberPhone").html("전화번호 :"+data.phone);				
			}
		}
	});
});
$(".applybutton").on("click",function(){
	if(${empty pf}){
		alert("이력서를 작성해 주세요.");
		return;
	}
	var memberId =$("input[name=memberId]").val();
	var recruitmentNo = $("input[name=recruitmentNo]").val();
	var compName = $("input[name=compId]").val();
	var data = {
			memberId:memberId,
			recruitmentNo:recruitmentNo,
			compId:compId
	}
	if(confirm("정말 지원하시겠습니까?")){
		$.ajax({
			url:"${pageContext.request.contextPath}/index/resumeSubmit.ithrer",
			data:data,
			type:"POST",
			success:function(data){
				if(data==1){
					window.opener.location.reload();
					window.close();
					
				}
			}
		});
	}
	
});
$(document).on("click",".deletePortFolio",function(){
	var button = $(this);
	var pfNo = $("#hiddenPfNo").val();
	var url = $("#hiddenUrl").val();
	var data = {
			pfNo:pfNo,
			url:url
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/index/deletePortFolio.ithrer",
		data:data,
		success:function(data){
			if(data==1){
				button.parent().remove();
			}
			
		}
	})
});
</script>
</body>
</html>