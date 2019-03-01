<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
/* 공통 */
div#company-info-container.container{
	width: 1000px;
}
div.title{
	font-size: 1.5em;
}
span.title{
	font-size: 1em;
}
div[id$=-container]{
	margin-top: 40px;
	margin-bottom: 40px; 
}
.visible-on-block{
	display: block;
}
.visible-on-inline-block{
	display: inline-block;
}
.visible-off{
	display: none;
}

/* border 두께 설정 */
div.border-top.border-bottom{
	border-width: 4px !important;
}

</style>


<div id="company-info-container" class="container">

	<div id="company-info-container" class="rounded border-primary border-top border-bottom py-3">
		<div class="text-center mb-3">
			<div class="title py-2 font-weight-bold text-primary">기업 정보</div>
		</div>
		
		<form id="company-info-form">
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="compId">아이디</label>
						<input type="text" class="form-control" id="compId" name="compId" value="${ companyMap.company.compId }" readonly>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="licenseNo">사업자번호</label>
						<input type="text" class="form-control" id="licenseNo" name="licenseNo" value="${ companyMap.company.licenseNo }" readonly>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<label for="">로고</label>
					
					<div class="custom-file">
						<input type="file" name="logo" class="custom-file-input" id="logo">
						<label class="custom-file-label" for="customFile"></label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="compName">기업명</label>
						<input type="text" class="form-control" id="compName" name="compName" value="${ companyMap.company.compName }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="representive">대표자명</label>
						<input type="text" class="form-control" id="representive" name="representive" value="${ companyMap.company.representive }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="bussinessScale">기업규모</label>
						<input type="text" class="form-control" id="bussinessScale" name="bussinessScale" value="${ companyMap.company.bussinessScale }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="listed">상장여부</label>
						<select id="listed" name="listed" class="custom-select">
							<option value="Y" ${companyMap.company.listed=="Y"?"selected":"" }>상장</option>
							<option value="N" ${companyMap.company.listed=="N"?"selected":"" }>비상장</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="category">업종</label>
						<input type="text" class="form-control" id="category" name="category" value="${ companyMap.company.category }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="mainBussiness">주요 사업내용</label>
						<input type="text" class="form-control" id="mainBussiness" name="mainBussiness" value="${ companyMap.company.mainBussiness }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="dateOfEstablishment">설립일</label><br />
						<input type="date" name="dateOfEstablishment" id="" value="${ companyMap.company.doe }"/>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="personnel">직원수</label>
						<input type="text" class="form-control" id="personnel" name="personnel" value="${ companyMap.company.personnel }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="location">대표 주소</label>
						<input type="text" class="form-control" id="location" name="location" value="${ companyMap.company.location }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="homepage">홈페이지</label>
						<input type="text" class="form-control" id="homepage" name="homepage" value="${ companyMap.company.homepage }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="phone">대표 전화번호</label>
						<input type="text" class="form-control" id="phone" name="phone" value="${ companyMap.company.phone }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="fax">팩스</label>
						<input type="text" class="form-control" id="fax" name="fax" value="${ companyMap.company.fax }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="introduction">회사 소개</label>
						<input type="text" name="introduction" id="introduction" class="form-control" value="${companyMap.company.introduction }" />
						
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="classification">기업구분</label>
						<input type="text" name="classification" id="classification" class="form-control" value="${companyMap.company.classification }" />
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="capital">자본금</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">₩</span>
							</div>
	 						<input type="text" class="form-control" id="capital" name="capital" onkeyup="inputNumberFormat(this)" value="${ companyMap.company.capital }">
						</div>
					</div>
				</div>
			</div>
			
			<div class="text-center">
				<button type="button" id="company-info-submit" class="btn btn-outline-success">수정</button>
				<button type="button" id="company-info-reset" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>
	
	
	<div id="sales-info-container">
		<span class="title badge badge-dark">매출액</span>
		<button id="insert-sales-modal-btn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#insertSalesModal"><strong>+</strong></button>
		
		<div class="row">
			<div class="col">연도</div>
			<div class="col">매출</div>
			<div class="col-sm-2"></div>
		</div>
		<c:forEach var="sales" items="${companyMap.salesList }" varStatus="vs">
		<form id="sales-info-form${vs.count}">
			<input type="hidden" name="compId" value=${companyMap.company.compId } />
			<div class="row">
				<div class="col">
					<div class="form-group">
						<input type="text" class="form-control form-control-sm" id="year${vs.count}" name="year" value="${ sales.year }" readonly>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<div class="input-group input-group-sm">
							<div class="input-group-prepend">
								<span class="input-group-text">₩</span>
							</div>
							<input type="text" class="form-control" id="sales${vs.count}" name="sales" onkeyup="inputNumberFormat(this)" value="${ sales.sales }">
						</div>
					</div>
				</div>
				<div class="col-sm-2 text-center">
					<button type="button" class="btn btn-outline-success btn-sm update-sales-btn">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm delete-sales-btn">삭제</button>
				</div>
			</div>
		</form>
		</c:forEach>
	</div>
	
	
	
	<div id="location-info-container">
		<span class="title badge badge-dark">위치</span>
		
		<button id="insert-location-modal-btn" class="btn btn-primary btn-sm"><strong>+</strong></button>
		<div class="row">
			<div class="col">위치 이름</div>
			<div class="col">주소</div>
			<div class="col"></div>
			<div class="col-sm-2"></div>
		</div>
		<c:forEach var="location" items="${companyMap.locationList }" varStatus="vs">
			<form id="location-info-form${vs.count}">
				<input type="hidden" name="compId" value=${companyMap.company.compId } />
				<input type="hidden" name="no" value=${location.no } />
				<div class="row">
					<div class="col">
						<div class="form-group">
							<select id="location-name${vs.count}" name="name" class="custom-select form-control-sm">
								<option value="0" ${location.name=="0"?"selected":"" }>본사</option>
								<option value="1" ${location.name=="1"?"selected":"" }>지사</option>
								<option value="2" ${location.name=="2"?"selected":"" }>연구소</option>
								<option value="3" ${location.name=="3"?"selected":"" }>해외지사</option>
								<option value="4" ${location.name=="4"?"selected":"" }>공장</option>
								<option value="5" ${location.name=="5"?"selected":"" }>기타</option>
							</select>
							<input type="text" class="form-control form-control-sm visible-off" id="etc${vs.count}" name="etc" value="${location.etc }">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="address${vs.count}" name="address" value="${ location.address }" placeholder="클릭: 주소 검색">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="addAddress${vs.count}" name="addAddress" value="${ location.addAddress }" placeholder="지번, 호수 등">
						</div>
					</div>
							
					<div class="col-sm-2 text-center">
						<button type="button" class="btn btn-outline-success btn-sm update-location-btn">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm delete-location-btn">삭제</button>
					</div>
				</div>
			</form>
		</c:forEach>
	</div>
	
	
	<div id="hrmanager-info-container">
		<span id="var-status" class="title badge badge-dark">인사담당자 정보 (인원: <span id="hrmanagerSize">${companyMap.hrManagerList.size()}</span>/3)</span>
		
		<button id="insert-hrmanager-modal-btn" class="btn btn-primary btn-sm visible-on-inline-block" data-toggle="modal" data-target="#insertHrManagerModal"><strong>+</strong></button>
		
		<div class="row">
			<div class="col-sm-1">no.</div>
			<div class="col">이름</div>
			<div class="col">부서</div>
			<div class="col">직급</div>
			<div class="col">휴대폰</div>
			<div class="col">이메일</div>
			<div class="col-sm-2"></div>
		</div>		
		<c:forEach var="i" begin="1" end="3" >
			<form id="hrmanager-info-form${i}" class="visible-off">
				<input type="hidden" id="compId${i}" name="compId" value="${companyMap.company.compId}"/>
				<input type="hidden" id="hiddenNo${i}" name="no"/>
				<div class="row">
					<div class="col-sm-1">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="no${i}" value="${i}" readonly>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="name${i}" name="name">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="department${i}" name="department">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="position${i}" name="position">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="phone${i}" name="phone">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<input type="text" class="form-control form-control-sm" id="email${i}" name="email">
						</div>
					</div>
					<div class="col-sm-2 text-center">
						<button type="button" id="update-hrmanager-btn${i}" class="btn btn-outline-success btn-sm">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm delete-hrmanager-btn">삭제</button>
					</div>
				</div>
			</form>
		</c:forEach>
	</div>
	
	
	
	<!-- insertHrManagerModal -->
	<div class="modal fade" id="insertHrManagerModal">
    	<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
	      
		        <!-- Modal Header -->
		        <div class="modal-header">
		        	<h4 class="modal-title">인사담당자 등록</h4>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		        	<form id="insert-hrmanager-form">
		        	<input type="hidden" name="compId" value="${companyMap.company.compId }" />
					<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="nameModal">이름</label>
							<input type="text" class="form-control form-control-sm" id="nameModal" name="name">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="departmentModal">부서</label>
							<input type="text" class="form-control form-control-sm" id="departmentModal" name="department">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="positionModal">직급</label>
							<input type="text" class="form-control form-control-sm" id="positionModal" name="position">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="phoneModal">휴대폰</label>
							<input type="text" id="phoneModal" class="form-control form-control-sm" name="phone" value="" placeholder="010-0000-0000"/>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="emailModal">이메일</label>
							<input type="text" name="email" class="form-control form-control-sm" id="emailModal" placeholder="abc@abc.com"/>
						</div>
					</div>
					</div>
				</form>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		        	<button id="insert-hrmanager-btn" type="button" class="btn btn-outline-success" data-dismiss="modal">저장</button>
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
	        
			</div>
		</div>
	</div>
	<!-- insertSalesModal -->
	<div class="modal fade" id="insertSalesModal">
    	<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
	      
		        <!-- Modal Header -->
		        <div class="modal-header">
		        	<h4 class="modal-title">매출액 등록</h4>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		        	<form id="insert-sales-form">
		        	<input type="hidden" name="compId" value="${companyMap.company.compId }" />
					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="yearModal">연도</label>
								<input type="text" class="form-control form-control-sm" id="yearModal" name="year" placeholder="ex) 2019">
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="salesModal">매출액</label>
								<input type="text" class="form-control form-control-sm" id="salesModal" onkeyup="inputNumberFormat(this)" name="sales" placeholder="단위: 원">
							</div>
						</div>
					</div>
				</form>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		        	<button id="insert-sales-btn" type="button" class="btn btn-outline-success" data-dismiss="modal">저장</button>
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
	        
			</div>
		</div>
	</div>
	

	
