<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%
	if(request.getSession().getAttribute("member") == null){
		response.sendRedirect("/");
	}
%>
<style>
	.fareMain{
		width: 1000px;
		margin: 0 auto;
	}
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
		width: 100%;
    	margin: 0;
    	cursor: pointer;
	}
	.faRe{
		float: left;
		margin: 0 auto;
		width: 730px;
	}
	.fareBanner{
		float: right;
		width: 250px;
		margin-right: 15px;
	}
	.BannerHeader{
		position: relative;
	    padding: 25px 0 25px 0;
	    font-size: 18px;
	    color: #444;
	    letter-spacing: -1px;
	    font-weight: bold;
	}
	.fareBanner ul{
		list-style: none;
		padding: 0px 0px 0px 10px;
	}
	.BannerOpen{
		width: 200px;
		height: 140px;
		border: 1px solid black;
		margin-bottom: 20px;
		position: relative;
		cursor: pointer;
	}
	.star{
		position: absolute;
		bottom: 13px;
		left: 10px;
		border: 0;
	    background: white;
	}
	.content{
		overflow: hidden;
	    position: absolute;
	    top: 0;
	    left: 0;
	    padding:15px;
	    width: 100%;
	    height: 100%;
	    box-sizing: border-box;
	    background: #fff;
	}
	.endDate{
		position: absolute;
	    right: 20px;
	    bottom: 13px;
	    line-height: 15px;
	    font-size: 0.8em;
	    letter-spacing: 0;
	}
	.recruitTitle{
		display: block;
		overflow: hidden;
		max-height: 39px;
		line-height: 19px;
		text-overflow: ellipsis;
		margin-top: 5px;
		font-size: 0.7em;
		font-weight: 700;
	}
	.favoriteContents{
		display: table;
	    min-height: 350px;
	    text-align: center;
	}
	.favoriteContents p{
		display: table-cell;
	    text-align: center;
	    vertical-align: middle;
	    padding-left: 215px;
	}
