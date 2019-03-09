<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
#banner-container{
	margin: 0 auto;
	min-height: 600px;
	max-width: 1000px
}
#banner-card{
	margin: 0 auto;
	width: 600px;
}
#banner-frm-container{
    margin: 0 auto;
	text-align: center;
    width: 600px;
}
</style>

<br />
<c:if test="${!empty companyLoggedIn }">
<div id="banner-container">
	<div id="banner-card" class="card">
		<div class="card-header"><h3>배너 신청</h3></div>
		<div class="card-body">
			&nbsp;저희 <span style="color:skyblue">ITHRer</span>에서는 기업의 채용 공고를 도와드리기 위해 배너광고 Beta를 시행중입니다! <br />
			&nbsp;이미지 사이즈 <span style="color:red">1200 x 300</span>을 준비하여 아래의 양식으로 보내주시면 순차적으로 일주일 간 배너광고가 노출됩니다.
		</div>
	</div>
	
	<br /><br />
	<div id="banner-frm-container">
		<form action="" id="frm-banner" class="form" method="post" enctype="multipart/form-data">
			<div class="form-group row mb-2">
	           <label class="col-md-2 col-form-label form-control-label">회사이름</label>
	           <div class="col-md-7">
	               <input class="form-control"  id="bannerCompName" name="bannerCompName" value="${companyLoggedIn.compName}" disabled>
	           </div>
	       </div>
	       
	       <div class="form-group row mb-2">
	           <label class="col-md-2 col-form-label form-control-label">회사 계정</label>
	           <div class="col-md-7">
	               <input class="form-control"  id="bannerCompId" name="bannerCompId" value="${companyLoggedIn.compId}" disabled>
	           </div>
	       </div>
		
			<div class="form-group row mb-2">
	           <label class="col-md-2 col-form-label form-control-label">희망일</label>
	           <div class="col-md-7">
	               <input type="date" class="form-control"  id="bannerStartDate" name="bannerStartDate">
	           </div>
	       </div>
		
			<div class="form-group row mb-2">
	           <label class="col-md-2 col-form-label form-control-label">배너 등록</label>
	           <div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile" multiple>
				    <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
				  </div>
				</div>
				<input type="button" class="btn btn-outline-success" id="btn-banner-submit" value="저장" >
			  <br />
	       </div>
		
		</form>
	</div>
</div>
</c:if>

<c:if test="${empty companyLoggedIn }">
	<div id="banner-card" class="card">
		<div class="card-header"><h3>배너 신청</h3></div>
		<div class="card-body">
			현재 배너 등록 신청은 기업 회원아이디로 로그인한 회원만 가능합니다!
		</div>
	</div>
</c:if>

<script>

$("[name=upFile]").on('change', function(){
	
	//var fileName = $(this).val();
	//console.log($(this).val());
	fileName = $(this).prop("files")[0].name;
	
	//확장자가 이미지인 것들만 가능하게 막기
	var fileKind = fileName.split(".")[1];
	console.log("fileKind: ",fileKind)
	if(fileKind != "jpg" && fileKind != "gif" && fileKind != "png"){
		alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
		  document.getElementById("upFile").value = "";
		  document.getElementById("upFile").select();
		  return;
	}
	$(this).next(".custom-file-label").html(fileName);
});

$("#btn-banner-submit").on("click", function(){
	
	if($("#bannerStartDate").val() == ""){
		alert("날짜를 지정해 주세요!");
		return;
	}
	if($("#upFile")[0].files[0] == null){
		alert("파일을 선택해 주세요!");
		return;
	}
	
	var form = $("#frm-banner")[0];
	var formData = new FormData(form);
	formData.append("upFile", $("#upFile")[0].files[0]);
	formData.append("compId",$("#bannerCompId").val());
	formData.append("compName",$("#bannerCompName").val());
	formData.append("bannerStartDate",$("#bannerStartDate").val());
	formData.append("compEmail","${companyLoggedIn.compEmail}");
			
	$.ajax({
		url: "${pageContext.request.contextPath}/mailAndInsertBanner.ithrer",
		processData: false,
        contentType: false,
        data: formData, 
        type: 'POST',
        success: function(result){
            alert("업로드 성공!!");
        }


	});
});

</script>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>