</div>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>


/* 페이지 로딩 후 데이터에 따라서 뷰단 조정 */
$(function(){
	/* 인사담당자 추가 버튼 보이기/안보이기*/
	if(${companyMap.hrManagerList.size()} == 3){
		$("#insert-hrmanager-modal-btn").removeClass("visible-on-block").addClass("visible-off");
	}
	
	/* 인사담당자 form start */
	for(var i=1; i<=${companyMap.hrManagerList.size()}; i++){
		
		// 코드 중복을 피하고 싶다... 방법을 알려줘
		if(i == 1){
			$("#hrmanager-info-form1 #hiddenNo1").val("${companyMap.hrManagerList[0].no}");
			$("#hrmanager-info-form1 #name1").val("${companyMap.hrManagerList[0].name}");
			$("#hrmanager-info-form1 #department1").val("${companyMap.hrManagerList[0].department}");
			$("#hrmanager-info-form1 #position1").val("${companyMap.hrManagerList[0].position}");
			$("#hrmanager-info-form1 #phone1").val("${companyMap.hrManagerList[0].phone}");
			$("#hrmanager-info-form1 #email1").val("${companyMap.hrManagerList[0].email}");
		}
		else if(i == 2){
			$("#hrmanager-info-form2 #hiddenNo2").val("${companyMap.hrManagerList[1].no}");
			$("#hrmanager-info-form2 #name2").val("${companyMap.hrManagerList[1].name}");
			$("#hrmanager-info-form2 #department2").val("${companyMap.hrManagerList[1].department}");
			$("#hrmanager-info-form2 #position2").val("${companyMap.hrManagerList[1].position}");
			$("#hrmanager-info-form2 #phone2").val("${companyMap.hrManagerList[1].phone}");
			$("#hrmanager-info-form2 #email2").val("${companyMap.hrManagerList[1].email}");
		}
		else if(i == 3){
			$("#hrmanager-info-form3 #hiddenNo3").val("${companyMap.hrManagerList[2].no}");
			$("#hrmanager-info-form3 #name3").val("${companyMap.hrManagerList[2].name}");
			$("#hrmanager-info-form3 #department3").val("${companyMap.hrManagerList[2].department}");
			$("#hrmanager-info-form3 #position3").val("${companyMap.hrManagerList[2].position}");
			$("#hrmanager-info-form3 #phone3").val("${companyMap.hrManagerList[2].phone}");
			$("#hrmanager-info-form3 #email3").val("${companyMap.hrManagerList[2].email}");
		}
		
		var $form = $("form#hrmanager-info-form"+i);
		
		
		
		$form.removeClass("visible-off");
		$form.addClass("visible-on-block");
	}
	/* end */
	
	/* 위치 옵션 기타일 경우 입력칸 보이게 하기 */
	$("#location-info-container").find("option:selected[value=5]").parent().siblings("[name=etc]").removeClass("visible-off").addClass("visible");

});


