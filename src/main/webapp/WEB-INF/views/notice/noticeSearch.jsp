<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeSearch.css" />
<script src="${pageContext.request.contextPath }/resources/js/location.js"></script>


<script>
/* 상세조건 펼치기 */

$(function(){
	$("#detail-area").hide();
	
	$("#btn-detail-search").on("click", function(){
		$("#detail-area").toggle();
	});
});

var salary = "";
var age = "";
var gender = "";
var subway = "";
var licence = "";
var language = "";
var major = new Array();
var position = new Array();
var preference = new Array();
var emp_type = new Array();
var work_day = new Array();
var welfare = new Array();

$(function(){
	
/* 상세조건 클릭시 #keyword에 담기 */
var searchKeyword = $("#searchKeyWord").val();

$("#add_searchKeyword").html("검색어 > "+searchKeyword);

$("#detail_salary").on("change",function(){
	salary = $("#detail_salary").val();
	$("#add_salary").html(salary+"만 이상");
});

$("input:checkbox[name=sal_nego]").click(function(){
	if($(this).prop('checked')){
		salary="회사내규에따름";
		$("#detail_salary").prop("disabled", true);
		$("#add_salary").html(salary);		
	}else{
		salary="";
		$("#detail_salary").prop("disabled", false);
		$("#add_salary").html("");
	}
});


$("#detail_age").on("focusout", function(){
	age = $(this).val();
	$("#add_age").html(age+"세");
});

$('input:radio[name=gender]').on("click", function(){
	gender = $('input:radio[name=gender]:checked').val();
	var genderShow = "";
	if(gender == "M"){
		genderShow = "남자";
	}else if(gender == "F"){
		genderShow = "여자";
	}else{
		genderShow = "무관";
	}
	
	$("#add_gender").html(genderShow);
})

$("#detail_subway").on("focusout", function(){
	subway = $(this).val();
	$("#add_subway").html(subway);
});

$("#detail_licence").on("focusout", function(){
	licence = $(this).val();
	$("#add_licence").html(licence);
});

$("#detail_language").on("change",function(){
	language = $("#detail_language").val();
	$("#add_language").html(language);
});

//$("input[name=major]").on("focusout", function(){
$(document).on("focusout","input[name=major]",function(){
	//동적으로 생성되는 부분에도 이벤트핸들러를 등록하기 위해서는 document에 이벤트를 담는다.	
	
	if(major.indexOf($(this).val()) == -1 && $(this).val()!=""){
		
		major.push($(this).val());
	}
	
	$("#add_major").html("");

	for(var i = 0; i < major.length; i++){
		
		$("#add_major").append("<span class='add_keyword'>"+major[i]+"</span>");
		
	}
	//아무것도 선택 안할 시에 배열 제거
	if(major.length == 0){
		major='';
	}
});

//$("#detail_position").on("change",function(){
$(document).on("change","select[name=position]",function(){	
	
	if(position.indexOf($(this).val()) == -1 && $(this).val()!=""){
		position = new Array();
		position.push($(this).val());
	}
	console.log("position:",position);
	$("#add_position").html("");
	for(var i = 0; i < position.length; i++){		
		$("#add_position").append("<span class='add_keyword'>"+position[i]+"</span>");		
	}
	
});

$("#preference-area input:checkbox").click(function() {
	
	if(preference.length>4 && preference.indexOf($(this).val()) == -1){
		alert("5개까지 체크가능해요:D");
		$(this).prop("checked", false);
		return;
	}
	if(preference.indexOf($(this).val()) == -1){
		preference.push($(this).val());		
	}else{
		preference.splice(preference.indexOf($(this).val()),1);
	}
	
	$("#add_preference").html("");
	for(var i = 0; i < preference.length; i++){
		
		$("#add_preference").append("<span class='add_keyword'>"+preference[i]+"</span>");
		
	}

});

$("#emp_type-area input:checkbox").click(function() {
	
	if(emp_type.length>2 && emp_type.indexOf($(this).val()) == -1){
		alert("3개까지 체크가능해요:D");
		$(this).prop("checked", false);
		return;
	}
	if(emp_type.indexOf($(this).val()) == -1){
		emp_type.push($(this).val());		
	}else{
		emp_type.splice(emp_type.indexOf($(this).val()),1);
	}
	
	$("#add_emp_type").html("");
	for(var i = 0; i < emp_type.length; i++){
		
		$("#add_emp_type").append("<span class='add_keyword'>"+emp_type[i]+"</span>");
		
	}

});

$("#work_day-area input:checkbox").click(function() {
	
	if(work_day.length>2 && work_day.indexOf($(this).val()) == -1){
		alert("3개까지 체크가능해요:D");
		$(this).prop("checked", false);
		return;
	}
	if(work_day.indexOf($(this).val()) == -1){
		work_day.push($(this).val());		
	}else{
		work_day.splice(work_day.indexOf($(this).val()),1);
	}
	
	$("#add_work_day").html("");
	for(var i = 0; i < work_day.length; i++){
		
		$("#add_work_day").append("<span class='add_keyword'>"+work_day[i]+"</span>");
		
	}

});

$("#welfare-area input:checkbox").click(function() {
	
	if(welfare.length>2 && welfare.indexOf($(this).val()) == -1){
		alert("3개까지 체크가능해요:D");
		$(this).prop("checked", false);
		return;
	}
	if(welfare.indexOf($(this).val()) == -1){
		welfare.push($(this).val());		
	}else{
		welfare.splice(welfare.indexOf($(this).val()),1);
	}
	
	$("#add_welfare").html("");
	for(var i = 0; i < welfare.length; i++){
		
		$("#add_welfare").append("<span class='add_keyword'>"+welfare[i]+"</span>");
		
	}

});

/* 검색을 위한 함수 */
$("#btn-search-notice").on("click", function(){
	var searchKeyWord = $("#searchKeyWord").val();
	var locationCode = $(".hiddenLocationCode").val();
	
	console.log("searchKeyWord = ", searchKeyWord);
	console.log("locationCode = ", locationCode);
	
	console.log("salary = ",salary);
	console.log("age = ",age);
	console.log("gender = ",gender);
	console.log("subway = ",subway);
	console.log("licence = ",licence);
	console.log("language = ",language);
	console.log("major = ",major);
	console.log("position = ",position);
	console.log("preference = ",preference);
	console.log("emp_type = ",emp_type);
	console.log("work_day = ",work_day);
	console.log("welfare = ", welfare);
	
	location.href = "${pageContext.request.contextPath}/searchNotice.ithrer?searchKeyWord="+searchKeyWord+"&location="+locationCode
				  + "&salary="+salary+ "&age="+age + "&gender="+gender + "&subway="+subway + "&licence="+licence + "&language="+language +"&major="+major
				  + "&position="+position+ "&preference="+preference+ "&emp_type="+emp_type+ "&work_day="+work_day+"&welfare="+welfare;
	
});



	

})//onload끝

