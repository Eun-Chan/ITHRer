<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
#noticeSearch-container{
	width: 1000px;
	margin: 0 auto;
}
.main-search{
	position: relative;
	z-index: 1;
	height: 250px;
	background: #e4ebfe;
}
.search-bar{
	position: absolute;
	top: 80px;
	left: 56.8%;
	z-index: 5;
	margin-left: -600px;
	padding: 10px;
	width: 1000px;
	height: 80px;
	box-sizing: border-box;
	background: pink;
}
.bar-main{
	position: relative;
	z-index: 2;
	margin: 0 auto;
	width: 980px;
	height: 60px;
	background: #ddd;
}
.container{
	margin-top: 20px;
}
.bar-option{
	position: absolute;
    z-index: 1;
	width: 420px;
    height: 60px;;
    box-sizing: border-box;
    color: #666;
    font-size: 15px;
    letter-spacing: -1px;
    text-align: left;
    background: #fff;
}
.bar-option.area{
	left: 423px;
}
.bar-option span{
	z-index: 4;
}
.bar-button{
	position: absolute;
    left: 841px;
    z-index: 1;
    padding: 12px 0 15px;
    width: 139px;
    height: 59px;
    background: cyan;
    border: 0;
    cursor: pointer;
}
.bar-button span{
	color: #fff;
    font-size: 17px;
    font-weight: bold;
    letter-spacing: -1px;
}
#searchKeyWord{
/* 	position: relative; */
    z-index: 1;
    padding: 12px 40px 15px 49px;
    width: 100%;
    height: 60px;
    border: 0;
    box-sizing: border-box;
    color: #666;
    font-size: 17px;
    letter-spacing: -1px;
    line-height: 23px;
    background: #fff;
}
.bar-option img{
	position:absolute;
	width: 32px;
    height: 32px;
    top: 13px;
    left: 10px;
}
.detail2 span{
	padding-right: 10px;
	padding-left: 10px;
	border-right: solid 1px gray;
}
.detail2 span:last-of-type{
	border-right: none;
}
span#resultKeyWord{
	color: red;
	font-weight: bold;
}
</style>
<script>
$(function(){
	$("#btn-search-notice").on("click", function(){
		var searchKeyWord = $("#searchKeyWord").val();
		//지역검색 추가 해야함
		
		location.href = "${pageContext.request.contextPath}/searchNotice.ithrer?searchKeyWord="+searchKeyWord;
		
	});
});

function timestamp(time){
	var timeStamp = time*1000;
	console.log(parseInt(timeStamp));
	var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
	
	var dt = new Date(timeStamp);
    //document.writeln(dt.getHours() + '/' + dt.getMinutes() + '/' + dt.getSeconds() + ' -- ' + dt + '<br>');
    document.writeln(" ~"+dt.getFullYear()+"/"+(dt.getMonth()+1)+"/"+dt.getDate());
	
	
	
}


</script>
<!-- 검색바 부분 -->
<div class="main-search">
	<div class="search-bar">
		<div class="bar-main">
			<div class="bar-option">
				<img src="${pageContext.request.contextPath }/resources/images/search.png" alt="" />
				<input type="text" id="searchKeyWord" maxlength="30" placeholder="검색어 입력" />
			</div>
			<div class="bar-option area">
			
			</div>
			<button type ="button"class="bar-button" id="btn-search-notice">
				<span>
					검색
				</span>
			</button>
		</div>
	</div>
</div>


<!-- 검색 부분 -->
<div id="noticeSearch-container">
	<br /><br />
	<div><h3><span id="resultKeyWord">#${searchKeyWord}</span>의 검색결과</h3></div><br />
	<div>${totlaContents}건의 검색 결과</div>
	<br />
	<ui class="list-group">
		<c:forEach items="${jobList}" var="job">
		<li class="list-group-item list-group-item-action">
			<div><a href="${pageContext.request.contextPath}/index/notice.ithrer?id=${job.id}">${job.name}</a></div>
			<p class="detail1"><span>${job.title}</span><span class="badge badge-danger"><script>timestamp(${job.expiration})</script></span></p>
			<p class="detail2"><span>${job.exLevel}</span><span>${job.level}</span><span>${job.jobType}</span><span>${job.location}</span></p>
		</li>
		</c:forEach>
	</ui>
	
	<!-- 페이징 바 부분 -->
	<div id="page-bar">
	<br /><br />
		${pageBar}
	</div>
	
</div>
	



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>