/* form 제출 validate 함수 */

//comma 자동으로 찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}



/* 기업정보 수정 버튼 */
$("#company-info-submit").on("click",function(){
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/info?"+$("#company-info-form").serialize(),
		type: "put",
		success: function(data){
			alert(data.msg);
		},
		error: function(){
			console.log("기업정보 수정 ajax error!");
		}
	});
	
});

/* 기업정보 초기화 버튼 */
$("#company-info-reset").on("click",function(){
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/info?compId="+"${companyMap.company.compId}",
		type: "get",
		success: function(data){
			
			$("#compName").val(data.company.compName);
			$("#representive").val(data.company.representive);
			$("#dateOfEstablishment").val(data.company.doe);
			$("#category").val(data.company.category);
			$("#mainBussiness").val(data.company.mainBussiness);
			$("#classification").val(data.company.classification);
			$("#capital").val(data.company.capital);
			$("#listed").val(data.company.listed);
			$("#introduction").val(data.company.introduction);
			$("#personnel").val(data.company.personnel);
			$("#phone").val(data.company.phone);
			$("#fax").val(data.company.fax);
			$("#homepage").val(data.company.homepage);
			$("#bussinessScale").val(data.company.bussinessScale);
			$("#location").val(data.company.location);
			
		},
		error: function(){
			console.log("기업정보 수정 초기화 ajax error!");
		}
	});
	
});

