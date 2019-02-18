<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />

<style>
.main{
   width:1000px;
   margin:0 auto;
}
/* Make the image fully responsive */
.carousel-inner img {
  width: 100%;
  height: 250px;
}
#banner-container{
   width:1000px;
}
#cal{
   text-align: center;
}
.main-search{
   position: relative;
   z-index: 1;
   height: 200px;
   background: #e4ebfe;
}
.search-bar{
   position: absolute;
   top: 59px;
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
   padding: 0;
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
/*    position: relative; */
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
    white-space: nowrap;
    overflow: hidden;
}
.locationKeyWordSelected{
   display: block;
   overflow: hidden;
   width: 100%;
   height: 100%;
   letter-spacing: -1px;
   text-align: left;
   text-overflow: ellipsis;
   white-space: nowrap; 
}
.bar-option img{
   position:absolute;
   width: 32px;
    height: 32px;
    top: 13px;
    left: 10px;
}
.location-hide{
   display:none;
   width: 419px;
   position: absolute;
   margin-top:5px;
   border: 1px solid black;
   box-sizing: border-box;
   background: #fff;
}
.location-category{
   height: 230px;
}
.location-view{
   overflow: scroll;
   position: relative;
   z-index: 1;
   width: 100%;
   height:100%;
   overflow-x:hidden;
}
.location-view ul li{
   float: left;
    width: 50%;
    padding-right: 1px;
}
.location-view ul {
   list-style: none;
}
.location-view ul li button{
   padding: 8px 0 10px 20px;
    width: 100%;
    height: 35px;
    color: #888;
    font-size: 13px;
    letter-spacing: -1px;
    line-height: 17px;
    text-align: left;
    background: transparent;
    border: 0;
}
.location-view::-webkit-scrollbar {
/*     background: rgba(248,247,216,0.7); */
}
.location-hide.on{
   display:block;

}
.placeholder{
   overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2;
    padding: 16px 40px 15px 49px;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    color: #9e9e9e;
    font-size: 17px;
    letter-spacing: -1px;
    line-height: 23px;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.carousel-inner{
   width:1000px;
}
/* 세션 몸통 */

.section-content{
   position: relative;
    width: 750px;
    height: 400px;
    margin-top: 20px;
    padding: 0;
    display: inline-block;
}

</style>
   <div class="main-search">
      <div class="search-bar">
         <div class="bar-main">
            <div class="bar-option">
               <input type="text" id="searchKeyWord" maxlength="30" placeholder="검색어 입력" />
               <img src="${pageContext.request.contextPath }/resources/images/search.svg" alt=""/>
            </div>
            <div class="bar-option area">
               <img src="${pageContext.request.contextPath }/resources/images/location.svg" alt="" />
               <label for="locationKeyWord" class="placeholder">
                  지역 선택
               </label>
               <button id="locationKeyWord" class="locationKeyWord">
                  <span class="locationKeyWordSelected"></span>
               </button>
   <!--             <input type="button" value="지역 선택" id="locationKeyWord"> -->
               <div class="location-hide">
                  <div class="location-category">
                     <div class="location-view">
                        <ul>
                           <li><button value="서울" class="loc">서울</button></li>
                           <li><button value="경기" class="loc">경기</button></li>
                           <li><button value="인천" class="loc">인천</button></li>
                           <li><button value="부산" class="loc">부산</button></li>
                           <li><button value="대구" class="loc">대구</button></li>
                           <li><button value="광주" class="loc">광주</button></li>
                           <li><button value="대전" class="loc">대전</button></li>
                           <li><button value="울산" class="loc">울산</button></li>
                           <li><button value="세종" class="loc">세종</button></li>
                           <li><button value="강원" class="loc">강원</button></li>
                           <li><button value="경남" class="loc">경남</button></li>
                           <li><button value="경북" class="loc">경북</button></li>
                           <li><button value="전남" class="loc">전남</button></li>
                           <li><button value="전북" class="loc">전북</button></li>
                           <li><button value="충남" class="loc">충남</button></li>
                           <li><button value="충북" class="loc">충북</button></li>
                           <li><button value="제주" class="loc">제주</button></li>
                           <li><button value="전국" class="loc">전국</button></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <button type ="button"class="bar-button" id="btn-search-notice">
               <span>
                     검색
               </span>
            </button>
         </div>
      </div>
   </div>
      <div id="banner-container" class="container">
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
   <div class="main">
   <div class="section-header">
      <div class="section-content">
            <h3 style="text-align: center; font-weight: 900;">ITHRer 추천 공고!!</h3>
         <ul style="list-style: none; padding-left: 20px;">
            <li class="recommend-open" onclick="moveDetail('${rc.recruitmentNo}');">
               <div class="recommend-content">
                  <strong style="font-family: 'SungDongGothic', sans-serif; font-weight:900; font-size: 1.25em">${cp.compName }</strong>
                  <span class="recruitTitle">${rc.recruitmentTitle }</span>
                  <div class="endDate">D-${endTime }</div>
      <%--             ${rc.employmentType }
                  <br>
                  ${rc.typeOfOccupation} --%>
               </div>
            </li>
            <li class="recommend-open">
               <div class="recommend-content">
            
               </div>
            </li>
            <li class="recommend-open">
               <div class="recommend-content">
               
               </div>
            </li>
            <li class="recommend-open">
               <div class="recommend-content">
               
               </div>
            </li>
            <li class="recommend-open">
               <div class="recommend-content">
               
               </div>
            </li>
            <li class="recommend-open">
               <div class="recommend-content">
               
               </div>
            </li>
         </ul>
      </div>
      <div class="Ad2">
         <img src="${pageContext.request.contextPath }/resources/images/sana.jpg" alt="" style="width:200px; height:400px;"/>
      </div>   
   </div>
   <br />
   <div id="job">
      <ul id ="list-open">
         <c:forEach items="${jobList }" var="map">
                  <li class="open" onclick="moveCrwaling('${map.id}');">
                     <div class="content">
                        <strong style="font-family: 'SungDongGothic', sans-serif; font-weight:800; font-size: 1.25em">
                              ${map.name}
                        </strong>
                        <span class="recruitTitle" style="font-size: 1.0em">
                           ${map.title}                        
                        </span>
                        <div class="APiendDate">
                           D-${map.end }
                        </div>
                     </div>
                  </li>
         <script>
         </script>
         </c:forEach>   
      </ul>
   </div>
   <div id="cal">
      <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0"
      width="890px" height="300px" scrolling="auto"></iframe>   
   </div>   
</div>

<br /><br />

<script>
function moveCrwaling(id){
   var id = id;
   console.log("id?? = ",id);
   window.open("${pageContext.request.contextPath}/index/notice.ithrer?id="+id, "채용정보", "width=1200px, height=800px");
   

};
function moveDetail(no){
   var no = no;
   window.open("${pageContext.request.contextPath}/index/ithrerNotice.ithrer?no="+no);
}

$("#btn-search-notice").on("click", function(){
   var searchKeyWord = $("#searchKeyWord").val();
   //지역검색 추가 해야함
   
   location.href = "${pageContext.request.contextPath}/searchNotice.ithrer?searchKeyWord="+searchKeyWord;
});

$("#locationKeyWord").on("click",function(){
   if(!$(".location-hide").hasClass("on")){
      $(".location-hide").addClass("on");
   }
   else{
      $(".location-hide").removeClass("on");
   }
});
$("html").click(function(e){
    if(!$(e.target).hasClass("locationKeyWord")){
      if($(e.target).hasClass("loc")){
         $(".location-hide").addClass("on");
         return;
      }
      if($(e.target).hasClass("locationKeyWordSelected")){
         $(".location-hide").addClass("on");
         return;
      }
      $(".location-hide").removeClass("on");
   } 

});
$(".location-hide button").one("click",function(){
   if($(".locationKeyWordSelected").text()==""){
      $(".locationKeyWordSelected").text($(this).val());
      $(".placeholder").hide();
   }else{
      $(".locationKeyWordSelected").text($(".locationKeyWordSelected").text()+", "+$(this).val());
   }
   
});
$(".open").hover(function(){
   $(this).css("border","2px solid #ffb6c1");
},function(){
   $(this).css("border","2px solid #d6d6d6");
}
);



</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>