<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- index.jsp ===> header.jsp 로 데이터 전송 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
#company-index-container{
	width: 1000px;
	font-size: 0.9em;
}
button.visible-on{
	display: inline-block;
}
button.visible-off{
	display: none;
}

/* border 두께 설정 */
div.border-top.border-bottom{
	border-width: 3px !important;
}


</style>

<div id="company-index-container" class="container my-5">

	<div class="clearfix">
		<button class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/company/info.ithrer?compId=${companyMap.company.compId }'">기업정보관리</button>
	</div>
	
	<!-- 회사기본정보 보여주는 영역 -->
	<div id="company-info-container" class="container my-3 shadow rounded border border-primary text-center">
		<div class="row d-flex flex-wrap align-items-center">
			<div class="col">
				<c:if test="${not empty companyMap.company.logoS3 }">
					<img src="${pageContext.request.contextPath}/displayFile.ithrer?fileName=${companyMap.company.logoS3 }&directory=compLogo" alt="기업로고" width="300px"/>
				</c:if>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">기업이름</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.compName} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold">대표</div>
			<div class="col-sm-4 text-left">
				<span>${companyMap.company.representive} </span>
			</div>
		</div>				
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">기업규모</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.bussinessScale} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold">업종</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.category} </span>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">홈페이지</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.homepage} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold">전화번호</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.phone} </span>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-sm-2 text-right font-weight-bold">대표 주소</div>
			<div class="col-sm-4 text-left">
				<span> ${companyMap.company.location} </span>
			</div>
			<div class="col-sm-2 text-right font-weight-bold"></div>
			<div class="col-sm-4 text-left">
				<span> </span>
			</div>
		</div>
	</div>
	
	<br />
	
	<!-- 채용정보 보여주는 영역 -->
	<div id="recuritment-info-container" class="container my-3">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#recruitment-ing-tab">진행중(<span id="rcrt-no">${rcrtList.size() }건</span>)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#recruitment-end-tab">마감(<span id="rcrt-end-no">${rcrtEndList.size() }건</span>)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#recruitment-all-tab">전체(${rcrtList.size()+rcrtEndList.size() }건)</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="recruitment-ing-tab" class="container tab-pane active text-center"><br />
				<div class="row py-3 rounded border-top border-bottom font-weight-bold">
					<div class="col-sm-5">공고 제목</div>
					<div class="col">공고 관리</div>
					<div class="col">지원자 관리</div>
					<div class="col">지원자 통계</div>
					<div class="col">이용상품</div>
				</div>
				<c:forEach var="rcrt" items="${rcrtList}">
					<div class="row d-flex flex-wrap align-items-center py-2 border-bottom">
						<div class="col-sm-5">
							<a href="${pageContext.request.contextPath }/index/ithrerNotice.ithrer?no=${rcrt.recruitmentNo}">
								${rcrt.recruitmentTitle }
							</a>
						</div>
						<div class="col">
							<button rn="${rcrt.recruitmentNo}" compid="${companyLoggedIn.compId}" class="btn btn-warning btn-sm rcrt-revision-btn">수정</button>
							<button rn="${rcrt.recruitmentNo}" class="btn btn-danger btn-sm rcrt-end-btn">마감</button>
						</div>
						<div class="col">
							<a href="${pageContext.request.contextPath }/company/viewApplicantList.ithrer?recruitmentNo=${rcrt.recruitmentNo}&compId=${companyLoggedIn.compId}">
								${rcrt.count }명
							</a>
							 (미열람 ${rcrt.notReadCount }명)
						</div>
						<div class="col">
							<button class="btn btn-dark btn-sm rcrt-appview-btn">보기</button>
						</div>
						<div class="col">
							없음<br />
							<button class="btn btn-success btn-sm">유료서비스 신청</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="recruitment-end-tab" class="container tab-pane fade text-center"><br>
				<div class="row py-3 rounded border-top border-bottom font-weight-bold">
					<div class="col-sm-5">공고 제목</div>
					<div class="col">공고 관리</div>
					<div class="col">지원자 관리</div>
					<div class="col">지원자 통계</div>
					<div class="col">이용상품</div>
				</div>
				<c:forEach var="rcrtEnd" items="${rcrtEndList}">
					<div class="row d-flex flex-wrap align-items-center py-2 border-bottom end-del">
						<div class="col-sm-5">
							<a href="${pageContext.request.contextPath }/index/ithrerNotice.ithrer?no=${rcrtEnd.recruitmentNo}">
								${rcrtEnd.recruitmentTitle }
							</a>
						</div>
						<div class="col">
							<button class="btn btn-warning btn-sm rcrt-reregi-btn">재등록</button>
						</div>
						<div class="col">
							<a href="${pageContext.request.contextPath }/company/viewApplicantList.ithrer?recruitmentNo=${rcrtEnd.recruitmentNo}&compId=${companyLoggedIn.compId}">
								${rcrtEnd.count }명
							</a>
							 (미열람 ${rcrt.notReadCount }명)
						</div>
						<div class="col">
							<button class="btn btn-dark btn-sm rcrt-appview-btn">보기</button>
						</div>
						<div class="col">
							없음<br />
							<button class="btn btn-success btn-sm">유료서비스 신청</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="recruitment-all-tab" class="container tab-pane fade"><br>
				<h3>진행 중/마감된 채용정보 모두 보여주면 댐</h3>
			</div>
		</div>
	</div>
	
	<br />
	
	<!-- 인재관련 영역 -->
	<div id="talented-person-info-container" class="container">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#today-inqury-tab">오늘 본 인재(${readAppList.size() }명)</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#person-bookmark-tab">관심인재<span id="fav-app-no">(${favoriteAppList.size() }명)</span></a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="today-inqury-tab" class="container tab-pane active text-center"><br />
				<div class="row py-3 rounded border-top border-bottom font-weight-bold">
					<div class="col">이름/나이/성별</div>
					<div class="col">이력서 제목</div>
					<div class="col">경력</div>
					<div class="col">관리</div>
				</div>
				<c:forEach var="applicant" items="${readAppList }">
					<div class="row d-flex flex-wrap align-items-center py-2 border-bottom">
						<div class="col">
							<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?compId=${companyMap.company.compId }&recruitmentNo=2&memberId=${applicant.memberId}">
								${applicant.memberId }
							</a>
						</div>
						<div class="col">
							
						</div>
						<div class="col">
							
						</div>
						<div class="col">
							<button mi="${applicant.memberId }" class="btn btn-primary btn-sm fav-add-btn">관심인재 등록</button>
							<button mi="${applicant.memberId }" class="btn btn-danger btn-sm fav-delete-btn">관심인재 해제</button>
						</div>
					</div>
				</c:forEach>
				
				
				
			</div>
			<div id="person-bookmark-tab" class="container tab-pane fade text-center"><br>
				<div class="row py-3 rounded border-top border-bottom font-weight-bold">
					<div class="col">이름/나이/성별</div>
					<div class="col">이력서 제목</div>
					<div class="col">경력</div>
					<div class="col">관리</div>
				</div>
				<c:forEach var="favorite" items="${favoriteAppList }">
					<div class="row d-flex flex-wrap align-items-center py-2 border-bottom">
						<div class="col">
							<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?compId=${companyMap.company.compId }&recruitmentNo=${favorite.recruitmentNo}&memberId=${favorite.memberId}">
								${favorite.memberId}
							</a>
						</div>
						<div class="col">
							
						</div>
						<div class="col">
							
						</div>
						<div class="col">
							<button del="del" mi="${favorite.memberId }" class="btn btn-danger btn-sm fav-delete-btn">관심인재 해제</button>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	
	</div>
	
	