/* 매출액 추가 버튼 */
$("#insert-sales-btn").on("click",function(){

	var $yearModalVal = $("#yearModal").val();
	
	
	var isExist = false;
	
	for(var i=0; i<$("[id*=year]").length-1; i++){
		if($yearModalVal == $("[id*=year]").eq(i).val())
			isExist = true;
	}
	
	if(isExist) {
		alert("추가하신 연도가 이미 존재합니다.");
		return;
	}

	$.ajax({
		url: "${pageContext.request.contextPath}/company/sales",
		type: "post",
		data: $("#insert-sales-form").serialize(),
		success: function(data){
			alert(data.msg);
			
			var $length = $("[id*=year]").length;
			
			$("[id*=sales-info-form]").remove();
			
			for(var i=0; i<$length; i++){
				var year = data.salesList[i].year;
				var sales = data.salesList[i].sales;
				
				var html = '<form id="sales-info-form"'+(i+1)+'>';
				html += '<input type="hidden" name="compId" value=${companyMap.company.compId } />';
				html += '<div class="row">';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<input type="text" class="form-control form-control-sm" id="year'+(i+1)+'" name="year" value="'+year+'" readonly>';
				html += '</div>';
				html += '</div>';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<div class="input-group input-group-sm">';
				html += '<div class="input-group-prepend">';
				html += '<span class="input-group-text">₩</span>';
				html += '</div>';
				html += '<input type="text" class="form-control" id="sales'+(i+1)+'" name="sales" onkeyup="inputNumberFormat(this)" value="'+sales+'">';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<div class="col-sm-2 text-center">'
				html += '<button type="button" class="btn btn-outline-success btn-sm update-sales-btn">수정</button> ';
				html += '<button type="button" class="btn btn-outline-danger btn-sm delete-sales-btn">삭제</button>';
				html += '</div></div></form>';
				$("#sales-info-container").append(html);
			}
			
			$("#insert-sales-form")[0].reset();
			
		},
		error: function(){
			console.log("매출액 추가 ajax error!");
		}
	});
	
	
});