/* 리스트에 마감시간을 표시하기 위한 함수 */
function timestamp(time){
	var timeStamp = time*1000;
		
	var dt = new Date(timeStamp);
    
    document.writeln(" ~"+dt.getFullYear()+"/"+(dt.getMonth()+1)+"/"+dt.getDate());
			
}


/* 추가버튼과 삭제 버튼을 눌렀을 때 실행되는 함수 */
function add_line(event, check){
	//클릭시 발생하는 이벤트를 가져와 타겟과 parent를 찾아 영역으 변수에 담기
	var ect = event.currentTarget.parentElement;
	
	//어디에서 넘어온 이벤트인지 check를 통해 검사하고  3개이상 추가하지 못하게 제어
	if(check == 1 && $(".major_add_del").length > 2){
		alert("3개까지 추가 가능합니다!");
		return;
	}else if(check == 2 && $(".position_add_del").length > 2){
		alert("3개까지 추가 가능합니다!");
		return;
	}else{
		//console.log("ect부모", ect);
		//console.log(ect.innerHTML);
		//console.log(ect.outerHTML)
		
		//ect가 가진 영역을 outerHTML을 통해 string으로 만들어 추가
		$(ect).parent().append(ect.outerHTML);
	
	}
}
function del_line(event, check){
	var ect = event.currentTarget.parentElement;
	
	//console.log($(".major_add_del").length);
	
	if($(".major_add_del").length < 2 && check==1){
		$("#detail_major").val([]);
		major.splice(major.indexOf($(ect).children("input").val()),1);
		$("#add_major").text("");
	}else if($(".position_add_del").length < 2 && check==2){		
		$("#detail_position").val([]);
		$("#detail_position option:eq(0)").prop('selected', true);
		position.splice(position.indexOf($(ect).children("input").val()),1);
		$("#add_position").text("");
	}else if(check==1){		
		//console.log("ect부모", ect);
		major.splice(major.indexOf($(ect).children("input").val()),1);
		
		//표시부분 지우게 구현
		$("#add_major").html("");
		for(var i = 0; i < major.length; i++){			
			$("#add_major").append("<span class='add_keyword'>"+major[i]+"</span>");			
		}
		
		$(ect).remove();		
	}else if(check==2){
		position.splice(position.indexOf($(ect).children("select").val()),1);
		//표시부분 지우게 구현해야함
		$("#add_position").html("");
		for(var i = 0; i < position.length; i++){		
			$("#add_position").append("<span class='add_keyword'>"+position[i]+"</span>");		
		}
		
		$(ect).remove();
	}
};




