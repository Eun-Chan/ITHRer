<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
#chargedService-container{
	width: 1000px;
    margin: 0 auto;
}
</style>

<script>
$(function(){
	$("[name=upFile]").on('change', function(){
		//var fileName = $(this).val();
		console.log($(this));
		var fileName = $(this).prop("files")[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
});
</script>
<div id="chargedService-container">
	<br /><br />
	<div id="charged-guide">
		<h2><span style="color:red">유료배너</span> 관리</h2>
	</div>
	<br /><br />
	
	<form action="${pageContext.request.contextPath}/fileUpload.ithrer?directory='images/banner'" method="post" enctype="multipart/form-data">
		<div id="charged-company">
		
			<c:forEach items="${chargedList}" var="one"  varStatus="index">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="charged" id="${index.count}" value= ${one.CS_NO}>
				  <label class="form-check-label" for="${index.count}">${one.COMP_NAME}</label> <br />
				</div>		
			</c:forEach>
		
		</div>
		
		<br /><br />
		<h3 style="display:'inline'; color:skyblue;">배너등록 : </h3>
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
		<input type="submit" class="btn btn-outline-success" value="저장" >
	</form>
		
	<div id="display">
		
		<img id="profileImg" class="img-fluid"	src="${pageContext.request.contextPath}/displayFile.ithrer?fileName=/2019/02/27/21395dd5-142a-4764-ad38-4886fe021f5a_jm.jpg&directory=banner">
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>