/* 매출액 수정 */
$(".update-sales-btn").on("click",function(){
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/sales?"+$(this).parents("form").serialize(),
		type: "put",
		success: function(data){
			alert(data.msg);
		},
		error: function(){
			console.log("매출액 수정 ajax error!");
		}
	});
	
});

/* 매출액 삭제 버튼 */
$(document).on("click",".delete-sales-btn",function(){
	
	if(!confirm("정말로 삭제하시겠습니까?")) return;
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/sales?"+$(this).parents("form").serialize(),
		type: "delete",
		success: function(data){
			alert(data.msg);
			
			var $length = $("[id*=year]").length-2;
			if($length < 1) $length = 1;
			
			$("[id*=sales-info-form]").remove();
			if(data.salesList == "") return;
			
			for(var i=0; i<$length; i++){
				var year = data.salesList[i].year;
				var sales = data.salesList[i].sales;
				
				var html = '<form id="sales-info-form"'+(i+1)+'>';
				html += '<input type="hidden" name="compId" value=${companyMap.company.compId } />';
				html += '<div class="row">';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<input type="text" class="form-control form-control-sm" id="year'+(i+1)+'" name="year" value="'+year+'" readonly>';
				html += '</div>';
				html += '</div>';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<div class="input-group input-group-sm">';
				html += '<div class="input-group-prepend">';
				html += '<span class="input-group-text">₩</span>';
				html += '</div>';
				html += '<input type="text" class="form-control" id="sales'+(i+1)+'" name="sales" onkeyup="inputNumberFormat(this)" value="'+sales+'">';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<div class="col-sm-2 text-center">'
				html += '<button type="button" class="btn btn-outline-success btn-sm update-sales-btn">수정</button> ';
				html += '<button type="button" class="btn btn-outline-danger btn-sm delete-sales-btn">삭제</button>';
				html += '</div></div></form>';
				$("#sales-info-container").append(html);
			}
			
		},
		error: function(){
			console.log("매출액 삭제 ajax error!");
		}
	});
	
	
});

/* 위치 기타 선택시 */
$(document).on("change","select",function(){
	var $opSelVal = $(this).children("option:selected").val();
	
	
	if($opSelVal == "5"){
		$(this).siblings("[name=etc]").removeClass("visible-off").addClass("visible");
	}
	else{
		$(this).siblings("[name=etc]").addClass("visible-off").removeClass("visible");
	}
		
});

/* 주소 입력칸 추가 버튼 */
var loIndex = $("[id*=location-name]").length+1;
$("#insert-location-modal-btn").on("click",function(){
	
	html = '<form id="insert-location-form'+loIndex+'">';
	html += '<input type="hidden" name="compId" value=${companyMap.company.compId } />';
	html += '<div class="row">';
	html += '<div class="col">';
	html += '<div class="form-group">';
	html += '<select id="location-name'+loIndex+'" name="name" class="custom-select form-control-sm">';
	html += '<option value="0" ${location.name=="0"?"selected":"" }>본사</option>';
	html += '<option value="1" ${location.name=="1"?"selected":"" }>지사</option>';
	html += '<option value="2" ${location.name=="2"?"selected":"" }>연구소</option>';
	html += '<option value="3" ${location.name=="3"?"selected":"" }>해외지사</option>';
	html += '<option value="4" ${location.name=="4"?"selected":"" }>공장</option>';
	html += '<option value="5" ${location.name=="5"?"selected":"" }>기타</option>';
	html += '</select>';
	html += '<input type="text" class="form-control form-control-sm visible-off" id="etc'+loIndex+'" name="etc">';
	html += '</div>';
	html += '</div>';
	html += '<div class="col">';
	html += '<div class="form-group">';
	html += '<input type="text" class="form-control form-control-sm" id="address'+loIndex+'" name="address" placeholder="클릭: 주소 검색">';
	html += '</div>';
	html += '</div>';
	html += '<div class="col">';
	html += '<div class="form-group">';
	html += '<input type="text" class="form-control form-control-sm" id="addAddress'+loIndex+'" name="addAddress" placeholder="지번, 호수 등">';
	html += '</div>';
	html += '</div>';
	html += '<div class="col-sm-2 text-center">';
	html += '<button type="button" class="btn btn-outline-success btn-sm insert-location-btn">저장</button> ';
	html += '<button type="button" class="btn btn-outline-danger btn-sm cancel-location-btn">취소</button>';
	html += '</div>';
	html += '</div>';
	html += '</form>';
	
	
	
		
	$("#location-info-container").append(html);
	
	loIndex++;
});

