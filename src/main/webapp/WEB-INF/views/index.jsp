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
  height: 500px;
}

#cal{
	text-align: center;
}
</style>

<div class="container">
  <h2>Carousel Example</h2>
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
	
	location.href="${pageContext.request.contextPath}/index/notice.ithrer?id="+id;
	//window.open("'${pageContext.request.contextPath}/index/notice.ithrer?id='+id", "test", 'width=600,height=500,location=no,status=no,scrollbars=yes');
	
	/* $.ajax({
		url: "${pageContext.request.contextPath}/companyInformation.ithrer",
		data: {id: id},
		success: function(data){
			console.log(data);
		},error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}				
	}); */
};
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>