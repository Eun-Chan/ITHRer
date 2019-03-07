<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jobSearchDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />
<script src="${pageContext.request.contextPath }/resources/js/location.js"></script>

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
                  <div class="row location-category">
                     <div class="col-sm-6 location-view">
                        <ul>
                           <li><button value="101000" class="loc">서울</button></li>
                           <li><button value="102000" class="loc">경기</button></li>
                           <li><button value="108000" class="loc">인천</button></li>
                           <li><button value="106000" class="loc">부산</button></li>
                           <li><button value="104000" class="loc">대구</button></li>
                           <li><button value="103000" class="loc">광주</button></li>
                           <li><button value="105000" class="loc">대전</button></li>
                           <li><button value="107000" class="loc">울산</button></li>
                           <li><button value="118000" class="loc">세종</button></li>
                           <li><button value="109000" class="loc">강원</button></li>
                           <li><button value="110000" class="loc">경남</button></li>
                           <li><button value="111000" class="loc">경북</button></li>
                           <li><button value="112000" class="loc">전남</button></li>
                           <li><button value="113000" class="loc">전북</button></li>
                           <li><button value="115000" class="loc">충남</button></li>
                           <li><button value="114000" class="loc">충북</button></li>
                           <li><button value="116000" class="loc">제주</button></li>
                           <li><button value="117000" class="loc">전국</button></li>
                        </ul>
                     </div>
                     <div class="col-sm-6 location-view-detail">
                     	<!-- 서울 -->
                     	<ul class="detail seoul">
                     	<div class="deleteLocation">
                     		<button class="reset">지역 초기화</button>
                     	</div>
                     		<li>
                     			<input type="checkbox" name="101000" id="101000_1" class="loc-detail all"/>
                     			<label for="101000_1">서울전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101010" id="101000_2" class="loc-detail"/>
                     			<label for="101000_2">강남구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101020" id="101000_3" class="loc-detail"/>
                     			<label for="101000_3">강동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101030" id="101000_4" class="loc-detail"/>
                     			<label for="101000_4">강북구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101040" id="101000_5" class="loc-detail"/>
                     			<label for="101000_5">강서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101050" id="101000_6" class="loc-detail"/>
                     			<label for="101000_6">관악구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101060" id="101000_7" class="loc-detail"/>
                     			<label for="101000_7">광진구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101070" id="101000_8" class="loc-detail"/>
                     			<label for="101000_8">구로구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101080" id="101000_9" class="loc-detail"/>
                     			<label for="101000_9">금천구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101090" id="101000_10" class="loc-detail"/>
                     			<label for="101000_10">노원구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101100" id="101000_11" class="loc-detail"/>
                     			<label for="101000_11">도봉구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101110" id="101000_12" class="loc-detail"/>
                     			<label for="101000_12">동대문구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101120" id="101000_13" class="loc-detail"/>
                     			<label for="101000_13">동작구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101130" id="101000_14" class="loc-detail"/>
                     			<label for="101000_14">마포구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101140" id="101000_15" class="loc-detail"/>
                     			<label for="101000_15">서대문구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101150" id="101000_16" class="loc-detail"/>
                     			<label for="101000_16">서초구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101160" id="101000_17" class="loc-detail"/>
                     			<label for="101000_17">성동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101170" id="101000_18" class="loc-detail"/>
                     			<label for="101000_18">성북구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101180" id="101000_19" class="loc-detail"/>
                     			<label for="101000_19">송파구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101190" id="101000_20" class="loc-detail"/>
                     			<label for="101000_20">양천구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101200" id="101000_21" class="loc-detail"/>
                     			<label for="101000_21">영등포구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101210" id="101000_22" class="loc-detail"/>
                     			<label for="101000_22">용산구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101220" id="101000_23" class="loc-detail"/>
                     			<label for="101000_23">은평구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101230" id="101000_24" class="loc-detail"/>
                     			<label for="101000_24">종로구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101240" id="101000_25" class="loc-detail"/>
                     			<label for="101000_25">중구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="101250" id="101000_26" class="loc-detail"/>
                     			<label for="101000_26">중량구</label>
                     		</li>
                     	</ul>
                     	<!-- 경기도 -->
                     	<ul class="detail gyeonggi">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>
                     		<li>
                     			<input type="checkbox" name="102000" id="102000_1" class="loc-detail all"/>
                     			<label for="102000_1">경기전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102010" id="102000_2" class="loc-detail"/>
                     			<label for="102000_2">가평군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102020" id="102000_3" class="loc-detail"/>
                     			<label for="102000_3">고양시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102060" id="102000_4" class="loc-detail"/>
                     			<label for="102000_4">과천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102070" id="102000_5" class="loc-detail"/>
                     			<label for="102000_5">광명시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102080" id="102000_6" class="loc-detail"/>
                     			<label for="102000_6">광주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102090" id="102000_7" class="loc-detail"/>
                     			<label for="102000_7">구리시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102100" id="102000_8" class="loc-detail"/>
                     			<label for="102000_8">군포시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102110" id="102000_9" class="loc-detail"/>
                     			<label for="102000_9">김포시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102120" id="102000_10" class="loc-detail"/>
                     			<label for="102000_10">남양주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102130" id="102000_11" class="loc-detail"/>
                     			<label for="102000_11">동두천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102140" id="102000_12" class="loc-detail"/>
                     			<label for="102000_12">부천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102180" id="102000_13" class="loc-detail"/>
                     			<label for="102000_13">성남시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102220" id="102000_14" class="loc-detail"/>
                     			<label for="102000_14">수원시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102270" id="102000_15" class="loc-detail"/>
                     			<label for="102000_15">시흥시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102280" id="102000_16" class="loc-detail"/>
                     			<label for="102000_16">안산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102310" id="102000_17" class="loc-detail"/>
                     			<label for="102000_17">안성시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102320" id="102000_18" class="loc-detail"/>
                     			<label for="102000_18">안양시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102350" id="102000_19" class="loc-detail"/>
                     			<label for="102000_19">양주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102360" id="102000_20" class="loc-detail"/>
                     			<label for="102000_20">양평군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102370" id="102000_21" class="loc-detail"/>
                     			<label for="102000_21">여주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102380" id="102000_22" class="loc-detail"/>
                     			<label for="102000_22">연천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102390" id="102000_23" class="loc-detail"/>
                     			<label for="102000_23">오산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102400" id="102000_24" class="loc-detail"/>
                     			<label for="102000_24">용인시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102440" id="102000_25" class="loc-detail"/>
                     			<label for="102000_25">의왕시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102450" id="102000_26" class="loc-detail"/>
                     			<label for="102000_26">의정부시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102460" id="102000_27" class="loc-detail"/>
                     			<label for="102000_27">이천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102470" id="102000_28" class="loc-detail"/>
                     			<label for="102000_28">파주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102480" id="102000_29" class="loc-detail"/>
                     			<label for="102000_29">평택시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102490" id="102000_30" class="loc-detail"/>
                     			<label for="102000_30">포천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102500" id="102000_31" class="loc-detail"/>
                     			<label for="102000_31">하남시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="102510" id="102000_32" class="loc-detail"/>
                     			<label for="102000_32">화성시</label>
                     		</li>
                     	</ul>
                     	<!-- 인천 -->
                     	<ul class="detail incheon">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="108000" id="108000_1" class="loc-detail all"/>
                     			<label for="108000_1">인천전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108010" id="108000_2" class="loc-detail"/>
                     			<label for="108010_2">강화군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108020" id="108000_3" class="loc-detail"/>
                     			<label for="108020_3">계양구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108030" id="108000_4" class="loc-detail"/>
                     			<label for="108030_4">남동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108040" id="108000_5" class="loc-detail"/>
                     			<label for="108040_5">동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108050" id="108000_6" class="loc-detail"/>
                     			<label for="108050_6">미추홀구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108060" id="108000_7" class="loc-detail"/>
                     			<label for="108060_7">부평구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108070" id="108000_8" class="loc-detail"/>
                     			<label for="108070_8">서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108080" id="108000_9" class="loc-detail"/>
                     			<label for="108080_9">연수구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="108090" id="108000_10" class="loc-detail"/>
                     			<label for="108090_10">옹진군</label>
                     		<li>
                     			<input type="checkbox" name="108100" id="108000_11" class="loc-detail"/>
                     			<label for="108100_11">중구</label>
                     		</li>
                     	</ul>
                     	<!-- 부산 -->
                     	<ul class="detail busan">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                    	
                     		<li>
                     			<input type="checkbox" name="106000" id="106000_1" class="loc-detail all"/>
                     			<label for="106000_1">부산전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106010" id="106000_2" class="loc-detail"/>
                     			<label for="106000_2">강서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106020" id="106000_3" class="loc-detail"/>
                     			<label for="106000_3">금정구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106030" id="106000_4" class="loc-detail"/>
                     			<label for="106000_4">기장군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106040" id="106000_5" class="loc-detail"/>
                     			<label for="106000_5">남구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106050" id="106000_6" class="loc-detail"/>
                     			<label for="106000_6">동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106060" id="106000_7" class="loc-detail"/>
                     			<label for="106000_7">동래구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106070" id="106000_8" class="loc-detail"/>
                     			<label for="106000_8">부산진구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106080" id="106000_9" class="loc-detail"/>
                     			<label for="106000_9">북구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106090" id="106000_10" class="loc-detail"/>
                     			<label for="106000_10">사상구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106100" id="106000_11" class="loc-detail"/>
                     			<label for="106000_11">사하구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106110" id="106000_12" class="loc-detail"/>
                     			<label for="106000_12">서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106120" id="106000_13" class="loc-detail"/>
                     			<label for="106000_13">수영구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106130" id="106000_14" class="loc-detail"/>
                     			<label for="106000_14">연제구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106140" id="106000_15" class="loc-detail"/>
                     			<label for="106000_15">영도구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106150" id="106000_16" class="loc-detail"/>
                     			<label for="106000_16">중구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="106160" id="106000_17" class="loc-detail"/>
                     			<label for="106000_17">해운대구</label>
                     		</li>
                     	</ul>
                     	<!-- 대구 -->
                     	<ul class="detail daegu">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="104000" id="104000_1" class="loc-detail all"/>
                     			<label for="104000_1">대구전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104010" id="104000_2" class="loc-detail"/>
                     			<label for="104000_2">남구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104020" id="104000_3" class="loc-detail"/>
                     			<label for="104000_3">달서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104030" id="104000_4" class="loc-detail"/>
                     			<label for="104000_4">달성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104040" id="104000_5" class="loc-detail"/>
                     			<label for="104000_5">동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104050" id="104000_6" class="loc-detail"/>
                     			<label for="104000_6">북구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104060" id="104000_7" class="loc-detail"/>
                     			<label for="104000_7">서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104070" id="104000_8" class="loc-detail"/>
                     			<label for="104000_8">수성구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="104080" id="104000_9" class="loc-detail"/>
                     			<label for="104000_9">중구</label>
                     		</li>
                     	</ul>
                     	<!-- 광주 -->
                     	<ul class="detail gwangju">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="103000" id="103000_1" class="loc-detail all"/>
                     			<label for="103000_1">광주전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="103010" id="103000_2" class="loc-detail"/>
                     			<label for="103000_2">광산구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="103020" id="103000_3" class="loc-detail"/>
                     			<label for="103000_3">남구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="103030" id="103000_4" class="loc-detail"/>
                     			<label for="103000_4">동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="103040" id="103000_5" class="loc-detail"/>
                     			<label for="103000_5">북구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="103050" id="103000_6" class="loc-detail"/>
                     			<label for="103000_6">서구</label>
                     		</li>
                     	</ul>
                     	<!-- 대전 -->
                     	<ul class="detail daejeon">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="105000" id="105000_1" class="loc-detail all"/>
                     			<label for="105000_1">대전전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="105010" id="105000_2" class="loc-detail"/>
                     			<label for="105000_2">대덕구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="105020" id="105000_3" class="loc-detail"/>
                     			<label for="105000_3">동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="105030" id="105000_4" class="loc-detail"/>
                     			<label for="105000_4">서구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="105040" id="105000_5" class="loc-detail"/>
                     			<label for="105000_5">유성구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="105050" id="105000_6" class="loc-detail"/>
                     			<label for="105000_6">중구</label>
                     		</li>
                     	</ul>
                     	<!-- 울산 -->
                     	<ul class="detail ulsan">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="107000" id="107000_1" class="loc-detail all"/>
                     			<label for="107000_1">울산전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="107010" id="107000_2" class="loc-detail"/>
                     			<label for="107000_2">남구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="107020" id="107000_3" class="loc-detail"/>
                     			<label for="107000_3">동구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="107030" id="107000_4" class="loc-detail"/>
                     			<label for="107000_4">북구</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="107040" id="107000_5" class="loc-detail"/>
                     			<label for="107000_5">울주군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="107050" id="107000_6" class="loc-detail"/>
                     			<label for="107000_6">중구</label>
                     		</li>
                     	</ul>
                     	<!-- 세종 -->
                     	<ul class="detail sejong">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="118000" id="118000_1" class="loc-detail all"/>
                     			<label for="118000_1">세종특별자치시</label>
                     		</li>
                     	</ul>
                     	<!-- 강원도 -->
                     	<ul class="detail kangwon">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="109000" id="109000_1" class="loc-detail all"/>
                     			<label for="109000_1">강원전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109010" id="109000_2" class="loc-detail"/>
                     			<label for="109000_2">강릉시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109020" id="109000_3" class="loc-detail"/>
                     			<label for="109000_3">고성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109030" id="109000_4" class="loc-detail"/>
                     			<label for="109000_4">동해시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109040" id="109000_5" class="loc-detail"/>
                     			<label for="109000_5">삼척시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109050" id="109000_6" class="loc-detail"/>
                     			<label for="109000_6">속초시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109060" id="109000_7" class="loc-detail"/>
                     			<label for="109000_7">양구군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109070" id="109000_8" class="loc-detail"/>
                     			<label for="109000_8">양양군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109080" id="109000_9" class="loc-detail"/>
                     			<label for="109000_9">영월군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109090" id="109000_10" class="loc-detail"/>
                     			<label for="109000_10">원주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109100" id="109000_11" class="loc-detail"/>
                     			<label for="109000_11">인제군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109110" id="109000_12" class="loc-detail"/>
                     			<label for="109000_12">정선군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109120" id="109000_13" class="loc-detail"/>
                     			<label for="109000_13">철원군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109130" id="109000_14" class="loc-detail"/>
                     			<label for="109000_14">춘천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109140" id="109000_15" class="loc-detail"/>
                     			<label for="109000_15">태백시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109150" id="109000_16" class="loc-detail"/>
                     			<label for="109000_16">평창군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109160" id="109000_17" class="loc-detail"/>
                     			<label for="109000_17">홍천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109170" id="109000_18" class="loc-detail"/>
                     			<label for="109000_18">화천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="109180" id="109000_19" class="loc-detail"/>
                     			<label for="102000_19">횡성군</label>
                     		</li>
                     	</ul>
                     	<!-- 경남 -->
                     	<ul class="detail gyeongnam">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="110000" id="110000_1" class="loc-detail all"/>
                     			<label for="110000_1">경남전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110010" id="110000_2" class="loc-detail"/>
                     			<label for="110000_2">거제시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110020" id="110000_3" class="loc-detail"/>
                     			<label for="110000_3">거창군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110030" id="110000_4" class="loc-detail"/>
                     			<label for="110000_4">고성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110040" id="110000_5" class="loc-detail"/>
                     			<label for="110000_5">김해시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110050" id="110000_6" class="loc-detail"/>
                     			<label for="110000_6">남해군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110070" id="110000_7" class="loc-detail"/>
                     			<label for="110000_7">밀양시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110080" id="110000_8" class="loc-detail"/>
                     			<label for="110000_8">사천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110090" id="110000_9" class="loc-detail"/>
                     			<label for="110000_9">산청군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110100" id="110000_10" class="loc-detail"/>
                     			<label for="110000_10">양산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110110" id="110000_11" class="loc-detail"/>
                     			<label for="110000_11">의령군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110120" id="110000_12" class="loc-detail"/>
                     			<label for="110000_12">진주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110140" id="110000_13" class="loc-detail"/>
                     			<label for="110000_13">창년군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110150" id="110000_14" class="loc-detail"/>
                     			<label for="110000_14">창원시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110160" id="110000_15" class="loc-detail"/>
                     			<label for="110000_15">통영시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110170" id="110000_16" class="loc-detail"/>
                     			<label for="110000_16">하동군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110180" id="110000_17" class="loc-detail"/>
                     			<label for="110000_17">함안군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110190" id="110000_18" class="loc-detail"/>
                     			<label for="110000_18">함양군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="110200" id="110000_19" class="loc-detail"/>
                     			<label for="110000_19">합천군</label>
                     		</li>
                     	</ul>
                     	<!-- 경북 -->
                     	<ul class="detail gyeongbuk">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="111000" id="111000_1" class="loc-detail all"/>
                     			<label for="111000_1">경북전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111010" id="111000_2" class="loc-detail"/>
                     			<label for="111000_2">경산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111020" id="111000_3" class="loc-detail"/>
                     			<label for="111000_3">경주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111030" id="111000_4" class="loc-detail"/>
                     			<label for="111000_4">고령군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111040" id="111000_5" class="loc-detail"/>
                     			<label for="111000_5">구미시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111050" id="111000_6" class="loc-detail"/>
                     			<label for="111000_6">군위군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111060" id="111000_7" class="loc-detail"/>
                     			<label for="111000_7">김천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111070" id="111000_8" class="loc-detail"/>
                     			<label for="111000_8">문경시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111080" id="111000_9" class="loc-detail"/>
                     			<label for="111000_9">봉화군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111090" id="111000_10" class="loc-detail"/>
                     			<label for="111000_10">상주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111100" id="111000_11" class="loc-detail"/>
                     			<label for="111000_11">성주군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111110" id="111000_12" class="loc-detail"/>
                     			<label for="111000_12">안동시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111120" id="111000_13" class="loc-detail"/>
                     			<label for="111000_13">영덕군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111130" id="111000_14" class="loc-detail"/>
                     			<label for="111000_14">영양군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111140" id="111000_15" class="loc-detail"/>
                     			<label for="111000_15">영주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111150" id="111000_16" class="loc-detail"/>
                     			<label for="111000_16">영천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111160" id="111000_17" class="loc-detail"/>
                     			<label for="111000_17">예천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111170" id="111000_18" class="loc-detail"/>
                     			<label for="111000_18">울릉군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111180" id="111000_19" class="loc-detail"/>
                     			<label for="111000_19">울진군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111190" id="111000_20" class="loc-detail"/>
                     			<label for="111000_20">의성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111200" id="111000_21" class="loc-detail"/>
                     			<label for="111000_21">청도군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111210" id="111000_22" class="loc-detail"/>
                     			<label for="111000_22">청송군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111220" id="111000_23" class="loc-detail"/>
                     			<label for="111000_23">칠곡군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="111230" id="111000_24" class="loc-detail"/>
                     			<label for="111000_24">포항시</label>
                     		</li>
                     	</ul>
                     	<!-- 전남 -->
                     	<ul class="detail chonnam">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="112000" id="112000_1" class="loc-detail all"/>
                     			<label for="112000_1">전남전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112010" id="112000_2" class="loc-detail"/>
                     			<label for="112000_2">강진군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112020" id="112000_3" class="loc-detail"/>
                     			<label for="112000_3">고흥군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112030" id="112000_4" class="loc-detail"/>
                     			<label for="112000_4">곡성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112040" id="112000_5" class="loc-detail"/>
                     			<label for="112000_5">광양시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112050" id="112000_6" class="loc-detail"/>
                     			<label for="112000_6">구례군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112060" id="112000_7" class="loc-detail"/>
                     			<label for="112000_7">나주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112070" id="112000_8" class="loc-detail"/>
                     			<label for="112000_8">담양군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112080" id="112000_9" class="loc-detail"/>
                     			<label for="112000_9">목포시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112090" id="112000_10" class="loc-detail"/>
                     			<label for="112000_10">무안군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112100" id="112000_11" class="loc-detail"/>
                     			<label for="112000_11">보성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112110" id="112000_12" class="loc-detail"/>
                     			<label for="112000_12">순천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112120" id="112000_13" class="loc-detail"/>
                     			<label for="112000_13">신안군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112130" id="112000_14" class="loc-detail"/>
                     			<label for="112000_14">여수시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112140" id="112000_15" class="loc-detail"/>
                     			<label for="112000_15">영광군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112150" id="112000_16" class="loc-detail"/>
                     			<label for="112000_16">영암군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112160" id="112000_17" class="loc-detail"/>
                     			<label for="112000_17">완도군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112170" id="112000_18" class="loc-detail"/>
                     			<label for="112000_18">장성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112180" id="112000_19" class="loc-detail"/>
                     			<label for="112000_19">장흥군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112190" id="112000_20" class="loc-detail"/>
                     			<label for="112000_20">진도군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112200" id="112000_21" class="loc-detail"/>
                     			<label for="112000_21">함평군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112210" id="112000_22" class="loc-detail"/>
                     			<label for="112000_22">해남군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="112220" id="112000_23" class="loc-detail"/>
                     			<label for="112000_23">화순군</label>
                     		</li>
                     	</ul>
                     	<!-- 전북 -->
                     	<ul class="detail chonbuk">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="113000" id="113000_1" class="loc-detail all"/>
                     			<label for="113000_1">전북전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113010" id="113000_2" class="loc-detail"/>
                     			<label for="113000_2">고창군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113020" id="113000_3" class="loc-detail"/>
                     			<label for="113000_3">군산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113030" id="113000_4" class="loc-detail"/>
                     			<label for="113000_4">김제시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113040" id="113000_5" class="loc-detail"/>
                     			<label for="113000_5">남원시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113050" id="113000_6" class="loc-detail"/>
                     			<label for="113000_6">무주군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113060" id="113000_7" class="loc-detail"/>
                     			<label for="113000_7">부안군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113070" id="113000_8" class="loc-detail"/>
                     			<label for="113000_8">순창군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113080" id="113000_9" class="loc-detail"/>
                     			<label for="113000_9">완주군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113090" id="113000_10" class="loc-detail"/>
                     			<label for="113000_10">익산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113100" id="113000_11" class="loc-detail"/>
                     			<label for="113000_11">임실군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113110" id="113000_12" class="loc-detail"/>
                     			<label for="113000_12">장수군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113120" id="113000_13" class="loc-detail"/>
                     			<label for="113000_13">전주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113150" id="113000_14" class="loc-detail"/>
                     			<label for="113000_14">정읍시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="113160" id="113000_15" class="loc-detail"/>
                     			<label for="113000_15">진안군</label>
                     		</li>
                     	</ul>
                     	<!-- 충남 -->
                     	<ul class="detail chungnam">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="115000" id="115000_1" class="loc-detail all"/>
                     			<label for="115000_1">충남전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115010" id="115000_2" class="loc-detail"/>
                     			<label for="115000_2">계룡시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115020" id="115000_3" class="loc-detail"/>
                     			<label for="115000_3">공주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115030" id="115000_4" class="loc-detail"/>
                     			<label for="115000_4">금산군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115040" id="115000_5" class="loc-detail"/>
                     			<label for="115000_5">논산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115050" id="115000_6" class="loc-detail"/>
                     			<label for="115000_6">당진시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115060" id="115000_7" class="loc-detail"/>
                     			<label for="115000_7">보령시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115070" id="115000_8" class="loc-detail"/>
                     			<label for="115000_8">부여군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115080" id="115000_9" class="loc-detail"/>
                     			<label for="115000_9">서산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115090" id="115000_10" class="loc-detail"/>
                     			<label for="115000_10">서천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115100" id="115000_11" class="loc-detail"/>
                     			<label for="115000_11">아산시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115110" id="115000_12" class="loc-detail"/>
                     			<label for="115000_12">연기군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115120" id="115000_13" class="loc-detail"/>
                     			<label for="115000_13">예산군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115130" id="115000_14" class="loc-detail"/>
                     			<label for="115000_14">천안시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115140" id="115000_15" class="loc-detail"/>
                     			<label for="115000_15">청양군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115150" id="115000_16" class="loc-detail"/>
                     			<label for="115000_16">태안군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="115160" id="115000_17" class="loc-detail"/>
                     			<label for="115000_17">홍성군</label>
                     		</li>
                     	</ul>
                     	<!-- 충북 -->
                     	<ul class="detail chungbuk">
                     		<div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div> 
                     		<li>
                     			<input type="checkbox" name="114000" id="114000_1" class="loc-detail all"/>
                     			<label for="114000_1">충북전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114010" id="114000_2" class="loc-detail"/>
                     			<label for="114000_2">괴산군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114020" id="114000_3" class="loc-detail"/>
                     			<label for="114000_3">단양군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114030" id="114000_4" class="loc-detail"/>
                     			<label for="114000_4">보은군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114040" id="114000_5" class="loc-detail"/>
                     			<label for="114000_5">영동군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114050" id="114000_6" class="loc-detail"/>
                     			<label for="114000_6">옥천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114060" id="114000_7" class="loc-detail"/>
                     			<label for="114000_7">음성군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114070" id="114000_8" class="loc-detail"/>
                     			<label for="114000_8">제천시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114080" id="114000_9" class="loc-detail"/>
                     			<label for="114000_9">증평군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114090" id="114000_10" class="loc-detail"/>
                     			<label for="114000_10">진천군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114100" id="114000_11" class="loc-detail"/>
                     			<label for="114000_11">청원군</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114110" id="114000_12" class="loc-detail"/>
                     			<label for="114000_12">청주시</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="114140" id="114000_13" class="loc-detail"/>
                     			<label for="114000_13">충주시</label>
                     		</li>
                     	</ul>
                     	<!-- 제주 -->
                     	<ul class="detail jeju">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="116000" id="116000_1" class="loc-detail all"/>
                     			<label for="116000_1">제주전체</label>
                     		</li>
                     		<li>
                     			<input type="checkbox" name="116030" id="116000_2" class="loc-detail"/>
                     			<label for="116000_2">서귀포시</label>
                     		</li>
                     	</ul>
                     	<!-- 전국 -->
                     	<ul class="detail jongok">
                     	    <div class="deleteLocation">
                     			<button class="reset">지역 초기화</button>
                     		</div>                     	
                     		<li>
                     			<input type="checkbox" name="117000" id="117000_1" class="loc-detail all"/>
                     			<label for="117000_1">전국</label>
                     		</li>
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
   
   <!-- 배너 광고 영역 -->
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
          	<a href="${pageContext.request.contextPath}/insertBanner.ithrer">
            	<img src="${pageContext.request.contextPath}/displayFile.ithrer?fileName=/공지사항.png&directory=banner" >
            <div class="carousel-caption">
               <h3>배너신청</h3>
              <p>클릭시 배너페이지 이동</p>
            </div>   
            </a>
          </div>
          <c:forEach items="${bannerList}" var="banner">
	          <div class="carousel-item">
	          	<a href="${pageContext.request.contextPath}/searchNotice.ithrer?searchKeyWord=${banner.COMP_NAME}&location=">
	            	<img src="${pageContext.request.contextPath}/displayFile.ithrer?fileName=${banner.CS_FILE_NAME}&directory=banner" >
	            </a>
	            <div class="carousel-caption">
	            
	            </div>   
	          </div>
          
          </c:forEach>   
          </div>
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
        </div>
      </div>
   </div>
   <div class="main">
   <div class="section-header">
      <div class="section-content">
         <h3 style="text-align: center; font-weight: 900;">ITHRer 추천 공고!!</h3>
	     <ul class="nav nav-tabs" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#lately">최근 공고</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#popularity">TOP6</a>
		    </li>
  		</ul>
  		<div class="tab-content">
	         <ul style="list-style: none; padding-left: 20px;" id="lately" class="container tab-pane active">
	         <c:forEach items="${rc }" var="list">
	            <li class="recommend-open" >
	               <div class="recommend-content" onclick="moveDetail('${list.recruitmentNo}');">
	                  <strong style="font-family: 'SungDongGothic', sans-serif; font-weight:900; font-size: 1.25em">${list.compName }</strong>
	                  <span class="recruitTitle">${list.recruitmentTitle }</span>
	                  <div class="endDate">D-${list.endTime }</div>
	                  <input type="button" value="즉시지원" class="applyButton"/>
	               </div>
	               <c:if test="${empty member }">
	               		<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               </c:if>
	               <c:if test="${not empty member }">
	               		<c:if test="${list.favoritesCount == 1 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/yelloStar.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               		<c:if test="${list.favoritesCount == 0 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               </c:if>
	            	<input type="hidden" value="${list.recruitmentNo }" class="hiddenRecruitNo" />
	            	<input type="hidden" value="${list.compId }" class="hiddenCompId" />
	            	<input type="hidden" value="${list.applyCount }" class="hiddenApplyCount"/>
	            </li>
	         </c:forEach>   
	         </ul>
	         
	         <ul style="list-style: none; padding-left: 20px;" id="popularity" class="container tab-pane fade">
	          <c:forEach items="${topRc }" var="toplist">
	            <li class="recommend-open" >
	               <div class="recommend-content" onclick="moveDetail('${toplist.recruitmentNo}');">
	                  <strong style="font-family: 'SungDongGothic', sans-serif; font-weight:900; font-size: 1.25em">${toplist.compName }</strong>
	                  <span class="recruitTitle">${toplist.recruitmentTitle }</span>
	                  <div class="endDate">D-${toplist.endTime }</div>
	                  <input type="button" value="즉시지원" class="applyButton"/>
	               </div>
	               <c:if test="${empty member }">
	               		<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               </c:if>
	               <c:if test="${not empty member }">
	               		<c:if test="${toplist.favoritesCount == 1 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/yelloStar.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               		<c:if test="${toplist.favoritesCount ==0 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               </c:if>
	               <input type="hidden" value="${toplist.recruitmentNo }" class="hiddenRecruitNo" />
	            	<input type="hidden" value="${toplist.compId }" class="hiddenCompId" />
	            	<input type="hidden" value="${toplist.applyCount }" class="hiddenApplyCount"/>
	            </li>
	            </c:forEach>
	         </ul>
         </div>
      </div>
      <div class="Ad2">
         <img src="${pageContext.request.contextPath }/resources/images/sana.jpg" alt="" style="width:200px; height:400px;"/>
      </div>   
   </div>
   <br />
   <div id="job">
   <fieldset>
   <legend><img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="" width="200px"/></legend>
      <ul id ="list-open">
         <c:forEach items="${rcList }" var="recuritmentlist">
	            <li class="open" >
	               <div class="content" onclick="moveDetail('${recuritmentlist.recruitmentNo}');">
	                  <strong style="font-family: 'SungDongGothic', sans-serif; font-weight:900; font-size: 1.25em">${recuritmentlist.compName }</strong>
	                  <span class="recruitTitle">${recuritmentlist.recruitmentTitle }</span>
	                  <div class="endDate">D-${recuritmentlist.endTime }</div>
	               </div>
	               <c:if test="${empty member }">
	               		<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               </c:if>
	               <c:if test="${not empty member }">
	               		<c:if test="${recuritmentlist.favoritesCount == 1 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/yelloStar.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               		<c:if test="${recuritmentlist.favoritesCount ==0 }">
	               			<button class="star"><img src="${pageContext.request.contextPath }/resources/images/star.svg" alt="" style="width: 20px;"></button>
	               		</c:if>
	               </c:if>
	                <input type="hidden" value="${recuritmentlist.recruitmentNo }" class="hiddenRecruitNo" />
	            	<input type="hidden" value="${recuritmentlist.compId }" class="hiddenCompId" />
	            </li>
	            </c:forEach>
      </ul>
   </fieldset>
   </div>
   <div id="job">
   <fieldset>
   <legend><img src="${pageContext.request.contextPath }/resources/images/saramin_logo.png" alt="" width="200px"/></legend>
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
         </c:forEach>   
      </ul>
   </fieldset>
   </div>
   <div id="cal">
      <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0"
      width="890px" height="300px" scrolling="auto"></iframe>   
   </div>   
</div>
<input type="hidden" class="hiddenLocationCode" />
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
   var locationCode = $(".hiddenLocationCode").val();
   
   
   location.href = "${pageContext.request.contextPath}/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+locationCode;
   $(".loc-detail").prop("checked",false);
});


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
							console.log("여긴?");
							$("[value="+recNo+"]").siblings(".star").children("img").attr("src","${pageContext.request.contextPath}/resources/images/star.svg");				
						}
					}
				}
		});		 
	 }
});
$(".applyButton").on("click",function(e){
	var recNo = $(this).parent().siblings(".hiddenRecruitNo").val();
	var hiddenApplyCount = $(this).parent().siblings(".hiddenApplyCount").val();
	e.stopPropagation();
	 if(${empty member}){
			alert("로그인 후 이용 해 주세용");
			return;
	 } if(hiddenApplyCount==1){
		 alert("해당회사에 지원한 이력이 존재합니다.");
		 return;
	 }
/* 	 if("${count}"==1){
		 alert("해당회사에 지원한 이력이 존재합니다.");
		 return;
	 } */
	 window.open("${pageContext.request.contextPath}/notice/companyApply.ithrer?recruitmentNo="+recNo,"apply","width=570, height=600, resizable = no, scrollbars = no");
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>