/* 주소 추가 취소버튼 */
$(document).on("click",".cancel-location-btn",function(){
	$(this).parents("form").remove();
});

/* 주소 추가 */
$(document).on("click","[id^=address]",function(){
	
	var $this = $(this);
	
	new daum.Postcode({
		oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        console.log(data.address);
	        console.log($this);
	    	$this.val(data.address);
	    }
	}).open();
});


/* 주소 등록 버튼 */
$(document).on("click",".insert-location-btn",function(){
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/location",
		type: "post",
		data: $(this).parents("form").serialize(),
		success: function(data){
			alert(data.msg);
			
			var $form = $("#location-info-container").find("form");
			
			$form.remove();
			
			for(var i=1; i<=$form.length; i++){
				
				html = '<form id="insert-location-form'+i+'">';
				html += '<input type="hidden" name="compId" value=${companyMap.company.compId } />';
				html += '<input type="hidden" name="no"/>';
				html += '<div class="row">';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<select id="location-name'+i+'" name="name" class="custom-select form-control-sm">';
				html += '<option value="0" ${location.name=="0"?"selected":"" }>본사</option>';
				html += '<option value="1" ${location.name=="1"?"selected":"" }>지사</option>';
				html += '<option value="2" ${location.name=="2"?"selected":"" }>연구소</option>';
				html += '<option value="3" ${location.name=="3"?"selected":"" }>해외지사</option>';
				html += '<option value="4" ${location.name=="4"?"selected":"" }>공장</option>';
				html += '<option value="5" ${location.name=="5"?"selected":"" }>기타</option>';
				html += '</select>';
				html += '<input type="text" class="form-control form-control-sm visible-off" id="etc'+i+'" name="etc">';
				html += '</div>';
				html += '</div>';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<input type="text" class="form-control form-control-sm" id="address'+i+'" name="address" value="${ location.address }" placeholder="클릭: 주소 검색">';
				html += '</div>';
				html += '</div>';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<input type="text" class="form-control form-control-sm" id="addAddress'+i+'" name="addAddress" placeholder="지번, 호수 등">';
				html += '</div>';
				html += '</div>';
				html += '<div class="col-sm-2 text-center">';
				html += '<button type="button" class="btn btn-outline-success btn-sm update-location-btn">수정</button> ';
				html += '<button type="button" class="btn btn-outline-danger btn-sm delete-location-btn">삭제</button>';
				html += '</div>';
				html += '</div>';
				html += '</form>';
				
				
				$("#location-info-container").append(html);
				
				var $form2 = $("#location-info-container").find("form").eq(i-1);
				
				
				$form2.find("[name=no]").val(data.locationList[(i-1)].no);
				$form2.find("option[value="+data.locationList[(i-1)].name+"]").attr("selected",true);
				$form2.find("[name=etc]").val(data.locationList[(i-1)].etc);
				$form2.find("[name=address]").val(data.locationList[(i-1)].address);
				$form2.find("[name=addAddress]").val(data.locationList[(i-1)].addAddress);
				
				/* 위치 옵션 기타일 경우 입력칸 보이게 하기 */
				$("#location-info-container").find("option:selected[value=5]").parent().siblings("[name=etc]").removeClass("visible-off").addClass("visible");
			}
			
			
			
			
		},
		error: function(){
			console.log("주소 등록 ajax error!");
		}
	});
	
});


