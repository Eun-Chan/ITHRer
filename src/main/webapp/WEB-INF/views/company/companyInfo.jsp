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

	<div id="account-info-container">
		<div class="text-center">
			<span class="title badge badge-dark">기업 정보</span>
		</div>
		
		<form id="account-info-form">
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
						<label for="businessScale">기업규모</label>
						<input type="text" class="form-control" id="businessScale" name="businessScale" value="${ companyMap.company.businessScale }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="listed">상장여부</label>
						<select id="listed" name="cars" class="custom-select">
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
						<label for="mainBusiness">주요 사업내용</label>
						<input type="text" class="form-control" id="mainBusiness" name="mainBusiness" value="${ companyMap.company.mainBusiness }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="dateOfEstablishment">설립일</label>
						<input type="text" class="form-control" id="dateOfEstablishment" name="dateOfEstablishment" value="${ companyMap.company.dateOfEstablishment }">
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
						<label for="capital">자본금</label>
						<input type="text" class="form-control" id="capital" name="capital" value="${ companyMap.company.capital }">
					</div>
				</div>
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-outline-success">저장</button>
				<button type="button" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>
	
	
	<div id="sales-info-container">
		<span class="title badge badge-dark">매출액</span>
		<form id="sales-info-form">
			<div class="row">
				<div class="col">
				
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-outline-success">저장</button>
				<button type="button" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
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
		
		<button id="hrmanager-plus-btn" class="btn btn-primary btn-sm visible-on-inline-block" data-toggle="modal" data-target="#insertHrManagerModal"><strong>+</strong></button>
		
		<c:forEach var="i" begin="1" end="3" >
			<form id="hrmanager-info-form${i}" class="visible-off">
				<input type="hidden" id="hiddenNo${i}" name="no"/>
				<div class="row">
					<div class="col-sm-1">
						<div class="form-group">
							<label for="no${i}">no.</label>
							<input type="text" class="form-control form-control-sm" id="no${i}" value="${i}" readonly>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="name${i}">이름</label>
							<input type="text" class="form-control form-control-sm" id="name${i}" name="name">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="department${i}">부서</label>
							<input type="text" class="form-control form-control-sm" id="department${i}" name="department">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="position${i}">직급</label>
							<input type="text" class="form-control form-control-sm" id="position${i}" name="position">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="phone${i}">휴대폰</label>
							<input type="text" class="form-control form-control-sm" id="phone${i}" name="phone">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="email${i}">이메일</label>
							<input type="text" class="form-control form-control-sm" id="email${i}" name="email">
						</div>
					</div>
					<div class="col-sm-1 text-center">
						<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#updateHrManagerModal">수정</button>
						<button type="button" class="btn btn-outline-danger hrmanager-delete-btn">삭제</button>
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
							<input type="text" class="form-control form-control-sm" id="phoneModal" name="phone">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="emailModal">이메일</label>
							<input type="text" class="form-control form-control-sm" id="emailModal" name="email">
						</div>
					</div>
				</div>
			</form>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button id="insert-hrmanager-btn" type="button" class="btn btn-outline-success">저장</button>
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        </div>
	        
			</div>
		</div>
	</div>
	<!-- updateHrManagerModal -->
	<div class="modal fade" id="updateHrManagerModal">
    	<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	        	<h4 class="modal-title">인사담당자 수정</h4>
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<form id="hrmanager-update-form">
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="nameModal2">이름</label>
							<input type="text" class="form-control form-control-sm" id="nameModal2" name="name">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="departmentModal2">부서</label>
							<input type="text" class="form-control form-control-sm" id="departmentModal2" name="department">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="positionModal2">직급</label>
							<input type="text" class="form-control form-control-sm" id="positionModal2" name="position">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="phoneModal2">휴대폰</label>
							<input type="text" class="form-control form-control-sm" id="phoneModal2" name="phone">
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="emailModal2">이메일</label>
							<input type="text" class="form-control form-control-sm" id="emailModal2" name="email">
						</div>
					</div>
				</div>
			</form>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" id="update-hrmanager-btn" class="btn btn-outline-success">저장</button>
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        </div>
	        
			</div>
		</div>
	</div>

	
</div>

<script>

$(function(){
	/* 인사담당자 추가 버튼 */
	if(${companyMap.hrManagerList.size()} == 3){
		$("#hrmanager-plus-btn").removeClass("visible-on-block").addClass("visible-off");
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

/* 인사담당자 등록 버튼 */
$("#insert-hrmanager-btn").on("click",function(){
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/hrManager",
		type: "post",
		data: $("#hrmanager-insert-form").serialize(),
		success: function(data){
			alert(data.msg);
		},
		error: function(){
			console.log("인사담당자 저장 ajax error!")
		}
	});
	
	
});

/* 인사담당자 삭제 버튼 */
$(".hrmanager-delete-btn").on("click",function(){
	var $no = $(this).parents("form").find("[id*=hiddenNo]").val();
	var $compId = "${companyMap.company.compId}";
	
	if($no == ""){
		$no = -1;
	}
	if($compId == ""){
		$compId = "";
	}
	
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
				$("#hrmanager-plus-btn").removeClass("visible-on-block").addClass("visible-off");
			}
			else{
				$("#hrmanager-plus-btn").removeClass("visible-off").addClass("visible-on-block");
			}
			
		},
		error: function(){
			console.log("인사담당자 삭제 ajax error!");
		}
	});
	
	
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>