</script>

<!-- 검색바 부분 -->
<div class="main-search">
      <div class="search-bar">
         <div class="bar-main">
            <div class="bar-option">
               <input type="text" id="searchKeyWord" maxlength="30" placeholder="검색어 입력" value="${searchKeyWord}"/>
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
			<button class="bar-button" id="btn-detail-search"><span>상세조회</span></button>
			<button type ="button"class="bar-button" id="btn-search-notice" style="left: 913px;">
				<span>
					검색
				</span>
			</button>
		</div>
		<div id="detail-area" class="container" style="z-index: 10">
			<div id="salary-area">
				<h2>연봉</h2>
				<select id="detail_salary" class="form-control form-control-sm col-md-4">
				  <option value=1400>1400만원 이상</option>
				  <option value=1600>1600만원 이상</option>
				  <option value=1800>1800만원 이상</option>
				  <option value=2000>2000만원 이상</option>
				  <option value=2200>2200만원 이상</option>
				  <option value=2400>2400만원 이상</option>
				  <option value=2600>2600만원 이상</option>
				  <option value=2800>2800만원 이상</option>
				  <option value=3000>3000만원 이상</option>
				  <option value=3200>3200만원 이상</option>
				  <option value=3400>3400만원 이상</option>
				  <option value=3600>3600만원 이상</option>
				  <option value=3800>3800만원 이상</option>
				  <option value=4000>4000만원 이상</option>
				  <option value=5000>5000만원 이상</option>
				  <option value=6000>6000만원 이상</option>
				  <option value=7000>7000만원 이상</option>
				  <option value=8000>8000만원 이상</option>
				  <option value=9000>9000만원 이상</option>
				  <option value=10000>1억원 이상</option>
				</select>
				<input type="checkbox" name="sal_nego" id="sal_nego" value="0" /><label for="sal_nego"><span style="color:#888; font-size:12px; vertical-align: text-top;">회사내규에 따름</span></label> 
			</div>
			<div id="age-area" >
				<h2>나이</h2>
				<input type="number" name="detail_age" id="detail_age" min="18" class="form-control form-control-sm col-md-4"/>
			</div>
			<div id="gender-area" >
				<h2>성별</h2>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="gender" id="gender1" value="M">
				  <label class="form-check-label" for="gender1">남자</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="gender" id="gender2" value="F">
				  <label class="form-check-label" for="gender2">여자</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="gender" id="gender3" value="0">
				  <label class="form-check-label" for="gender3">무관</label>
				</div>
			</div>
			<hr />
			<div id="subway-area">
				<h2>지하철</h2>
				<input type="text" id="detail_subway" class="form-control form-control-sm col-md-4" placeholder="지하철 역명을 입력하세요"/>
			</div>
			<hr />
			<div id="licence-area">
				<h2>자격증</h2>
				<input type="text" id="detail_licence" class="form-control form-control-sm col-md-4" placeholder="자격증 이름을 입력하세요" />				
			</div>
			<div id="language-area">
				<h2>우대 외국어</h2>
				<select class="form-control form-control-sm col-md-4" id="detail_language">
                     <option name="fore-lang1" value="" selected disabled hidden>선택</option>
                     <option name="fore-lang2" value="영어">영어</option>
                     <option name="fore-lang3" value="일본어">일본어</option>
                     <option name="fore-lang4" value="중국어">중국어</option>
                 </select>				
			</div>
			<hr />
			<div id="major-area">
				<h2>전공</h2>
				<div class="major_add_del">
					<input type="text" id="detail_major" name="major" class="form-control form-control-sm col-md-4" placeholder="전공명을 입력하세요"/>
					<button id="btn_add_major" class="btn_add_minus btn btn-outline-dark" onclick="add_line(event,1);"><i class="far fa-plus-square"></i></button>
					<button id="btn_minus_major" class="btn_add_minus btn btn-outline-dark" onclick="del_line(event,1);"><i class="far fa-minus-square"></i></button>
				</div>
			</div>
			<div id="position-area">
				<h2>직급ㆍ직책</h2>
				<div class="position_add_del">
					<select id="detail_position" name="position" class="form-control form-control-sm col-md-4">
					  <option value="" selected disabled hidden>선택</option>
					  <option value="인턴/수습">[직급]인턴/수습</option>
					  <option value="사원">[직급]사원</option>
					  <option value="주임">[직급]주임</option>
					  <option value="계장">[직급]계장</option>
					  <option value="대리">[직급]대리</option>
					  <option value="과장">[직급]과장</option>
					  <option value="차장">[직급]차장</option>
					  <option value="부장">[직급]부장</option>
					  <option value="감사">[직급]감사</option>
					  <option value="이사">[직급]이사</option>
					  <option value="상무">[직급]상무</option>
					  <option value="전무">[직급]전무</option>
					  <option value="부사장">[직급]부사장</option>
					  <option value="사장">[직급]사장</option>
					  <option value="회장">[직급]회장</option>
					  <option value="전문직">[직급]전문직</option>
					  <option value="IR 책임자">[직급]IR 책임자</option>
					  <option value="연구원">[직급]연구원</option>
					  <option value="주임연구원">[직급]주임연구원</option>
					  <option value="선임연구원">[직급]선임연구원</option>
					  <option value="책임연구원">[직급]책임연구원</option>
					  <option value="수석연구원">[직급]수석연구원</option>
					  <option value="연구소장">[직급]연구소장</option>
					  <option value="프리랜서">[직급]프리랜서</option>
					  <option value="CTO">[직급]CTO</option>
					  <option value="CEO">[직급]CEO</option>
					  <option value="COO">[직급]COO</option>
					  <option value="팀원">[직책]팀원</option>
					  <option value="총무">[직책]총무</option>
					  <option value="부팀장">[직책]부팀장</option>
					  <option value="실장">[직책]실장</option>
					  <option value="팀장">[직책]팀장</option>
					  <option value="파트장">[직책]파트장</option>
					  <option value="지점장">[직책]지점장</option>
					  <option value="공장장">[직책]공장장</option>
					  <option value="지사장">[직책]지사장</option>
					  <option value="그룹장">[직책]그룹장</option>
					  <option value="센터장">[직책]센터장</option>
					  <option value="본부장">[직책]본부장</option>
					  <option value="사업부장">[직책]사업부장</option>
					  <option value="국장">[직책]국장</option>
					  <option value="원장">[직책]원장</option>
					  <option value="매니저">[직책]매니저</option>
					  <option value="지배인">[직책]지배인</option>
					  <option value="총지배인">[직책]총지배인</option>
					  <option value="고문">[직책]고문</option>
					  <option value="소장">[직책]소장</option>
					  <option value="관장">[직책]관장</option>
					  <option value="이사장">[직책]이사장</option>
					</select>
					<button id="btn_add_position" class="btn btn-outline-dark btn_add_minus" onclick="add_line(event,2);"><i class="far fa-plus-square"></i></button>
					<button id="btn_minus_position" class="btn_add_minus btn btn-outline-dark" onclick="del_line(event,2);"><i class="far fa-minus-square"></i></button>
				</div>
			</div>
			
	
		
			<div id="preference-area">
				<h2>우대조건</h2>
				<div class="checkbox-area">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox1" name="preference" value="국가유공자">
					  <label class="form-check-label" for="pre_checkbox1">국가유공자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox2" name="preference" value="보훈대상자">
					  <label class="form-check-label" for="pre_checkbox2">보훈대상자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox3" name="preference" value="취업보호대상자">
					  <label class="form-check-label" for="pre_checkbox3">취업보호대상자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox4" name="preference" value="고용촉진장려금대상자">
					  <label class="form-check-label" for="pre_checkbox4">고용촉진장려금대상자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox5" name="preference" value="장애인">
					  <label class="form-check-label" for="pre_checkbox5">장애인</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox6" name="preference" value="외국인">
					  <label class="form-check-label" for="pre_checkbox6">외국인</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox7" name="preference" value="실버인력">
					  <label class="form-check-label" for="pre_checkbox7">실버인력</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox8" name="preference" value="군전역간부">
					  <label class="form-check-label" for="pre_checkbox8">군전역간부</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox9" name="preference" value="병역특례자">
					  <label class="form-check-label" for="pre_checkbox9">병역특례자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox10" name="preference" value="해당직무인턴경험">
					  <label class="form-check-label" for="pre_checkbox10">해당직무인턴경험</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox11" name="preference" value="통계분석전문가">
					  <label class="form-check-label" for="pre_checkbox11">통계분석전문가</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox12" name="preference" value="PT전문가">
					  <label class="form-check-label" for="pre_checkbox12">PT전문가</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox13" name="preference" value="인근거주자">
					  <label class="form-check-label" for="pre_checkbox13">인근거주자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox14" name="preference" value="차량소지자">
					  <label class="form-check-label" for="pre_checkbox14">차량소지자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox15" name="preference" value="운전가능자">
					  <label class="form-check-label" for="pre_checkbox15">운전가능자</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox16" name="preference" value="병역필 또는 면제자">
					  <label class="form-check-label" for="pre_checkbox16">병역필 또는 면제자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox17" name="preference" value="해외여행에 결격사유가 없는자">
					  <label class="form-check-label" for="pre_checkbox17">해외여행 무결격자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox18" name="preference" value="봉사활동경험">
					  <label class="form-check-label" for="pre_checkbox18">봉사활동경험</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox19" name="preference" value="수상경력자">
					  <label class="form-check-label" for="pre_checkbox19">수상경력자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox20" name="preference" value="학점우수자">
					  <label class="form-check-label" for="pre_checkbox20">학점우수자</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox21" name="preference" value="MBS">
					  <label class="form-check-label" for="pre_checkbox21">MBS</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox22" name="preference" value="외국학위소지자">
					  <label class="form-check-label" for="pre_checkbox22">외국학위소지자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox23" name="preference" value="신용정보에 결격사유가 없는자">
					  <label class="form-check-label" for="pre_checkbox23">신용정보 무결격자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox24" name="preference" value="석박사">
					  <label class="form-check-label" for="pre_checkbox24">석박사</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pre_checkbox25" name="preference" value="주부">
					  <label class="form-check-label" for="pre_checkbox25">주부</label>
					</div>
					<br />		
				</div>
				
			</div>
			<hr />
			<div id="emp_type-area">
				<h2>고용형태</h2>
				<div class="checkbox-area">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="emp_type_checkbox1" value="정규직">
					  <label class="form-check-label" for="emp_type_checkbox1">정규직</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="emp_type_checkbox2" value="계약직">
					  <label class="form-check-label" for="emp_type_checkbox2">계약직</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="emp_type_checkbox3" value="병역특례">
					  <label class="form-check-label" for="emp_type_checkbox3">병역특례</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="emp_type_checkbox4" value="인턴">
					  <label class="form-check-label" for="emp_type_checkbox4">인턴</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="emp_type_checkbox5" value="프리랜서">
					  <label class="form-check-label" for="emp_type_checkbox5">프리랜서</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="emp_type_checkbox6" value="알바">
					  <label class="form-check-label" for="emp_type_checkbox6">알바</label>
					</div>
				</div>
			</div>
			<hr />
			<div id="work_day-area">
				<h2>근무요일</h2>
				<div class="checkbox-area">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox1" value="주 5일">
					  <label class="form-check-label" for="work_day_checkbox1">주 5일</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox2" value="토요일 격주휴무">
					  <label class="form-check-label" for="work_day_checkbox2">토요일 격주휴무</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox3" value="주 6일">
					  <label class="form-check-label" for="work_day_checkbox3">주 6일</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox4" value="주 3일(격일제)">
					  <label class="form-check-label" for="work_day_checkbox4">주 3일(격일제)</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox5" value="탄력적근무제">
					  <label class="form-check-label" for="work_day_checkbox5">탄력적근무제</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox6" value="2교대">
					  <label class="form-check-label" for="work_day_checkbox6">2교대</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox7" value="3교대">
					  <label class="form-check-label" for="work_day_checkbox7">3교대</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox8" value="4교대">
					  <label class="form-check-label" for="work_day_checkbox8">4교대</label>
					</div>
				</div>
			</div>
			<hr />
			<div id="welfare-area">
				<h2>복리후생</h2>
				<div class="checkbox-area">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox1" value="4대 보험">
					  <label class="form-check-label" for="welfare_checkbox1">4대 보험</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox2" value="식대지원">
					  <label class="form-check-label" for="welfare_checkbox2">식대지원</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox3" value="구내식당">
					  <label class="form-check-label" for="welfare_checkbox3">구내식당</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox4" value="통근버스">
					  <label class="form-check-label" for="welfare_checkbox4">통근버스</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox5" value="기숙사">
					  <label class="form-check-label" for="welfare_checkbox5">기숙사</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox6" value="주차장제공">
					  <label class="form-check-label" for="welfare_checkbox6">주차장제공</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox7" value="장애인 복지">
					  <label class="form-check-label" for="welfare_checkbox7">장애인 복지</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox8" value="자기계발지원">
					  <label class="form-check-label" for="welfare_checkbox8">자기계발지원</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox9" value="워크샵">
					  <label class="form-check-label" for="welfare_checkbox9">워크샵</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox10" value="문화생활비">
					  <label class="form-check-label" for="welfare_checkbox10">문화생활비</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox11" value="직무능력향상교육 ">
					  <label class="form-check-label" for="welfare_checkbox11">직무능력향상교육 </label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox12" value="도서구입비지원 ">
					  <label class="form-check-label" for="welfare_checkbox12">도서구입비지원 </label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox13" value="인센티브">
					  <label class="form-check-label" for="welfare_checkbox13">인센티브</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox14" value="우수사원포상">
					  <label class="form-check-label" for="welfare_checkbox14">우수사원포상</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox15" value="장기근속포상">
					  <label class="form-check-label" for="welfare_checkbox15">장기근속포상</label>
					</div>
					<br />
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox16" value="명절선물">
					  <label class="form-check-label" for="welfare_checkbox16">명절선물</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox17" value="장기보너스">
					  <label class="form-check-label" for="welfare_checkbox17">장기보너스</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="welfare_checkbox18" value="상해보험">
					  <label class="form-check-label" for="welfare_checkbox18">상해보험</label>
					</div>
				</div>
			</div>
			<hr />
			<div id="keyword">
				<span class="add_keyword" id="add_searchKeyword"></span>
				<span class="add_keyword" id="add_salary"></span>
				<span class="add_keyword" id="add_age"></span>
				<span class="add_keyword" id="add_gender"></span>
				<span class="add_keyword" id="add_subway"></span>
				<span class="add_keyword" id="add_licence"></span>
				<span class="add_keyword" id="add_language"></span>
				<span class="add_keyword" id="add_major"></span>
				<span class="add_keyword" id="add_position"></span>
				<span class="add_keyword" id="add_preference"></span>
				<span class="add_keyword" id="add_emp_type"></span>
				<span class="add_keyword" id="add_work_day"></span>
				<span class="add_keyword" id="add_welfare"></span>
			</div>
		</div>
	</div>