/* 주소 수정 버튼 */
$(document).on("click",".update-location-btn",function(){
	
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/location?"+$(this).parents("form").serialize(),
		type: "put",
		success: function(data){
			alert(data.msg);
			
		},
		error: function(){
			console.log("주소 등록 ajax error!");
		}
	});
	
});

/* 주소 삭제 버튼 */
$("#location-info-container").on("click",".delete-location-btn",function(){
	
	if(!confirm("정말로 삭제하시겠습니까?")) return;
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/location?"+$(this).parents("form").serialize(),
		type: "delete",
		success: function(data){
			alert(data.msg);
			
			var $form = $("#location-info-container").find("form");
			
			$form.remove();
			
			for(var i=1; i<=$form.length-1; i++){
				
				html = '<form id="insert-location-form'+i+'">';
				html += '<input type="hidden" name="compId" value=${companyMap.company.compId } />';
				html += '<input type="hidden" name="no"/>';
				html += '<div class="row">';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<select id="location-name'+i+'" name="name" class="custom-select form-control-sm">';
				html += '<option value="0">본사</option>';
				html += '<option value="1">지사</option>';
				html += '<option value="2">연구소</option>';
				html += '<option value="3">해외지사</option>';
				html += '<option value="4">공장</option>';
				html += '<option value="5">기타</option>';
				html += '</select>';
				html += '<input type="text" class="form-control form-control-sm visible-off" id="etc'+i+'" name="etc">';
				html += '</div>';
				html += '</div>';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<input type="text" class="form-control form-control-sm" id="address'+i+'" name="address"';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<div class="col">';
				html += '<div class="form-group">';
				html += '<input type="text" class="form-control form-control-sm" id="Addaddress'+i+'" name="Addaddress" placeholder="지번, 호수 등">';
				html += '</div>';
				html += '</div>';
				html += '<div class="col-sm-2 text-center">';
				html += '<button type="button" class="btn btn-outline-success btn-sm update-location-btn">수정</button> ';
				html += '<button type="button" class="btn btn-outline-danger btn-sm delete-location-btn">삭제</button>';
				html += '</div>';
				html += '</div>';
				html += '</form>';
				
				$("#location-info-container").append(html);
				
				var $form2 = $("#location-info-container").find("form").eq(i-1);
				
				$form2.find("[name=no]").val(data.locationList[(i-1)].no);
				$form2.find("option[value="+data.locationList[(i-1)].name+"]").attr("selected",true);
				$form2.find("[name=etc]").val(data.locationList[(i-1)].etc);
				$form2.find("[name=address]").val(data.locationList[(i-1)].address);
				$form2.find("[name=addAddress]").val(data.locationList[(i-1)].addAddress);
				
				/* 위치 옵션 기타일 경우 입력칸 보이게 하기 */
				$("#location-info-container").find("option:selected[value=5]").parent().siblings("[name=etc]").removeClass("visible-off").addClass("visible");
			}
			
			
			
		},
		error: function(){
			console.log("주소 등록 ajax error!");
		}
	});

});


/* 인사담당자 등록 버튼 */
$("#insert-hrmanager-btn").on("click",function(){
	
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/hrManager",
		type: "post",
		data: $("#insert-hrmanager-form").serialize(),
		success: function(data){
			alert(data.msg);
			
			$("#insert-hrmanager-form")[0].reset();
			
			for(var i=1; i<=3; i++){
				$("form#hrmanager-info-form"+i)[0].reset();
				$("form#hrmanager-info-form"+i).removeClass("visible-on-block").removeClass("visible-off").addClass("visible-off");
			}
			
			for(var i=1; i<=data.hrManagerList.length; i++){
				$("#hrmanager-info-form"+i+" #hiddenNo"+i).val(data.hrManagerList[(i-1)].no);
				$("#hrmanager-info-form"+i+" #name"+i).val(data.hrManagerList[(i-1)].name);
				$("#hrmanager-info-form"+i+" #department"+i).val(data.hrManagerList[(i-1)].department);
				$("#hrmanager-info-form"+i+" #position"+i).val(data.hrManagerList[(i-1)].position);
				$("#hrmanager-info-form"+i+" #phone"+i).val(data.hrManagerList[(i-1)].phone);
				$("#hrmanager-info-form"+i+" #email"+i).val(data.hrManagerList[(i-1)].email);
				
				var $form = $("form#hrmanager-info-form"+i);
				
				
				$form.removeClass("visible-off");
				$form.addClass("visible-on-block");
			}
			
			$("span#hrmanagerSize").html(data.hrManagerList.length);
			
			if(data.hrManagerList.length == 3){
				$("#insert-hrmanager-modal-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#insert-hrmanager-modal-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 등록 ajax error!");
		}
	});
	
	
});

