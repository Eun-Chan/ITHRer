<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
    	min-height: 500px;
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
	.recruitmemtTitle{
		cursor: pointer;
	}
</style>
<body>
	<div class ="fareMain">
		<div class="container faRe">
			<div class="row">
				<span style="font-size: 24px;">내가 지원한 공고</span>
			</div>
			<div>
				<div class="row favoriteHeader">
						<div class="col-sm-2" style="text-align: center;"><span style="font-size: 0.9em;">공고번호</span></div>
						<div class="col-sm-8" style="text-align: center;"><span style="font-size: 0.9em;">공고제목</span></div>
						<div class="col-sm-2" style="text-align: center;"><span style="font-size: 0.9em;">마감날짜</span></div>
				</div>
					<c:if test="${not empty mca}">
						<c:forEach items="${mca }" var="mac">
						<div class="row favoriteContent">
							<ul class="col-sm-2" style="text-align: center;">
								<li><span style="font-size: 0.8em;">${mac.recruitmentNo }</span></li>
							</ul>
							<ul class="col-sm-8" style="text-align: center;">
								<li><span style="font-size: 0.8em;" class="recruitmemtTitle" onclick="moveDetail('${mac.recruitmentNo}','${mac.compId }')">${mac.recruitmentTitle }</span></li>
							</ul>
							<ul class="col-sm-2" style="text-align: center;">
								<li><span style="font-size: 0.8em;">${mac.closingDate }</span></li>
							</ul>
						</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty mca }">
							<div class="row favoriteContents">
								<p>지원한 공고가 존재하지 않습니다.</p>
						</div>
					</c:if>
				</div>
					<!-- 페이징 바 부분 -->
				<div class="page-bar">
				<br /><br />
					${pageBar}
				</div>
			</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
function moveDetail(no,compId){
	   var no = no;
		var compId = compId;
	   window.open("${pageContext.request.contextPath}/index/ithrerNotice.ithrer?no="+no+"&compId="+compId);
	}
$(".recruitmemtTitle").hover(function(){
	   $(this).css("color","#ffb6c1");
		},function(){
	   		$(this).css("color","black");
		}
);

</script>