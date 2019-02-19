<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<!-- 폰트추가 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700" rel="stylesheet">
<style>
html
{
	display: none;
}
</style>
<!-- 모집직종팝업 -->
<div id="recruit-popup-background" class="popup-background">
	<div id="recruit-popup" class="popup">
		<h3 class="popup-textTitle">모집직종</h3>
		<div id="borderDiv">
			<div id="borderDiv-Part1" class="borderDiv-Part">
				<ul id="job2" class="jobList">
					<li class="jobList-select">
						<span>하하하</span>
					</li>
					<li class="jobList-select">
						<span>하하하</span>
					</li>
					<li class="jobList-select">
						<span>하하하하하하</span>
					</li>
					<li class="jobList-select">
						<span>하하하하하하하하하</span>
					</li>
				</ul>
			</div>
			<div id="borderDiv-Part2" class="borderDiv-Part">
				<ul id="job3" class="jobList2">
					<li class="jobList-select2">
						<input type='checkbox' class='ipt-chkBox' name="jobDetail-1" ><label for="jobDetail-1">하하</label> 
					</li>
					<li class="jobList-select2">
						<input type='checkbox' class='ipt-chkBox' name="jobDetail-2" ><label for="jobDetail-2">하하</label> 
					</li>
					<li class="jobList-select2">
						<input type='checkbox' class='ipt-chkBox' name="jobDetail-3" ><label for="jobDetail-3">하하</label> 
					</li>
					<li class="jobList-select2">
						<input type='checkbox' class='ipt-chkBox' name="jobDetail-4" ><label for="jobDetail-4">하하</label> 
					</li>
				</ul>
			</div>
			<div id="result-jobList">
				<span class="result-jobSelect">선택1번</span>
			</div>
			<div id="configFrm">
				<button type="button" class="btn btn-primary btn-lg configBtn">확인</button>
				<button type="button" class="btn btn-default btn-lg configBtn" onclick="returnPage();">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모집직급/직책 팝업 -->
<div id="position-popup-background" class="popup-background">
	<div id="position-popup" class="popup">
		<h3 class="popup-textTitle" id="textTitle-position">모집직급/직책</h3> <br />
		<div id="borderDiv-position">
			<table id="position-Table">
				<!-- 직급 -->
				<tr>
					<th class="position-th">직급</th>
					<td>
						<ul class="inlineblock-select positionPopup">
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-0" ><label for="position-rank">인턴/수습</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-1" ><label for="position-rank">사원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-2" ><label for="position-rank">주임</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-3" ><label for="position-rank">계장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-4" ><label for="position-rank">대리</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-5" ><label for="position-rank">과장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-6" ><label for="position-rank">차장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-7" ><label for="position-rank">부장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-8" ><label for="position-rank">감사</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-9" ><label for="position-rank">이사</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-10" ><label for="position-rank">상무</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-11" ><label for="position-rank">전무</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-12" ><label for="position-rank">부사장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-13" ><label for="position-rank">사장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-14" ><label for="position-rank">회장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-15" ><label for="position-rank">전문직</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-16" ><label for="position-rank">IR 책임자</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-17" ><label for="position-rank">연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-18" ><label for="position-rank">주임연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-19" ><label for="position-rank">선임연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-20" ><label for="position-rank">책임연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-21" ><label for="position-rank">수석연구원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-22" ><label for="position-rank">연구소장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-23" ><label for="position-rank">프리랜서</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-24" ><label for="position-rank">CTO</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-25" ><label for="position-rank">CEO</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank" id="position-26" ><label for="position-rank">COO</label>
							</li>
						</ul>
					</td>	
				</tr>
				<!-- 직책 -->
				<tr>
					<th class="position-th">직책</th>
					<td>
						<ul class="inlineblock-select positionPopup">
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-0" ><label for="position-rank-bottom">팀원</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-1" ><label for="position-rank-bottom">총무</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-2" ><label for="position-rank-bottom">부팀장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-3" ><label for="position-rank-bottom">실장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-4" ><label for="position-rank-bottom">팀장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-5" ><label for="position-rank-bottom">파트장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-6" ><label for="position-rank-bottom">지점장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-7" ><label for="position-rank-bottom">공장장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-8" ><label for="position-rank-bottom">지사장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-9" ><label for="position-rank-bottom">그룹장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-10" ><label for="position-rank-bottom">센터장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-11" ><label for="position-rank-bottom">본부장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-12" ><label for="position-rank-bottom">사업부장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-13" ><label for="position-rank-bottom">국장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-14" ><label for="position-rank-bottom">원장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-15" ><label for="position-rank-bottom">매니저</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-16" ><label for="position-rank-bottom">지배인</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-17" ><label for="position-rank-bottom">총지배인</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-18" ><label for="position-rank-bottom">고문</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-19" ><label for="position-rank-bottom">소장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-20" ><label for="position-rank-bottom">관장</label>
							</li>
							<li>
								<input type='checkbox' class='ipt-chkBox' name="position-rank-bottom" id="position-bottom-21" ><label for="position-rank-bottom">이사장</label>
							</li>
						</ul>
					</td>
				</tr>
			</table>
			<div id="btnDiv">
				<button type="button" class="btn btn-primary positionBtn" id="position-inputBtn">확인</button>
				<button type="button" class="btn btn-default positionBtn" id="position-cancleBtn">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- 기본정보 컨테이너 -->