/* 인사담당자 수정 버튼 */
$("[id*=update-hrmanager-btn]").on("click",function(){
	
	$updateForm = $(this).parents("form");
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/hrManager?"+$updateForm.serialize(),
		type: "put",
		success: function(data){
			alert(data.msg);
			
			$("#insert-hrmanager-form")[0].reset();
			
			for(var i=1; i<=3; i++){
				$("form#hrmanager-info-form"+i)[0].reset();
				$("form#hrmanager-info-form"+i).removeClass("visible-on-block").removeClass("visible-off").addClass("visible-off");
			}
			
			for(var i=1; i<=data.hrManagerList.length; i++){
				$("#hrmanager-info-form"+i+" #hiddenNo"+i).val(data.hrManagerList[(i-1)].no);
				$("#hrmanager-info-form"+i+" #name"+i).val(data.hrManagerList[(i-1)].name);
				$("#hrmanager-info-form"+i+" #department"+i).val(data.hrManagerList[(i-1)].department);
				$("#hrmanager-info-form"+i+" #position"+i).val(data.hrManagerList[(i-1)].position);
				$("#hrmanager-info-form"+i+" #phone"+i).val(data.hrManagerList[(i-1)].phone);
				$("#hrmanager-info-form"+i+" #email"+i).val(data.hrManagerList[(i-1)].email);
				
				var $form = $("form#hrmanager-info-form"+i);
				
				
				$form.removeClass("visible-off");
				$form.addClass("visible-on-block");
			}
			
			$("span#hrmanagerSize").html(data.hrManagerList.length);
			
			if(data.hrManagerList.length == 3){
				$("#insert-hrmanager-modal-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#insert-hrmanager-modal-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 수정 ajax error!");
		}
	});
	
	
});



/* 인사담당자 삭제 버튼 */
$(".delete-hrmanager-btn").on("click",function(){
	if(!confirm("정말로 삭제하시겠습니까?")) return;
	
	var $no = $(this).parents("form").find("[id*=hiddenNo]").val();
	var $compId = "${companyMap.company.compId}";
	
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/hrManager?no="+$no+"&compId="+$compId,
		type: "delete",
		success: function(data){
			alert(data.msg);
			
			for(var i=1; i<=3; i++){
				$("form#hrmanager-info-form"+i)[0].reset();
				$("form#hrmanager-info-form"+i).removeClass("visible-on-block").removeClass("visible-off").addClass("visible-off");
			}
			
			for(var i=1; i<=data.hrManagerList.length; i++){
				$("#hrmanager-info-form"+i+" #hiddenNo"+i).val(data.hrManagerList[(i-1)].no);
				$("#hrmanager-info-form"+i+" #name"+i).val(data.hrManagerList[(i-1)].name);
				$("#hrmanager-info-form"+i+" #department"+i).val(data.hrManagerList[(i-1)].department);
				$("#hrmanager-info-form"+i+" #position"+i).val(data.hrManagerList[(i-1)].position);
				$("#hrmanager-info-form"+i+" #phone"+i).val(data.hrManagerList[(i-1)].phone);
				$("#hrmanager-info-form"+i+" #email"+i).val(data.hrManagerList[(i-1)].email);
				
				var $form = $("form#hrmanager-info-form"+i);
				
				
				$form.removeClass("visible-off");
				$form.addClass("visible-on-block");
			}
			
			$("span#hrmanagerSize").html(data.hrManagerList.length);
			
			if(data.hrManagerList.length == 3){
				$("#insert-hrmanager-modal-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#insert-hrmanager-modal-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 삭제 ajax error!");
		}
	});
	
	
});









</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>