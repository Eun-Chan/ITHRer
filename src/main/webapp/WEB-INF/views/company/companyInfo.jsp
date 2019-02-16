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
div#company-info-container{
	width: 1000px;
}
span.title{
	font-size: 1em;
}
div[id$=-container]{
	margin-top: 40px;
	margin-bottom: 40px; 
}
div.row{
	margin-bottom: 5px;
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

</style>


<div id="company-info-container" class="container">

	<div id="company-info-container">
		<div class="text-center">
			<span class="title badge badge-dark">기업 정보</span>
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
				<button type="button" id="company-info-submit" class="btn btn-outline-success">저장</button>
				<button type="button" id="company-info-reset" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>
	
	
	<div id="sales-info-container">
		<span class="title badge badge-dark">매출액</span>
		<button id="insert-sales-btn" class="btn btn-primary btn-sm visible-on-inline-block" data-toggle="modal" data-target="#insertSalesModal"><strong>+</strong></button>
		
		<div class="row">
			<div class="col">연도</div>
			<div class="col">매출</div>
			<div class="col-sm-2"></div>
		</div>
		<c:forEach var="sales" items="${companyMap.salesList }" varStatus="vs">
		<form id="sales-info-form${vs.count}">
			<div class="row">
				<div class="col">
					<div class="form-group">
						<input type="text" class="form-control form-control-sm" id="year${vs.count}" name="year" value="${ sales.year }">
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
					<button type="button" class="btn btn-outline-success btn-sm update-sales-btn">저장</button>
					<button type="button" class="btn btn-outline-danger btn-sm delete-sales-btn">삭제</button>
				</div>
			</div>
		</form>
		</c:forEach>
	</div>
	
	
	
	<div id="location-info-container">
		<span class="title badge badge-dark">위치</span>
		
		
		
		<form id="location-info-form">
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="location2">본사 (Tel. 02-1234-1234)</label>
						<input type="text" class="form-control" id="location1" name="capital" value="카카오맵으로 수정">
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="location2">연구소 (Tel. 031-1234-1234)</label>
						<input type="text" class="form-control" id="location2" name="capital" value="카카오맵으로 수정">
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<div id="hrmanager-info-container">
		<span id="var-status" class="title badge badge-dark">인사담당자 정보 (인원: <span id="hrmanagerSize">${companyMap.hrManagerList.size()}</span>/3)</span>
		
		<button id="insert-hrmanager-btn" class="btn btn-primary btn-sm visible-on-inline-block" data-toggle="modal" data-target="#insertHrManagerModal"><strong>+</strong></button>
		
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
						<button type="button" id="update-hrmanager-btn${i}" class="btn btn-outline-success btn-sm">저장</button>
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
	        	<form id="hrmanager-insert-form">
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

	
</div>

<script>


/* 페이지 로딩 후 데이터에 따라서 뷰단 조정 */
$(function(){
	/* 인사담당자 추가 버튼 보이기/안보이기*/
	if(${companyMap.hrManagerList.size()} == 3){
		$("#insert-hrmanager-btn").removeClass("visible-on-block").addClass("visible-off");
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

/* 매출액 수정 */
$(".update-sales-btn").on("click",function(){
	
	var $salesForm = $(this).parents("form");
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/sales?"+$salesForm.serialize(),
		type: "put",
		success: function(data){
			console.log(data);
		},
		error: function(){
			console.log("매출액 수정 ajax error!");
		}
	});
	
});


/* 인사담당자 등록 버튼 */
$("#insert-hrmanager-btn").on("click",function(){
	
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/hrManager",
		type: "post",
		data: $("#hrmanager-insert-form").serialize(),
		success: function(data){
			alert(data.msg);
			
			$("#hrmanager-insert-form")[0].reset();
			
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
				$("#insert-hrmanager-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#insert-hrmanager-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 저장 ajax error!");
		}
	});
	
	
});

/* 인사담당자 수정 버튼 */
$("[id*=update-hrmanager-btn]").on("click",function(){
	
	$updateForm = $(this).parents("form");
	
	console.log($updateForm.serialize());
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/hrManager?"+$updateForm.serialize(),
		type: "put",
		success: function(data){
			alert(data.msg);
			
			$("#hrmanager-insert-form")[0].reset();
			
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
				$("#insert-hrmanager-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#insert-hrmanager-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 저장 ajax error!");
		}
	});
	
	
});



/* 인사담당자 삭제 버튼 */
$(".delete-hrmanager-btn").on("click",function(){
	if(!confirm("정말로 삭제하시겠습니까?")) return;
	
	var $no = $(this).parents("form").find("[id*=hiddenNo]").val();
	var $compId = "${companyMap.company.compId}";
	
	/* if($no == ""){
		$no = -1;
	}
	if($compId == ""){
		$compId = "";
	} */
	
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
				$("#insert-hrmanager-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#hrmanager-add-insert-hrmanager-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 삭제 ajax error!");
		}
	});
	
	
});









</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>