</div>



<!-- 검색 부분 -->
<div id="noticeSearch-container">
	<br /><br />
	<div><h3><span id="resultKeyWord">#${searchKeyWord}</span>의 검색결과</h3></div><br />
	<!-- ithrer 검색 부분 -->
	<h3><span style="color:blue;"><img src="${pageContext.request.contextPath}/resources/images/ITHRerLogo.png" style="width: 190px;height: 100px;"></span> 검색결과</h3><br />
	<div>${ithrerTotalContents}건의 검색 결과</div><br />
	<ui class="list-group">
		<c:forEach items="${ithrerList}" var="job">
		<li class="list-group-item list-group-item-action">
			<div><a href="${pageContext.request.contextPath}/index/ithrerNotice.ithrer?no=${job.RECRUITMENT_NO}">${job.COMP_NAME}</a></div>
			<p class="detail1"><span>${job.RECRUITMENT_TITLE}</span><span class="badge badge-danger" style="width:82px; overflow: hidden;">~${job.CLOSING_DATE}</span></p>
			<p class="detail2"><span>${job.CAREER}</span><span>${job.EDUCATION}</span><span>${job.EMPLOYMENT_TYPE}</span><span>${job.LOCATION}</span></p>
		</li>
		</c:forEach>
	</ui>
	<!-- 페이징 바 부분 -->
	<div class="page-bar">
	<br /><br />
		${ithrerPageBar}
	</div>
	
	
	<hr style='background-color:black;'/><br />
	<!-- 사람인 api 부분 -->
	<h3><span style="color:skyblue;"><img src="${pageContext.request.contextPath}/resources/images/saramin_logo.png" style="width: 200px;vertical-align: baseline;"> api</span> 검색결과</h3><br />
	<div>${totlaContents}건의 검색 결과</div><br />
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
	<div class="page-bar">
	<br /><br />
		${pageBar}
	</div>
	<input type="hidden" class="hiddenLocationCode" />
</div>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>