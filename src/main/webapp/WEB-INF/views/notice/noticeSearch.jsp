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
    width: 71px;
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
#detail-area{
	background: #fcfcfc;
	border: 1px solid black;
}
#detail-area h2{
	display: inline-block;
    width: 142px;
    color: #222;
    font-size: 15px;
    vertical-align: top;
    font-weight: bold;
	
}
#detail-area select, #detail-area input{
	display: inline-block;
}
#detail-area div{
	padding: 5px;
}
#detail-area hr{
	margin-top: 0;
	margin-bottom: 5px;
}
.checkbox-area{
	display:inline-block;
	font-size: 12px;
}
.checkbox-area div{
	width: 130px;
    white-space: nowrap;
}
#emp_type-area div.checkbox-area div{
	width: 100px;
}
span.add_keyword{
	width:120px;
	color:#888;
	font-size:15px;
	padding-right: 5px;
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
				<input type="text" id="searchKeyWord" maxlength="30" placeholder="검색어 입력" value="${searchKeyWord}"/>
			</div>
			<div class="bar-option area">
			
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
				<input type="checkbox" name="sal_nego" id="sal_nego" value="0" /><span style="color:#888; font-size:12px; vertical-align: text-top;">회사내규에 따름</span>
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
				<h2>자격증ㆍ어학</h2>
				<input type="text" id="detail_licence" class="form-control form-control-sm col-md-4" placeholder="자격증 또는 외국어 시험 이름을 입력하세요" />
			</div>
			<div id="major-area">
				<h2>전공</h2>
				<input type="text" id="detail_major" class="form-control form-control-sm col-md-4" placeholder="전공명을 입력하세요"/>
			</div>
			<div id="position-area">
				<h2>직급ㆍ직책</h2>
				<select id="detail_position" class="form-control form-control-sm col-md-4">
				  <option value="직급.인턴/수습">[직급]인턴/수습</option>
				  <option value="직급.사원">[직급]사원</option>
				  <option value="직급.주임">[직급]주임</option>
				  <option value="직급.계장">[직급]계장</option>
				  <option value="직급.대리">[직급]대리</option>
				  <option value="직급.과장">[직급]과장</option>
				  <option value="직급.차장">[직급]차장</option>
				  <option value="직급.부장">[직급]부장</option>
				  <option value="직급.감사">[직급]감사</option>
				  <option value="직급.이사">[직급]이사</option>
				  <option value="직급.상무">[직급]상무</option>
				  <option value="직급.전무">[직급]전무</option>
				  <option value="직급.부사장">[직급]부사장</option>
				  <option value="직급.사장">[직급]사장</option>
				  <option value="직급.회장">[직급]회장</option>
				  <option value="직급.전문직">[직급]전문직</option>
				  <option value="직급.IR 책임자">[직급]IR 책임자</option>
				  <option value="직급.연구원">[직급]연구원</option>
				  <option value="직급.주임연구원">[직급]주임연구원</option>
				  <option value="직급.선임연구원">[직급]선임연구원</option>
				  <option value="직급.책임연구원">[직급]책임연구원</option>
				  <option value="직급.수석연구원">[직급]수석연구원</option>
				  <option value="직급.연구소장">[직급]연구소장</option>
				  <option value="직급.프리랜서">[직급]프리랜서</option>
				  <option value="직급.CTO">[직급]CTO</option>
				  <option value="직급.CEO">[직급]CEO</option>
				  <option value="직급.COO">[직급]COO</option>
				  <option value="직책.팀원">[직책]팀원</option>
				  <option value="직책.총무">[직책]총무</option>
				  <option value="직책.부팀장">[직책]부팀장</option>
				  <option value="직책.실장">[직책]실장</option>
				  <option value="직책.팀장">[직책]팀장</option>
				  <option value="직책.파트장">[직책]파트장</option>
				  <option value="직책.지점장">[직책]지점장</option>
				  <option value="직책.공장장">[직책]공장장</option>
				  <option value="직책.지사장">[직책]지사장</option>
				  <option value="직책.그룹장">[직책]그룹장</option>
				  <option value="직책.센터장">[직책]센터장</option>
				  <option value="직책.본부장">[직책]본부장</option>
				  <option value="직책.사업부장">[직책]사업부장</option>
				  <option value="직책.국장">[직책]국장</option>
				  <option value="직책.원장">[직책]원장</option>
				  <option value="직책.매니저">[직책]매니저</option>
				  <option value="직책.지배인">[직책]지배인</option>
				  <option value="직책.총지배인">[직책]총지배인</option>
				  <option value="직책.고문">[직책]고문</option>
				  <option value="직책.소장">[직책]소장</option>
				  <option value="직책.관장">[직책]관장</option>
				  <option value="직책.이사장">[직책]이사장</option>
				</select>
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
			<div id="work_day">
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
					  <input class="form-check-input" type="checkbox" id="work_day_checkbox6" value="교대">
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
			<div id="welfare">
				<h2>복리후생</h2>
			</div>
			<hr />
			<div id="keyword">
				<span class="add_keyword" id="add_searchKeyword"></span>
				<span class="add_keyword" id="add_salary"></span>
				<span class="add_keyword" id="add_age"></span>
				<span class="add_keyword" id="add_gender"></span>
				<span class="add_keyword" id="add_subway"></span>
				<span class="add_keyword" id="add_licence"></span>
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

<script>
/* 상세조건 펼치기 */
$("#detail-area").hide();

$("#btn-detail-search").on("click", function(){
	$("#detail-area").toggle();
});

/* 상세조건 클릭시 #keyword에 담기 */
var searchKeyword = $("#searchKeyWord").val();
var salary = "";
var age = "";
var gender = "";
var subway = "";
var licence = "";
var major = "";
var position = "";
var preference = "";

$("#add_searchKeyword").html("검색어 > "+searchKeyword);

$("#detail_salary").on("change",function(){
	salary = $("#detail_salary").val();
	$("#add_salary").html(salary+"만 이상");
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

$("#detail_major").on("focusout", function(){
	major = $(this).val();
	$("#add_major").html(major);
});

$("#detail_position").on("change",function(){
	position = $("#detail_position").val();
	$("#add_position").html(position);
});

$("#preference-area input:checkbox").click(function() {

	$("#add_preference").html("");
	
	$("input[name=preference]:checked").each(function() {
		
		preference += $(this).val();
		console.log(preference);
		$("#add_preference").append("<span class='add_keyword'>"+$(this).val()+"</span>");

	});

});



</script>

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