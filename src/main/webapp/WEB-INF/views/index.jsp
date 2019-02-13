<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css" />

<style>
/* Make the image fully responsive */
.carousel-inner img {
  width: 100%;
  height: 250px;
}

#cal{
	text-align: center;
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
#locationKeyWord{
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
    text-align: left;
}
.bar-option img{
	position:absolute;
	width: 32px;
    height: 32px;
    top: 13px;
    left: 10px;
}
}
</style>
<div class="main-search">
	<div class="search-bar">
		<div class="bar-main">
			<div class="bar-option">
				<img src="${pageContext.request.contextPath }/resources/images/search.png" alt="" />
				<input type="text" id="searchKeyWord" maxlength="30" placeholder="검색어 입력" />
			</div>
			<div class="bar-option area">
				<input type="button" id="locationKeyWord" maxlength="30" value="지역 선택"/>
			</div>
			<button type ="button"class="bar-button">
				<span>
					검색
				</span>
			</button>
		</div>
	</div>
</div>
<div class="container">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ul class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ul>
	
	   <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath }/resources/images/la.jpg" alt="Los Angeles" >
	      <div class="carousel-caption">
	        <h3>Los Angeles</h3>
	        <p>We had such a great time in LA!</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath }/resources/images/chicago.jpg" alt="Chicago" >
	      <div class="carousel-caption">
	        <h3>Chicago</h3>
	        <p>Thank you, Chicago!</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath }/resources/images/ny.jpg" alt="New York" >
	      <div class="carousel-caption">
	        <h3>New York</h3>
	        <p>We love the Big Apple!</p>
	      </div>   
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
</div>
	
<br /><br />
	
<div id="cal">
	<iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0"
	width="890px" height="300px" scrolling="auto"></iframe>	
</div>	

<div id="job">
	<ul id ="list-open">
		<c:forEach items="${jobList }" var="map">
					<li class="open">
						<div class="content">
							<span><a href="http://www.saramin.co.kr/zf_user/jobs/relay/pop_view?rec_idx=${map.id}" target="_blank">${map.name}</a></span><br />
							<span><a href="#" onclick="moveCrwaling('${map.id}');">${map.name}</a></span><br />
							${map.title} <br />
							${map.jobType} <br />
							${map.exLevel} <br />
							${map.salary} <br />
						</div>
					</li>
		</c:forEach>	
	</ul>
</div>

<script>
function moveCrwaling(id){
	var id = id;
	console.log("id?? = ",id);
/*  	location.href="${pageContext.request.contextPath}/index/notice.ithrer?id="+id; */
	window.open("${pageContext.request.contextPath}/index/notice.ithrer?id="+id);
	
 	/* 
	$.ajax({
		url: "${pageContext.request.contextPath}/index/notice.ithrer",
		data: {id: id},
		success: function(data){
			$(".modal-body").append(data);
		},error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}				
	}); */
};
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>