</div>

<script>
//start 오늘본인재 | 페이지 로딩 후 관심인재 등록/해제 버튼 이미지 보여줄 것 정하기 
var $favBtn = $("div#today-inqury-tab button");

var $favList = new Array();
<c:forEach var="fav" items="${favoriteAppList}">
$favList.push("${fav.memberId}");
</c:forEach>

for(var i=0; i<$favBtn.length; i++){
	if(i % 2 != 0) continue;
	if($favList.includes($favBtn.eq(i).attr("mi"))){
		$favBtn.eq(i).removeClass("visible-on").addClass("visible-off");
		$favBtn.eq((i+1)).removeClass("visible-off").addClass("visible-on");
	}
	else{
		$favBtn.eq(i).removeClass("visible-off").addClass("visible-on");
		$favBtn.eq((i+1)).removeClass("visible-on").addClass("visible-off");
	}
}
//end 페이지 로딩 후 관심인재 등록/해제 버튼 이미지 보여줄 것 정하기 

// 인재검색 버튼
$("button#app-search").on("click",function(){
	location.href = "${pageContext.request.contextPath}/company/search.ithrer";
});

/* 채용공고 마감 버튼 */
$(".rcrt-end-btn").on("click",function(){
	if(!confirm("정말로 마감하시겠습니까?")) return;
	
	var $this = $(this);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/rcrtEnd?recruitmentNo="+$this.attr("rn")+"&compId=${companyLoggedIn.compId}",
		type: "put",
		success: function(data){
			$this.parents("div.row").remove();
			
			$("#rcrt-no").text(data.rcrtList.length+"건");
			$("#rcrt-end-no").text(data.rcrtEndList.length+"건");
			
			$(".end-del").remove();
			
			for(var i=0; i<data.rcrtEndList.length; i++){
				var rcrtEnd = data.rcrtEndList[i];

				var html = '<div class="row d-flex flex-wrap align-items-center py-2 border-bottom">';
				html += '<div class="col-sm-5">';
				html += '<a href="${pageContext.request.contextPath }/index/ithrerNotice.ithrer?no='+rcrtEnd.recruitmentNo+'">';
				html += rcrtEnd.recruitmentTitle;
				html += '</a>';
				html += '</div>';
				html += '<div class="col">';
				html += '<button class="btn btn-warning btn-sm rcrt-reregi-btn">재등록</button>';
				html += '</div>';
				html += '<div class="col">';
				html += '<a href="${pageContext.request.contextPath }/company/viewApplicantList.ithrer?recruitmentNo='+rcrtEnd.recruitmentNo+'&compId=${companyLoggedIn.compId}">';
				html += rcrtEnd.count+'명';
				html += '</a>';
				html += ' (미열람 '+rcrtEnd.notReadCount+'명)';
				html += '</div>';
				html += '<div class="col">';
				html += '<button class="btn btn-dark btn-sm rcrt-appview-btn">보기</button>';
				html += '</div>';
				html += '<div class="col">';
				html += '없음<br />';
				html += '<button class="btn btn-success btn-sm">유료서비스 신청</button>';
				html += '</div>';
				html += '</div>';
				
				$("#recruitment-end-tab").append(html);
			}
		},
		error: function(){
			console.log("채용공고 마감 ajax error!");
		}
	});
	
});

