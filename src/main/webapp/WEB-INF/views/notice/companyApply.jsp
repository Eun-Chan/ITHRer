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




</style>
<body>
	<div class="applyHeader">
		<span class="headerContent">입사지원</span>
	</div>
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
					<div class="uploadFile">
					<strong style="padding: 10px 0px 0px 5px; float: left;">포트폴리오</strong>
						<form enctype="multipart/form-data" id="uploadForm" method="post">
							<label for="Addportfolio">파일 추가</label>
							<input type="file" name="portfolio" id="Addportfolio" accept=".ppt, .pdf"/>
						</form>
					</div>
				</div>
				<div class="col-sm-12 row2">
					<span style="font-size: 0.9em; letter-spacing: 1px;" >포트폴리오 제목(이력서가 없다면 추가버튼 만들어야함.)</span>
				</div>
			</div>
			<button type="submit" class="btn btn-success applybutton" onclick="">지원 하기</button>	
<!-- 			<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
	            <input type="file" id="FILE_TAG" name="FILE_TAG">
	            <input type="file" id="FILE_TAG2" name="FILE_TAG2">
	            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a>
       		 </form> -->
		</div>
<script>
$(function(){
	var compName = $(".noticeCompanyName", opener.document).html();
	$(".applyCompanyName").append(compName);
	var rcContent = $(".rcContent",opener.document).html();
	$(".applyRctitle").html(rcContent);
	
});

$("#Addportfolio").on("change",function(){

	var formData = new FormData($("uploadForm"));
	formData.append("file",$(this)[0].files[0]);
	$.ajax({
		url:"${pageContext.request.contextPath}/index/uploadPortfolio.ithrer",
		contentType: false,
		cache: false,
		processData: false,
		data:formData,
		type:"POST",
		success:function(data){
			console.log("업로드 성공");
		}
		
	});
});
/* function uploadFile(){
    var form = $('#FILE_FORM')[0];
    var formData = new FormData(form);
    formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
    formData.append("fileObj2", $("#FILE_TAG2")[0].files[0]);

    $.ajax({
        url: 
        	'${pageContext.request.contextPath}/index/uploadPortfolio.ithrer',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function(data){
                    alert("업로드 성공!!");
               }
        });
}
 */


</script>
</body>
</html>