<div id="default-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>이번 채용에는 어떤 인재를 찾고 계신가요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">지난 채용과 유사한 인재를 찾고 계시다면 이전 채용공고를 불러와서 수정하세요.</p>
		</div>
	</div>
	<table id="recruit-content" class="td-inputFrm">
		<!-- 모집직종 -->
		<tr class="td-line">
			<th class="content-title" id="recruitment">
				<div class="th-container">
				 	<div class="essential">* </div>
				 	<span class="content-title-in">모집직종</span>
				 	<p class="subText-Th">최대 15개</p>
			 	</div>
			 </th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-job" class="input-textBox" placeholder="직종을 입력해 주세요."/>
				<button type="button" class="btn btn-primary" id="recruit-btn" onclick="recruitAll();">전체보기</button>
				
			</td>
		</tr>
		<!-- 경력 -->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">경력</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobExp inlineblock-select">
					<li class="radio-select">
						<label for="new-Crr" class="radioDef">
							<input type="radio" id="new-Crr" name="crr" />
							<span>신입</span>
						</label>
					</li class="radio-select">
					<li>
						<label for="normal-Crr" class="radioDef">
							<input type="radio" id="normal-Crr" name="crr" />
							<span>경력</span>
						</label>
					</li>
					<li class="radio-select">
						<label for="total-Crr" class="radioDef">
							<input type="radio" id="total-Crr" name="crr" />
							<span>신입+경력</span>
						</label>
					</li>
				</ul>
				<!-- 숨겨진 영역 -->
				<!-- 경력 선택 시 -->
				<div id="normal-Crr-Frm" class="hiddenDiv">
					<ul class="inlineblock-select" style="padding-top: 15px; padding-left: 10px;">
						<li>
							<!-- 경력 N년 이상 -->
							<select class="form-control inlineblock-select fore-select" id="crr-cntUp">
								<option value="select">선택</option>
								<%
									for(int i=1; i<=60; i++)
									{
								%>
										<option value="<%=i%>"><%=i%>년</option>
								<%	}%>
							</select>
							<span>이상</span>
						</li>
						<li>
							<!-- 경력 N년 미만 -->
							<select class="form-control inlineblock-select fore-select" id="crr-cntDown">
								<option value="select">선택</option>
								<%
									for(int i=1; i<=60; i++)
									{
								%>
										<option value="<%=i%>"><%=i%>년</option>
								<%	}%>
							</select>
							<span>미만</span>
						</li>
						<li style="padding-top: 8px;">
							<input type='checkbox' class='ipt-chkBox' name="irrelevant" id="irrelevant-crr" ><label for="irrelevant">연차무관</label> 
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 고용형태 -->
		<tr class="td-line">
			<th class="content-title" id="content-title-employType"> <div class="essential">* </div><span class="content-title-in">고용형태</span></th>
			<td colspan="5" class="input-content">
				<!-- 체크 -->
				<div id="employType-Div">
					<input type='checkbox' class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_1" value="1" style="margin-left: 0px;"><label for='Employ_Ty_Cd_1'>정규직</label> 
					<input type='checkbox' class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_2" value="2" ><label for='Employ_Ty_Cd_2'>계약직</label> 
					<input type='checkbox' class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_3" value="3" ><label for='Employ_Ty_Cd_3'>병역특례</label> 
					<input type='checkbox' class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_4" value="4" ><label for='Employ_Ty_Cd_4'>인턴</label> 
					<input type='checkbox' class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_5" value="5" ><label for='Employ_Ty_Cd_5'>프리랜서</label> 
					<input type='checkbox' class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_6" value="6" ><label for='Employ_Ty_Cd_6'>위촉직</label> 
					<input type="checkbox" class='ipt-chkBox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_7" value="7" ><label label for="Employ_Ty_Cd_7">알바</label>
				</div>
				<!-- 숨겨진 영역 -->
				<div id="employType0" class="hiddenDiv" style="height: 140px;">
					<table class="employType-table" id="emploType0-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">정규직</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">수습기간&nbsp;</span>
								<input type="text" id="input-cnt-month" class="input-textBox"/>&nbsp;개월
							</td>
						</tr>
						<tr class="td-line" id="timePart">
							<th class="content-title"><span class="content-title-in hiddenTitle">시간제</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_1" value="1" style="margin-bottom: 0px;"><label for='Employ_Ty_Cd_1' style="margin-bottom: 0px;">시간(선택)제로 채용하는 경우에 선택하세요.</label>
							</td>
						</tr>
					</table>
					
				</div>
				<div id="employType1" class="hiddenDiv" style="height: 140px">
					<table class="employType-table" id="emploType1-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">계약직</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control inlineblock-select fore-select" id="workDateRange" onchange="input_date_check_contract(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-contract">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-Contract">
									<input type="text" id="date-cnt-contract" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control inlineblock-select fore-select work-dateCntType" id="contract-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;수습기간&nbsp;<input type="text" id="input-cnt-month2" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change0" value="1" style="margin-bottom: 0px;"><label for='employType-Change' id="employ-ChangeLabel" style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">시간제</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="Employ_Ty_Cd" id="Employ_Ty_Cd_1" value="1" style="margin-bottom: 0px;"><label for='Employ_Ty_Cd_1' style="margin-bottom: 0px;">시간(선택)제로 채용하는 경우에 선택하세요.</label> 
							</td>
						</tr>
					</table>
				</div>
				<div id="employType2" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType2-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">병역특례</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox' name="job-Cd1" ><label for="job-Cd1" class="ms-select">현역</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd2" ><label for="job-Cd2" class="ms-select">보충역</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd3" ><label for="job-Cd3" class="ms-select">전문연구요원</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd4" ><label for="job-Cd4" class="ms-select">산업기능요원</label> 
								<input type='checkbox' class='ipt-chkBox' name="job-Cd5" ><label for="job-Cd5" class="ms-select">전직가능</label>
							</td> 
						</tr>
					</table>
				</div>
				<div id="employType3" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType3-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">인턴</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control inlineblock-select fore-select" id="workDateRange-inturn" onchange="input_date_check_inturn(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-inturn">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-inturn">
									<input type="text" id="date-cnt-inturn" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control inlineblock-select fore-select work-dateCntType" id="inturn-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month3" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change1" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
					</table>
				</div>
				<div id="employType4" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType4-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">프리랜서</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control inlineblock-select fore-select" id="workDateRange-inturn" onchange="input_date_check_pre(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-pre">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-pre">
									<input type="text" id="date-cnt-pre" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control inlineblock-select fore-select work-dateCntType" id="pre-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month4" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change2" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
					</table>
				</div>
				<div id="employType5" class="hiddenDiv" style="height: 140px">
					<table class="employType-table" id="emploType5-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">위촉직</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control inlineblock-select fore-select" id="workDateRange-Commission" onchange="input_date_check_commision(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-commision">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-commision">
									<input type="text" id="date-cnt-commision" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control inlineblock-select fore-select work-dateCntType" id="commision-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month5" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-Change3" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">정규직 전환검토</label>
							</td>
						</tr>
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">시간제</span></th>
							<td colspan="5" class="input-content">
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="timePart-Commission" id="timePartId-Commission" value="1" style="margin-bottom: 0px;"><label for='timePart-Commission' style="margin-bottom: 0px;">시간(선택)제로 채용하는 경우에 선택하세요.</label> 
							</td>
						</tr>
					</table>
				</div>
				<div id="employType6" class="hiddenDiv" style="height: 70px">
					<table class="employType-table" id="emploType6-table" style="width: 100%;">
						<tr class="td-line">
							<th class="content-title"><span class="content-title-in hiddenTitle">알바</span></th>
							<td colspan="5" class="input-content">
								<span class="content-content">근무기간&nbsp;</span>
								<select class="form-control inlineblock-select fore-select" id="workDateRange-rbar" onchange="input_date_check_rbar(this.value)">
									<option value="select">합의 후 결정</option>
									<option value="myinputDate-rbar">직접 입력</option>
								</select>
								<div class="hiddenDiv-Date" id="hiddenDiv-Date-rbar">
									<input type="text" id="date-cnt-rbar" class="input-textBox date-cnt"/>&nbsp;
									<select class="form-control inlineblock-select fore-select work-dateCntType" id="rbar-select" >
										<option value="select">일</option>
										<option value="select">주</option>
										<option value="select">개월</option>
										<option value="select">년</option>
									</select>
								</div>
								&nbsp;<input type="text" id="input-cnt-month6" class="input-textBox"/>&nbsp;개월 
								<input type='checkbox' class='ipt-chkBox employ-chkbox' name="employType-Change" id="employType-basic" value="1" style="margin-bottom: 0px;"><label for='employType-Change' style="margin-bottom: 0px;">초보가능</label>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<!-- 모집인원 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">모집인원</span></th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-cnt" class="input-textBox" placeholder="1"/>명
			</td>
		</tr>
		<!-- 모집부문 :: 직종과 중첩된다 판단되어 삭제대기 -->
		<!-- <tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">모집부문</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobDiv inlineblock-select">
					<li class="radio-select">
						<label for="new-Crr" class="radioDef">
							<input type="radio" id="new-Crr" name="" selected />
							<span>미입력</span>
						</label>
					</li class="radio-select">
					<li>
						<label for="normal-Crr" class="radioDef">
							<input type="radio" id="normal-Crr" />
							<span>입력</span>
						</label>
					</li>
				</ul>
			</td>
		</tr> -->
		<!-- 담당업무 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">담당업무</span></th>
			<td colspan="5" class="input-content">
				<!-- <input type="text" id="input-task" class="input-textBox" placeholder="예) 자료입력 및 문서관리"/> -->
				<textarea class="input-textBox" id="textarea" cols="30" rows="10"></textarea>
			</td>
		</tr>
		<!-- 근무부서 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">근무부서</span></th>
			<td colspan="5" class="input-content">
				<input type="text" class="input-textBox" placeholder="예) 기획팀, 디자인팀"/>
			</td>
		</tr>
		<!-- 모집직급/직책 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">모집직급/직책</span></th>
			<td colspan="5" class="input-content">
				<div id="job-code-result-Div">
					<ul id="job-select-result">
						
					</ul>
				</div>
				<!-- 체크 -->
				<input type='checkbox' class='ipt-chkBox' name="job-Cd1" ><label for="job-Cd1 position-defaultChx">사원</label> 
				<input type='checkbox' class='ipt-chkBox' name="job-Cd2" ><label for="job-Cd2 position-defaultChx">팀원</label> 
				<input type='checkbox' class='ipt-chkBox' name="job-Cd3" ><label for="job-Cd3 position-defaultChx">대리</label> 
				<input type='checkbox' class='ipt-chkBox' name="job-Cd4" ><label for="job-Cd4 position-defaultChx">파트장</label> 
				<input type='checkbox' class='ipt-chkBox' name="job-Cd5" ><label for="job-Cd5 position-defaultChx">과장</label> 
				<input type='checkbox' class='ipt-chkBox' name="job-Cd6" ><label for="job-Cd6 position-defaultChx">팀장</label> 
				<input type="checkbox" class='ipt-chkBox' name="job-Cd7" ><label for="job-Cd7 position-defaultChx">차장</label>
				<button type="button" class="btn btn-primary" id="position-AllBtn" onclick="positionAllBtn();">전체보기</button>
			</td>
		</tr>
	</table>
</div>



<!-- #2.지원자격 및 우대조건 컨테이너 -->
<div id="preference-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>지원자격 및 우대조건은 어떤 것들이 있나요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">구체적인 정보를 입력하시면 찾으시는 인재에 근접한 지원자를 확인하실 수 있습니다.</p>
		</div>
	</div>
	<table id="preference-content" class="td-inputFrm">
		<!-- 학력 -->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">학력</span></th>
			<td colspan="5" class="input-content">
				<select class="form-control" id="education-select">
					<option value="고등학교졸업">고등학교졸업</option>
					<option value="대학(2,3년)졸업">대학(2,3년)졸업</option>
					<option value="대학교(4년)졸업">대학교(4년)졸업</option>
					<option value="석사졸업">석사졸업</option>
					<option value="박사졸업">박사졸업</option>
					<option value="학력무관" selected>학력무관</option>
				</select>
				<input type='checkbox' class='ipt-chkBox' name="preference-over" ><label for="preference-over">이상</label>
			</td>
		</tr>
		<!-- 전공계열 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">전공계열</span></th>
			<td colspan="5" class="input-content">
				<select class="form-control" id="major-select">
					<option value="전공계열" selected>전공계열</option>
					<option value="어문학계열">어문학계열</option>
					<option value="사회과학계열">사회과학계열</option>
					<option value="자연과학계열">자연과학계열</option>
					<option value="공학계열">공학계열</option>
					<option value="의/약학계열">의/약학계열</option>
					<option value="사범계열">사범계열</option>
					<option value="농/수산/해양계열">농/수산/해양계열</option>
					<option value="가정학계열">가정학계열</option>
					<option value="예/체능계열">예/체능계열</option>
					<option value="신학계열">신학계열</option>
					<option value="법학계열">법학계열</option>
					<option value="상경계열">상경계열</option>
					<option value="해당무">해당무</option>
				</select>
				<button type="button" id="major-Btn" class="btn btn-default">입력</button>
			</td>
		</tr>
		<!-- 외국어-->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">외국어</span></th>
			<td colspan="5" class="input-content">
				<!-- 외국어 능력 -->
				<div id="level-setting" class="fore-setting">
					<ul class="inlineblock-select">
						<li>
							<!-- 1차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="fore-lang">
								<option value="기타" selected>기타</option>
								<option value="네덜란드어">네덜란드어</option>
								<option value="노르웨이어">노르웨이어</option>
								<option value="덴마크어">덴마크어</option>
								<option value="독일어">독일어</option>
								<option value="러시아어">러시아어</option>
								<option value="말레이어">말레이어</option>
								<option value="몽고어">몽고어</option>
								<option value="베트남어">베트남어</option>
								<option value="스칸디나비아어">스칸디나비아어</option>
								<option value="스페인어">스페인어</option>
								<option value="아랍어">아랍어</option>
								<option value="영어">영어</option>
								<option value="우즈베크어">우즈베크어</option>
								<option value="이란어">이란어</option>
								<option value="이탈리아어">이탈리아어</option>
								<option value="인도네시아어">인도네시아어</option>
								<option value="인도어">인도어</option>
								<option value="일본어">일본어</option>
								<option value="중국어">중국어</option>
								<option value="카자흐어">카자흐어</option>
								<option value="크레므어">크레므어</option>
								<option value="태국어">태국어</option>
								<option value="터어키어">터어키어</option>
								<option value="포르투갈어">포르투갈어</option>
								<option value="프랑스어">프랑스어</option>
								<option value="핀란드어">핀란드어</option>
								<option value="한국어">한국어</option>
								<option value="해당무">해당무</option>
							</select>
						</li>
						<li>
							<!-- 2차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="fore-level">
								<option value="회화능력" selected>회화능력</option>
								<option value="가능">가능</option>
								<option value="능통">능통</option>
							</select>
						</li>
						<li>
							<!-- 3차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="fore-level">
								<option value="독해능력" selected>독해능력</option>
								<option value="가능">가능</option>
								<option value="능통">능통</option>
							</select>
						</li>
						<li>
							<!-- 4차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="fore-level">
								<option value="작문능력" selected>작문능력</option>
								<option value="가능">가능</option>
								<option value="능통">능통</option>
							</select>
						</li>
						<li>
							<button type="button" id="fore-lang-Btn" class="btn btn-default">입력</button>
						</li>
					</ul>
				</div>
				<!-- 능력검증 -->
				<div id="verification-setting" class="fore-setting">
					<ul class="inlineblock-select">
						<li style="width: 214px;">
							<!-- 1차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="fore-test">
								<option value="시험명" selected>시험명</option>
								<option value="新BCT">新BCT</option>
								<option value="OPIc(스페인어)">OPIc(스페인어)</option>
								<option value="新HSK">新HSK</option>
								<option value="BCT">BCT</option>
								<option value="CELI">CELI</option>
								<option value="CPET">CPET</option>
								<option value="CPT">CPT</option>
								<option value="DALF">DALF</option>
								<option value="DELE">DELE</option>
								<option value="DELF">DELF</option>
								<option value="DSH">DSH</option>
								<option value="EC-TOP(TOQ)">EC-TOP(TOQ)</option>
								<option value="EPQT">EPQT</option>
								<option value="ESPT">ESPT</option>
								<option value="EVQT">EVQT</option>
								<option value="FCE">FCE</option>
								<option value="FLEX">FLEX</option>
								<option value="G-ETAT">G-ETAT</option>
								<option value="GMAT">GMAT</option>
								<option value="GRE">GRE</option>
								<option value="G-TELP">G-TELP</option>
								<option value="HSK">HSK</option>
								<option value="HSK회화">HSK회화</option>
								<option value="IELTS">IELTS</option>
								<option value="JLPT">JLPT</option>
								<option value="JPT">JPT</option>
								<option value="JTRA">JTRA</option>
								<option value="OPIc">OPIc</option>
								<option value="SEPT">SEPT</option>
								<option value="S-ETAT1급">S-ETAT1급</option>
								<option value="S-ETAT2급">S-ETAT2급</option>
								<option value="SJPT">SJPT</option>
								<option value="S-TOED">S-TOED</option>
								<option value="TEPS">TEPS</option>
								<option value="TOED">TOED</option>
								<option value="TOEFL">TOEFL</option>
								<option value="TOEFL-CBT">TOEFL-CBT</option>
								<option value="TOEFL-IBT">TOEFL-IBT</option>
								<option value="TOEFL-PBT">TOEFL-PBT</option>
								<option value="TOEIC">TOEIC</option>
								<option value="TOEIC S&W">TOEIC S&W</option>
								<option value="TOEIC Speaking">TOEIC Speaking</option>
								<option value="TOEIC Writing">TOEIC Writing</option>
								<option value="TOPIKⅠ">TOPIKⅠ</option>
								<option value="TOPIKⅡ">TOPIKⅡ</option>
								<option value="TORFL">TORFL</option>
								<option value="TSC">TSC</option>
								<option value="BJT비즈니스일본어능력테스트">BJT비즈니스일본어능력테스트</option>
								<option value="FLEX(독일어)">FLEX(독일어)</option>
								<option value="FLEX(러시아어)">FLEX(러시아어)</option>
								<option value="FLEX(스페인어)">FLEX(스페인어)</option>
								<option value="FLEX(영어)">FLEX(영어)</option>
								<option value="FLEX(일본어)">FLEX(일본어)</option>
								<option value="FLEX(중국어)">FLEX(중국어)</option>
								<option value="FLEX(프랑스어)">FLEX(프랑스어)</option>
								<option value="OPIc(일본어)">OPIc(일본어)</option>
								<option value="OPIc(중국어)">OPIc(중국어)</option>
								<option value="TestDaF">TestDaF</option>
								<option value="ZD">ZD</option>
							</select>
						</li>
						<li>
							<!-- 2차 선택지 -->
							<input type="text" id="input-point" class="input-textBox" placeholder="점수"/>
						</li>
						<li>
							<!-- 3차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="verification-Btn">
								<option value="선택" selected>선택</option>
							</select>
						</li>
						<li>
							<button type="button" id="fore-lang-Btn" class="btn btn-default">입력</button>
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 자격증 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">자격증</span></th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-certificate" class="input-textBox" placeholder="자격증을 입력해 주세요."/>
			</td>
		</tr>
		<!-- 컴퓨터활용능력 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">컴퓨터활용능력</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-select computer-abilityUl">
					<li>
						<!-- 기능구분 -->
						<select class="form-control inlineblock-select fore-select" id="computer-ability">
							<option value="기능구분" selected>기능구분</option>
						</select>
					</li>
					<li>
						<!-- 기능명 -->
						<select class="form-control inlineblock-select fore-select" id="computer-ability-name">
							<option value="기능명" selected>기능명</option>
						</select>
					</li>
					<li>
						<button type="button" id="fore-lang-Btn" class="btn btn-default">입력</button>
					</li>
				</ul>
			</td>
		</tr>
		<!-- 우대사항 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">우대사항</span></th>
			<td colspan="5" class="input-content">
				<!-- 체크 -->
				<input type='checkbox' class='ipt-chkBox' id="preference-content-1" value="1" ><label for='preference-content-1'>운전가능자</label> 
				<input type='checkbox' class='ipt-chkBox' id="preference-content-2" value="2" ><label for='preference-content-2'>인근거주자</label> 
				<input type='checkbox' class='ipt-chkBox' id="preference-content-3" value="3" ><label for='preference-content-3'>해당직무인턴경력자</label> 
				<input type='checkbox' class='ipt-chkBox' id="preference-content-4" value="4" ><label for='preference-content-4'>병역특례자</label>
				
				<button type="button" class="btn btn-primary" onclick="전체보기버튼">전체보기</button> 
			</td>
		</tr>
		<!-- 연령제한 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">연령제한</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobDiv inlineblock-select">
					<li class="radio-select">
						<label for="age-none" class="radioDef">
							<input type="radio" id="age-none" />
							<span>무관</span>
						</label>
					</li class="radio-select">
					<li>
						<label for="age-cut" class="radioDef">
							<input type="radio" id="age-cut" />
							<span>연령제한</span>
						</label>
					</li>
				</ul>
			</td>
		</tr>
		<!-- 성별제한 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">성별제한</span></th>
			<td colspan="5" class="input-content">
				<ul class="inlineblock-jobDiv inlineblock-select">
					<li class="radio-select">
						<label for="age-none" class="radioDef">
							<input type="radio" id="gender-none" />
							<span>무관</span>
						</label>
					</li class="radio-select">
					<li>
						<label for="age-cut" class="radioDef">
							<input type="radio" id="gender-f" />
							<span>여자</span>
						</label>
					</li>
					<li>
						<label for="age-cut" class="radioDef">
							<input type="radio" id="gender-m" />
							<span>남자</span>
						</label>
					</li>
				</ul>
			</td>
		</tr>
		<!-- 기타자격요건 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">기타자격요건</span></th>
			<td colspan="5" class="input-content">
				<input type="text" class="input-textBox" placeholder="예) 취업포탈 근무 경함자 우대"/>
			</td>
		</tr>
	</table>
</div>

<!-- 근무조건정보 컨테이너 -->
<div id="workCondition-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>근무조건은 어떻게 되나요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">급여조건, 복리후생 등 상세한 정보가 제공되는 채용공고의 입사지원율이 높습니다.</p>
		</div>
	</div>
	<table id="workCondition-content" class="td-inputFrm">
		<!-- 근무지역 -->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">고용형태</span></th>
			<td colspan="5" class="input-content" style="width: 750px">
				<!-- 체크 -->
				<input type='checkbox' class='ipt-chkBox' id="workCondition-Cd1" ><label for='workCondition-Cd1'>재택근무 가능</label>
				<button type="button" class="btn btn-primary" onclick="전체보기버튼">전체보기</button> 
			</td>
		</tr>
		<!-- 인근전철역 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">인근전철역</span></th>
			<td colspan="5" class="input-content">
				<!-- 인근전철역 선택 -->
				<div id="near-setting" class="near-setting">
					<ul class="inlineblock-select">
						<li>
							<!-- 1차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="train-select">
								<option value="지하철노선" selected>지하철노선</option>
							</select>
						</li>
						<li>
							<!-- 2차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="station-select">
								<option value="지하철역" selected>지하철역</option>
							</select>
						</li>
						<li>
							<!-- 3차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="distance-select">
								<option value="거리" selected>거리</option>
							</select>
						</li>
						<li>
							<button type="button" id="fore-lang-Btn" class="btn btn-default">입력</button>
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 급여조건 -->
		<tr class="td-line">
			<th class="content-title"><div class="essential">* </div><span class="content-title-in">급여조건</span></th>
			<td colspan="5" class="input-content">
				<!-- 급여조건 선택 -->
				<div id="near-setting" class="near-setting">
					<ul class="inlineblock-select">
						<li>
							<!-- 1차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="salary-select">
								<option value="연봉" selected>연봉</option>
							</select>
						</li>
						<li>
							<!-- 2차 선택지 -->
							<select class="form-control inlineblock-select fore-select" id="salary-range">
								<option value="연봉범위" selected>연봉범위</option>
							</select>
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 복리후생 -->
		<tr class="td-line">
			<th class="content-title"><span class="content-title-in none-essential">복리후생</span></th>
			<td colspan="5" class="input-content">
				<input type="text" id="input-Benefits" class="input-textBox" placeholder="복리후생을 선택해주세요."/>
			</td>
		</tr>
	</table>
</div>
<!-- 접수방법 및 기간 컨테이너 -->
<div id="term-info" class="info-container">
	<!-- 정보입력 전 안내 -->
	<div class="explanation">
		<div class="explanation-header">
			<h3>접수기간과 접수방법은 어떻게 되나요?</h3>
		</div>
		<div class="explanation-footer">
			<p class="explanation-footer-text">구직자는 PC와 모바일 어디서나손쉽게 바로지원 가능한 인크루트 이력서를 선호합니다.</p>
		</div>
	</div>
	<table id="term-content" class="td-inputFrm">
		<!-- 접수기간 -->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수기간</span></th>
			<td colspan="5" class="input-content" style="width: 750px">
				<!-- 시간선택 -->
				<div class="time-container">
					<ul class="inlineblock-select" style="display: inline;">
						<li>
							<input type="text" id="input-term-start" class="input-textBox" placeholder="0000-00-00"/>
						</li>
						<li>
							<input type="text" id="input-term-end" class="input-textBox" placeholder="0000-00-00"/>
						</li>
						<!-- 시 -->
						<li>
							<select class="form-control inlineblock-select fore-select" id="time-hour">
								<option value="시" selected>시</option>
							</select>
						</li>
						<!-- 분 -->
						<li>
							<select class="form-control inlineblock-select fore-select" id="time-min">
								<option value="시" selected>분</option>
							</select>
						</li>
						<!--마감일 -->
						<li>
							<select class="form-control inlineblock-select fore-select" id="time-end">
								<option value="작문능력" selected>마감일지정</option>
							</select>
						</li>
					</ul>
				</div>
			</td>
		</tr>
		<!-- 접수방법-->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수방법</span></th>
			<td colspan="5" class="input-content">
				<!-- 자사시스템 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox' id="how-contact-0" value="1" checked><label for='how-contact-1'>ITHRER 채용 시스템</label> 
				</div>
				<!-- 일반 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox' id="how-contact-1" value="1" ><label for='how-contact-1'>자사 홈페이지</label>
					<input type='checkbox' class='ipt-chkBox' id="how-contact-2" value="1" ><label for='how-contact-2'>우편</label>
					<input type='checkbox' class='ipt-chkBox' id="how-contact-3" value="1" ><label for='how-contact-3'>팩스</label>
					<input type='checkbox' class='ipt-chkBox' id="how-contact-4" value="1" ><label for='how-contact-4'>방문</label>
					<input type='checkbox' class='ipt-chkBox' id="how-contact-5" value="1" ><label for='how-contact-5'>이메일</label>
					<input type='checkbox' class='ipt-chkBox' id="how-contact-6" value="1" ><label for='how-contact-6'>전화/휴대폰</label> 
				</div>
			</td>
		</tr>
		<!-- 접수양식-->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수양식</span></th>
			<td colspan="5" class="input-content">
				<!-- 자사시스템 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox' id="frm-contact-0" value="1" checked><label for='frm-contact-1'>ITHRER 이력서</label> 
				</div>
				<!-- 일반 이용 -->
				<div class="frm-contact">
					<input type='checkbox' class='ipt-chkBox' id="frm-contact-1" value="1" ><label for='frm-contact-1'>자사양식</label>
					<input type='checkbox' class='ipt-chkBox' id="frm-contact-2" value="1" ><label for='frm-contact-2'>자유양식</label>
				</div>
			</td>
		</tr>
		<!-- 전형단계 -->
		<tr class="td-line">
			<th class="content-title"> <div class="essential">* </div><span class="content-title-in">접수양식</span></th>
			<td colspan="5" class="input-content">
				<!-- 자사시스템 이용 -->
				<div class="how-contact">
					<input type='checkbox' class='ipt-chkBox' id="frm-contact-0" value="1" checked><label for='frm-contact-1'>ITHRER 이력서</label> 
				</div>
				<!-- 일반 이용 -->
				<div class="frm-contact">
					<input type='checkbox' class='ipt-chkBox' id="frm-contact-1" value="1" ><label for='frm-contact-1'>자사양식</label>
					<input type='checkbox' class='ipt-chkBox' id="frm-contact-2" value="1" ><label for='frm-contact-2'>자유양식</label>
				</div>
			</td>
		</tr>
	</table>
</div>
<br /><br /><br /><br /><br /><br /><br /><br />
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- 스크립트 영역 -->
<script>
/* 체크된게 있는지 확인하여 div를 숨기고 보이는 함수 */
function isChecked()
{
	//내가 선택한 클래스들 중에 한개라도 체크된게 없어?
	if(!($(".ipt-chkBox").prop("checked")))
	{
		$("#job-code-result-Div").hide();
	}
	else
	{
		$("#job-code-result-Div").show();
	}
}
/* 모집직급/직책 선택 시 input태그에 추가하기 */
$(".ipt-chkBox").on("click", function(){
	isChecked();
	console.log($(this).prop("checked"));
	var resultText = ($(this).next()).text();
	console.log(resultText);
	if($(this).prop("checked"))
	{
		$("#job-select-result").append("<li class='resultJob'>"+resultText+"&nbsp;</li>");	
	}
	else //선택한게 사라지면
	{
	
	}
});
/* 모직직급/직책 팝업 취소 */
$("#position-cancleBtn").on("click", function(){
	$("#position-popup-background").hide(250);
});
/* 모직집급/직책 전체보기 버튼 */
function positionAllBtn()
{
	$("#position-popup-background").show(250);
}
/* 기간 직접입력 선택 시 - 알바 */
function input_date_check_rbar(str)
{
	if(str == "myinputDate-rbar")
	{
		$("#hiddenDiv-Date-rbar").css("display", "inline");
		$("#hiddenDiv-Date-rbar").show();
		
	}
	else
	{
		$("#hiddenDiv-Date-rbar").hide();
		
	}
}
/* 기간 직접입력 선택 시 - 위촉 */
function input_date_check_commision(str)
{
	if(str == "myinputDate-commision")
	{
		$("#hiddenDiv-Date-commision").css("display", "inline");
		$("#hiddenDiv-Date-commision").show();
		
	}
	else
	{
		$("#hiddenDiv-Date-commision").hide();
		
	}
}
/* 기간 직접입력 선택 시 - 프리랜서 */
function input_date_check_pre(str)
{
	if(str == "myinputDate-pre")
	{
		$("#hiddenDiv-Date-pre").css("display", "inline");
		$("#hiddenDiv-Date-pre").show();
		
	}
	else
	{
		$("#hiddenDiv-Date-pre").hide();
		
	}
}
/* 기간 직접입력 선택 시 - 인턴 */
function input_date_check_inturn(str)
{
	if(str == "myinputDate-inturn")
	{
		$("#hiddenDiv-Date-inturn").css("display", "inline");
		$("#hiddenDiv-Date-inturn").show();
	}
	else
	{
		$("#hiddenDiv-Date-inturn").hide();
	}
}
/* 기간 직접입력 선택 시 - 계약직 */
function input_date_check_contract(str)
{
	if(str == "myinputDate-contract")
	{
		$("#hiddenDiv-Date-Contract").css("display", "inline");
		$("#hiddenDiv-Date-Contract").show();
	}
	else
	{
		$("#hiddenDiv-Date-Contract").hide();
	}
}
/* 알바 */
var checked_rbar = false;
$("#Employ_Ty_Cd_7").on("click", function(){
	checked_rbar = checked_rbar==true?false:true;
	if(checked_rbar == true) $("#employType6").show();
	else $("#employType6").hide();
});
/* 위촉직 */
var checked_commision = false;
$("#Employ_Ty_Cd_6").on("click", function(){
	checked_commision = checked_commision==true?false:true;
	if(checked_commision == true) $("#employType5").show();
	else $("#employType5").hide();
});
/* 프리랜서 */
var checked_pre = false;
$("#Employ_Ty_Cd_5").on("click", function(){
	checked_pre = checked_pre==true?false:true;
	if(checked_pre == true) $("#employType4").show();
	else $("#employType4").hide();
});
/* 인턴 */
var checked_inturn = false;
$("#Employ_Ty_Cd_4").on("click", function(){
	checked_inturn = checked_inturn==true?false:true;
	if(checked_inturn == true) $("#employType3").show();
	else $("#employType3").hide();
});
/* 병역특례 클릭 시 히든내용 view */
var checked_ms = false;
$("#Employ_Ty_Cd_3").on("click", function(){
	checked_ms = checked_ms==true?false:true;
	if(checked_ms == true) $("#employType2").show();
	else $("#employType2").hide();
});
/* 계약직 클릭 시 히든내용 view */
var checked_contract = false;
$("#Employ_Ty_Cd_2").on("click", function(){
	checked_contract = checked_contract==true?false:true;
	if(checked_contract == true) $("#employType1").show();
	else $("#employType1").hide();
});
/* 정규직 클릭 시 히든내용 view */
var checked_regular = false;
$("#Employ_Ty_Cd_1").on("click", function(){
	checked_regular = checked_regular==true?false:true;
	if(checked_regular == true) $("#employType0").show();
	else $("#employType0").hide();
});
/* 페이지 완전로딩 후 뷰 */
$(document).ready(function(){
	$("html").css("display", "block");
});
/* 경력 - 경력, 신입경력에서 연차무관을 선택할 경우 : 초기화 후 읽기전용 속성으로 변경 */
var checked_irrelevant_crr = false;
$("#irrelevant-crr").on("click", function(){
	checked_irrelevant_crr = checked_irrelevant_crr==true?false:true;
	
	if(checked_irrelevant_crr == true)
	{
		//연차입력사항 확인
		var crrCntUp = $("#crr-cntUp option:selected").text();
		var crrCntDown = $("#crr-cntDown option:selected").text();
		if(crrCntUp != "선택" || crrCntDown != "선택")
		{
			if(confirm("연차무관을 체크하면 직접선택한 연차가 초기화 됩니다.") == true)
			{
				$("#crr-cntUp option, #crr-cntDown option").removeAttr("selected");
				$("#crr-cntUp option").first().attr("selected", "selected");
				$("#crr-cntDown option").first().attr("selected", "selected");
				$("#crr-cntUp, #crr-cntDown").attr("disabled", "disabled");	
			}
			else
			{
				checked_irrelevant_crr = checked_irrelevant_crr==true?false:true;
				$("#irrelevant-crr").prop("checked", false);
			}
		}
	}
	else
	{
		$("#crr-cntUp, #crr-cntDown").removeAttr("disabled");
	}
});
/* 경력 - 신입 클릭 시 하단폼 삭제 */
$("#new-Crr").on("click", function(){
	$("#normal-Crr-Frm").hide();
});
/* 경력 - 경력, 신입+경력 라디오버튼 클릭 시 하단입력폼 보이기 */
$("#normal-Crr, #total-Crr").on("click", function(){
	$("#normal-Crr-Frm").css("display", "inline-block");
	$("#normal-Crr-Frm").show();
});
/* 모집직종 - 전체보기 - 취소 */
function returnPage()
{
	$("#recruit-popup-background").hide(250);
}
/* 직종에 대한 리스트를 가져와 출력한다. */
function recruitAll()
{
	$("#recruit-popup-background").show(250);
}
/* 팝업창 선택 CSS */
$(".jobList li").on("click", function(){
	$(".jobList-select").removeAttr("style");
	$(this).css("background-color", "blue");
});
</script>

<!-- 스타일 영역 -->
<style>
/* 구분 하위텍스트 */
.subText-Th
{
	font-size: 13px;
	color: #9d9ea0;
}
.explanation
{
	vertical-align: middle;
	text-align: center;
}
.explanation
{
	background-color: #F3F3F3;
	min-height: 150px;
}
.explanation-header h3
{
	font-size: 32px;
	letter-spacing: -0.075em;
	padding-top: 45px;
}
.explanation-footer p
{
	color: #9d9d9d;
	font-size: 14px;
}
/* #1.기본정보 컨테이너 */
.info-container{width: 940px; margin: 0 auto; background-color: #fff; border: 1px solid #f4f4f4; padding: 15px 0 10px 0;}
/* 테이블 */
#subTitle-content{padding-top: 31px; padding-bottom: 12px;}
.td-inputFrm{width: 100%; border-top: 1px solid #505050; margin-left: auto; margin-right: auto;}
/* 내용의 제목 */
.content-title{font-size: 16px; letter-spacing: -0.05em; vertical-align: middle; color: #494949; padding-left: 10px;}
/* 내용의 제목 서브 */
.content-title-in{padding-left: 15px;}
/* 타이틀 내용 */
#title-text{padding-bottom: 11px; border-bottom: 2px solid #344f77; float: left;}
/* 필수사항 특수문자 */
.essential{color: #ed2024; text-align: left; min-height: 27px; font-size: 24px; position: absolute;}
/* 사용자 입력사항 */
.input-content{position: relative; padding: 14px 0 14px 23px; font-size: 15px;}
/* 사용자 입력 - 텍스트 */
.input-textBox{padding: 8px 0 8px 7px; width: 100%; min-height: 48px; border: 1px solid #dadada; border-radius: 3px;}
/* 테이블 하단라인 */
.td-line{border-bottom: 1px solid #ebeced;}
/* 체크박스 간격조정 */
.ipt-chkBox{margin: 3px 3px 3px 17px;}
/* 경력입력 */
.inlineblock-select
{
	list-style: none;
	margin: 0;
	padding: 0;
	border: 0;
	display: block;
	min-width: 20%;
}
.inlineblock-select li
{
	float: left;
	width: 135px;
}
.inlineblock-jobExp li span
{
	font-size: 15px;
	line-height: 34px;
}
.radioDef
{
	background: url("라디오버튼 이미지 삽입하기");
}
.radio-select
{
	margin: 0;
	padding: 0;
}
/* 비필수사항 */
.none-essential
{
	color: #9d9ea0;
}
/* 모집인원 */
#input-cnt, #input-cnt-month, #input-cnt-month2, #input-cnt-month3, #input-cnt-month4, #input-cnt-month5, #input-cnt-month6, #input-cnt-workMonth
{
	width: 50px;
}
/* 지원자격 및 우대조건 */
.form-control
{
	width: 25%;
	position: relative;
	display: inline;
}
/* 외국어 select 설정 */
.fore-select
{
	width: 72%;
	border: 1px solid lightgray;
}
.fore-select option
{
	border: 1px solid lightgray;
}
ul.inlineblock-select li
{
	margin-right: 3px;
}
.fore-setting, .near-setting
{
	display: grid;
	padding-bottom: 10px;
}
/* 컴퓨터활용능력 입력 스타일 설정 */
.computer-abilityUl li
{
	width: 200px;
}
/* 접수기간 및 방법 컨테이너 */
/* 접수기간 */
#input-term-start, #input-term-end
{
	width: 100px;
}
.time-container
{
	display: inline;
}

/* 세부조정 */
/* 모집직종 */
#input-job
{
	width: 85%;
}
#recruit-btn
{
	position: absolute;
	height: 48px;
	margin-left: 10px;
}
#recruit-popup-background
{
	z-index: 1;
	position: fixed;
	background-color: rgba(0,0,0, 0.4);
	min-height: 100%;
	min-width: 100%;
	display: none;
}
#recruit-popup
{
	width: 700px;
	height: 530px;
	background-color: white;
	vertical-align: middle;
	display: inline-block;
	margin-top: 50px;
}
.popup-background
{
	text-align: center;
}
#borderDiv
{
	border: 1px solid #dcdcdc;
	width: 90%;
	height: 57%;
	display: inline-block;
}
.popup-textTitle
{
	float: left;
	padding-left: 32px;
	padding-bottom: 15px;
	padding-top: 25px;
}
.borderDiv-Part
{
	border: 1px solid #dcdcdc;
	min-width: 50%;
	min-height: 100%;
	display: inline-block;
	float: left;
	overflow:scroll;
	overflow-x: hidden;
}
.jobList, .jobList2
{
	float: left;
	list-style: none;
	padding-left: 0;
	overflow-x: hidden;
}
.jobList li, .jobList2 li
{
	width: 295px;
	text-align: left;
	padding-left: 15px;
}
#result-jobList
{
	width: 100%;
	height: 20%;
	border: 1px solid #dcdcdc;
	float: left;
	display: inline-block;
	background-color: #f8f9fb;
}
.jobList-select, .jobList-select2
{
	min-height: 37px;
	padding-top: 4px;
}
.configBtn
{
	width: 110px;
	margin-right: 10px;
}
#configFrm
{
	display: inline-block;
	padding-top: 18px;
}
.result-jobSelect
{
	margin-left: 12px;
	margin-top: 14px;
	float: left;
}
.hiddenDiv
{
	background-color: #e3e3e4;
	min-width: 100%;
	display: none;
}
/* 경력 */
#normal-Crr-Frm
{
	min-height: 70px;
}
#recruitment
{
	padding-top: 14px !important;
}
/* 고용형태 */
.hiddenTitle
{
	font-size: 14px;
}
.employ-chkbox
{
	margin-left: 0px;
}
#workDateRange, #workDateRange-inturn, #workDateRange-Commission, #workDateRange-rbar, .work-dateCntType
{
	width: 1%;
	min-height: 48px;
}
.work-dateCntType
{
	min-width: 14% !important;
}
.ms-select
{
	margin-bottom: 0px;
}
.date-cnt
{
	width: 10%;
}
.hiddenDiv-Date
{
	display: none;
}
.content-content
{
	font-size: 13px !important;
}
#employ-ChangeLabel
{
	font-size: 14px !important;
}
/* 모집직책/직급 팝업 */
/* 검은필터 */
.popup-background
{
	z-index: 1;
	position: fixed;
	background-color: rgba(0,0,0, 0.4);
	min-height: 100%;
	min-width: 100%;
	display: none;
}
/* 팝업배경 */
.popup
{
	width: 700px;
	height: 530px;
	background-color: white;
	vertical-align: middle;
	display: inline-block;
	margin-top: 50px;
}
/* 팝업 제목 */
#textTitle-position
{
	text-align: left;
	min-width: 100%;
}
/* 테이블 */
#position-Table
{
	margin-left: 32px;
}
#position-Table, #position-Table tr, #position-Table th, #position-Table td
{
	border: 1px solid #dcdcdc;
}
#position-Table th
{
	width: 63px;
	text-align: center !important;
}
#position-Talbe td
{
	width: 570px;
}
.positionPopup
{
	width: 570px;
}
.position-th
{
	background-color: #dcdcdc;
}
#btnDiv
{
	margin-top: 12px;
}
.position-defaultChx
{
	margin-bottom: 0px;
}
#position-AllBtn
{
	margin-bottom:2px;
	margin-left: 10px;
}
.resultJob
{
	list-style: none;
	float: left;
}
#job-code-result-Div
{
	min-height: 50px;
	min-width: 700px;
}
#job-code-result-Div
{

}
</style>