/* 관심인재 등록 버튼 */
$(".fav-add-btn").on("click",function(){
	
	var $this = $(this);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/favorite?compId=${companyLoggedIn.compId}&memberId="+$this.attr("mi")+"&recruitmentNo=${rcrtEndList[0].recruitmentNo}",
		type: "post",
		success: function(data){
			console.log(data);
			if(data.newCount == 1){
				var favList = new Array();
				for(var i=0; i<data.favoriteAppList.length; i++){
					favList.push(data.favoriteAppList[i].memberId);
				}
				
				var $favBtn = $("div#today-inqury-tab button");
				
				for(var i=0; i<$favBtn.length; i++){
					if(i % 2 != 0) continue;
					if(favList.includes($favBtn.eq(i).attr("mi"))){
						$favBtn.eq(i).removeClass("visible-on").addClass("visible-off");
						$favBtn.eq((i+1)).removeClass("visible-off").addClass("visible-on");
					}
					else{
						$favBtn.eq(i).removeClass("visible-off").addClass("visible-on");
						$favBtn.eq((i+1)).removeClass("visible-on").addClass("visible-off");
					}
				}
				
				$("#fav-app-no").text("("+data.favoriteAppList.length+"명)");
				
				for(var i=0; i<data.favoriteAppList.length; i++){
					if(data.favoriteAppList[i].memberId == $this.attr("mi")){
						var html = '<div class="row d-flex flex-wrap align-items-center py-2 border-bottom">';
						html += '<div class="col">';
						html += '<a href="${pageContext.request.contextPath }/company/viewApplicant.ithrer?compId=${companyMap.company.compId }&recruitmentNo=${favorite.recruitmentNo}&memberId=${favorite.memberId}">';
						html += data.favoriteAppList[i].memberId;
						html += '</a>';
						html += '</div>';
						html += '<div class="col">';
						html += '</div>';
						html += '<div class="col">';
						html += '</div>';
						html += '<div class="col">';
						html += '<button del="del" mi="'+data.favoriteAppList[i].memberId+'" class="btn btn-danger btn-sm fav-delete-btn">관심인재 해제</button>'
						html += '</div>';
						html += '</div>';
						$("div#person-bookmark-tab").append(html);
					}
				}
				
			}
			
			
			
		},
		error: function(){
			console.log("관심인재 추가 ajax error!");
		}
	});
});


/* 관심인재 해제 버튼 */
$(".fav-delete-btn").on("click",function(){

	if(!confirm("정말로 해제하시겠습니까?")) return;
	
	var $this = $(this);
	
	
	$.ajax({
		url: "${pageContext.request.contextPath}/company/favorite?memberId="+$this.attr("mi")+"&compId=${companyLoggedIn.compId}",
		type: "delete",
		success: function(data){
			if(data.newCount == 0){
				var favList = new Array();
				for(var i=0; i<data.favoriteAppList.length; i++){
					favList.push(data.favoriteAppList[i].memberId);
				}
				
				var $favBtn = $("div#today-inqury-tab button");
				
				for(var i=0; i<$favBtn.length; i++){
					if(i % 2 != 0) continue;
					if(favList.includes($favBtn.eq(i).attr("mi"))){
						$favBtn.eq(i).removeClass("visible-on").addClass("visible-off");
						$favBtn.eq((i+1)).removeClass("visible-off").addClass("visible-on");
					}
					else{
						$favBtn.eq(i).removeClass("visible-off").addClass("visible-on");
						$favBtn.eq((i+1)).removeClass("visible-on").addClass("visible-off");
					}
				}
				
				$("#fav-app-no").text("("+data.favoriteAppList.length+"명)");
				
				$("div#person-bookmark-tab button[mi="+$this.attr("mi")+"]").parents("div.row").remove();
			}
			
			
		},
		error: function(){
			console.log("관심인재 해제 ajax error!");
		}
	});
	
});

/* 채용공고 수정버튼 클릭 시 페이지 이동 */
$(".rcrt-revision-btn").on("click", function(){
	var no = $(this).attr('rn');
	var compid = $(this).attr('compid');
	location.href = "${pageContext.request.contextPath}/company/joinRecruitment?no="+no+"&compid="+compid;
});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>