</style>
<body>
<div class ="fareMain">
	<div class="container faRe">
		<div class="row">
			<span style="font-size: 24px;">스크랩 공고</span>
		</div>
		<div class="row favorite">
			<ul class="headerUl">
				<li style="float: left;"><button class="favoriteDel">삭제</button></li>
			</ul>
		</div>
		<div>
			<div class="row favoriteHeader">
				<div class="col-sm-2"><input type="checkbox" class="checkbox All"/></div>
				<div class="col-sm-8" style="text-align: center;"><span style="font-size: 0.9em;" >채용공고</span></div>
				<div class="col-sm-2" style="text-align: center;"><span style="font-size: 0.9em;">마감일</span></div>
			</div>
			<c:if test="${not empty favorites}">
				<c:forEach items="${favorites }" var="favorite">
				<div class="row favoriteContent" onclick="moveDetail('${favorite.recruitmentNo}','${favorite.compId }')">
					<ul class="col-sm-2" style="padding-left:15px;">
						<li><input type="checkbox" name="recruitmentNo" value=${favorite.recruitmentNo } class="checkbox"  /></li>
					</ul>
					<ul class="col-sm-8" style="text-align: center;">
						<li><span style="font-size: 0.8em;">${favorite.recruitmentTitle }</span></li>
					</ul>
					<ul class="col-sm-2" style="text-align: center;">
						<li><span style="font-size: 0.8em;">${favorite.closingDate }</span></li>
					</ul>
				</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty favorites }">
					<div class="row favoriteContents">
						<p>스크랩한 공고가 존재하지 않습니다.</p>
				</div>
			</c:if>
		</div>
			<!-- 페이징 바 부분 -->
		<div class="page-bar">
		<br /><br />
			${pageBar}
		</div>
	</div>
	<div class="fareBanner">
		<c:if test="${not empty favorites }">
		<h3 class="BannerHeader">
			<span>스크랩 기반 <em style="color:#ffb6c1;">ITHRer</em>&nbsp;추천공고</span>
		</h3>
		<ul>
			<c:forEach items="${rcList }" var="RecommendList"> 
				<li class="BannerOpen open">
					<div class="content" onclick="moveDetail('${RecommendList.recruitmentNo}','${RecommendList.compId }');">
	                  <strong style="font-family: 'SungDongGothic', sans-serif; font-weight:900; font-size: 1.25em">${RecommendList.compName }</strong>
	                  <span class="recruitTitle">${RecommendList.recruitmentTitle }</span>
	                  <div class="endDate">D-${RecommendList.endTime }</div>
	               </div>
	               <c:if test="${not empty member }">
	               		<c:if test="${RecommendList.favoritesCount == 1 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/yelloStar.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               		<c:if test="${RecommendList.favoritesCount ==0 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               </c:if>
	                <input type="hidden" value="${RecommendList.recruitmentNo }" class="hiddenRecruitNo" />
	            	<input type="hidden" value="${RecommendList.compId }" class="hiddenCompId" />
				</li>
			</c:forEach>
		</ul>
		</c:if>
	</div>
</div>
<script>
function moveDetail(no,compId){
	   var no = no;
		var compId = compId;
	   window.open("${pageContext.request.contextPath}/index/ithrerNotice.ithrer?no="+no+"&compId="+compId);
	}
//스크랩한 공고
$(".star").on("click",function(){
	var recNo = $(this).siblings(".hiddenRecruitNo").val();
	var compId = $(this).siblings(".hiddenCompId").val();
	 if(${empty member}){
		alert("로그인 후 이용 해 주세용");
		return;
 	}
	 else{		 
		$.ajax({
				url:"${pageContext.request.contextPath}/index/favorites.ithrer?memberId=${member.memberId}&recruitment_no="+recNo+"&compId="+compId,
				success:function(data){
					if(data == 1){
						if(recNo == $("[value="+recNo+"]").val()){
							$("[value="+recNo+"]").siblings(".star").children("img").attr("src","${pageContext.request.contextPath}/resources/images/yelloStar.svg");
							/* img.attr("src","${pageContext.request.contextPath}/resources/images/yelloStar.svg"); */
						}
					}
					else {
						if(recNo == $("[value="+recNo+"]").val()){
							$("[value="+recNo+"]").siblings(".star").children("img").attr("src","${pageContext.request.contextPath}/resources/images/star.svg");				
						}
					}
				}
		});		 
	 }
});
$(".open").hover(function(){
	   $(this).css("border","2px solid #ffb6c1");
		},function(){
	   		$(this).css("border","2px solid #d6d6d6");
		}
);
$(".All").on("click",function(){
	$(".checkbox").prop("checked",this.checked);
});
$(".checkbox").on("click",function(){
	if(!$(this).hasClass("All") && this.checked==false){
		$(".All").prop("checked",false);
	}
 	if($("input:checkbox[name=recruitmentNo]:checked").length== $("input:checkbox[name=recruitmentNo]").length){
		$(".All").prop("checked",this.checked);
	}
});

$(".favoriteDel").on("click",function(){
	console.log("아아");
    var test = "";  
    $("input:checkbox[name=recruitmentNo]:checked").each(function (index) {
    	if(index==$("input:checkbox[name=recruitmentNo]:checked").length - 1){
    		test+= $(this).val();
    	}
    	else{
    		test += $(this).val()+",";
    	}
    });
    if(confirm("해당 스크랩을 삭제하시겠습니까?")){
	   $.ajax({
		  url:"${pageContext.request.contextPath}/index/deleteFavorite.ithrer?test="+test,
		  success: function(data){
			  if(data>0){
				  location.reload();
			  }
		  }
	   });
    }
});
$(".favoriteContent").hover(function(){
	   $(this).css("border","2px solid #ffb6c1");
		},function(){
	   		$(this).css("border","none");
		}
);
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>