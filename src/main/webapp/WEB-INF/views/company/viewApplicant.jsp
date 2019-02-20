<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
div.clearfix img:hover{
	cursor: pointer;
}
img.visible-on{
	display: inline-block;
}
img.visible-off{
	display: none;
}
</style>

<div id="applicant-info-container" class="container my-5">
	<div class="clearfix">
		<img src="${pageContext.request.contextPath }/resources/images/bookmarkoff.svg" alt="bookmark off" id="bookmarkoff" width="30px"/>
		<img src="${pageContext.request.contextPath }/resources/images/bookmarkon.svg" alt="bookmark on" id="bookmarkon" width="30px"/>
		<button class="btn btn-sm btn-primary float-right" onclick="location.href='${pageContext.request.contextPath}/company/index.ithrer?compId=${compId }'">되돌아가기</button>
	</div>
	<div id="applicant-info-container" class="container my-3 shadow rounded border border-primary">
		<div class="row">
			<div class="col-sm-4 text-center my-auto">
				<img src="${pageContext.request.contextPath }/resources/images/avatar.jpg" alt="temp image" width="150px"/>
			</div>
			<div class="col">
				<div class="row">
					<div class="col text-center">
						<h2>
							<span class="align-middle">${member.memberName }</span>
						</h2>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h6>
							<img src="${pageContext.request.contextPath }/resources/images/birth.svg" alt="birth icon" width="30px" class="mr-3"/>
							${member.birth } (${member.age }세)
						</h6>
						<h6><img src="${pageContext.request.contextPath }/resources/images/phone.svg" alt="phone icon" width="30px" class="mr-3"/> ${member.phone }</h6>
						<h6><img src="${pageContext.request.contextPath }/resources/images/address.svg" alt="address icon" width="30px" class="mr-3"/> ${member.address }</h6>
					</div>
					<div class="col">
						<h6><img src="${pageContext.request.contextPath }/resources/images/gender.svg" alt="gender icon" width="30px" class="mr-3"/> ${member.gender }</h6>
						<h6><img src="${pageContext.request.contextPath }/resources/images/email.svg" alt="email icon" width="30px" class="mr-3"/> ${member.email }</h6>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>

<script>
	// 페이지 로딩 후 관심인재 버튼 이미지 보여줄 것 정하기
	if(${member.count} == 0){
		$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
		$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
	}
	else{
		$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
		$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
	}

	// 관심인재 버튼(별모양) 클릭 이벤트
	var count = ${member.count};
	$("div.clearfix img").on("click",function(){
		
		if(count == 1){
			$.ajax({
				url: "${pageContext.request.contextPath}/company/favorite?compId=${compId}&memberId=${member.memberId}&recruitmentNo=${recruitmentNo}",
				type: "delete",
				success: function(data){
					var newCount = data.newCount;
					count = data.newCount;
					
					if(newCount == 0){
						$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
						$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
					}
					else{
						$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
						$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
					}
				},
				error: function(){
					console.log("관심인재 삭제 ajax error!");
				}
			});
		}
		else if(count == 0){
			$.ajax({
				url: "${pageContext.request.contextPath}/company/favorite?compId=${compId}&memberId=${member.memberId}&recruitmentNo=${recruitmentNo}",
				type: "post",
				success: function(data){
					var newCount = data.newCount;
					count = data.newCount;
					
					if(newCount == 0){
						$("img#bookmarkon").removeClass("visible-on").addClass("visible-off");
						$("img#bookmarkoff").removeClass("visible-off").addClass("visible-on");
					}
					else{
						$("img#bookmarkon").removeClass("visible-off").addClass("visible-on");
						$("img#bookmarkoff").removeClass("visible-on").addClass("visible-off");
					}
				},
				error: function(){
					console.log("관심인재 추가 ajax error!");
				}
			});
		}
	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>