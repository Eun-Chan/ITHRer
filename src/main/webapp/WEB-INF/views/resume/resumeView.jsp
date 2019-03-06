<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/resume/categoryMenu.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/resume.css" />
<br /><br />
<div name="container" class="container">
<form class="resumeResultFrm" name = "resumeFrm" id = "resumeFrm" 
	  method="post" action="${pageContext.request.contextPath}/resume/saveResume.do" 
	  encType="multipart/form-data" onsubmit = "return checkNull()">
	 
<br /><br />
<div id="resumeTitle" class="input-group input-group-lg">
	<input type="text" name="userResumeTitle" id="userResumeTitle" 
		   class="form-control" aria-label="Sizing example input" 
		   aria-describedby="inputGroup-sizing-lg" placeholder="기업에게 나에 대해 알려줍시다.강점,목표,관심분야도 좋아요."/>
	<input type="hidden" name="memberIdHide" value="${member.memberId}" />
</div>
<div id="profileTotal" class="wrap-container">
	<h3>인적사항</h3>
	<div id="profileWrap">
		<div id="formProfile1" class="input-group-prepend">
			<input type="text" id="name" name="name" class="form-control" placeholder="이름" value = "${profile.name}"/>
			<input type="text" id="birth" name="birth" class="form-control" placeholder="생년월일(예.1991.01.01)" value = "${profile.birth}"/>
			<select id="gender" name="gender" class="custom-select">
				<option value="" disabled selected>성별</option>
			 	<option value="M" ${profile.gender == 'M  '?'selected="selected"':"" }>남</option>								
		 		<option value="F" ${profile.gender == 'F  '?'selected="selected"':"" }>여</option>								
			</select>
			<input type="email" id="email" name="email" class="form-control" placeholder="이메일" value = "${profile.email}"/>
		</div>
		<div id="formProfile2" class="input-group-prepend">
			<input type="tel" id="phone" name="phone" class="form-control" 
				   placeholder="전화번호(010-1234-5678)" maxlength="13"
				   onkeydown="validateText(event)" value = "${profile.phone}"/>
			<input type="text" id="address" name="address" class="form-control" placeholder="주소" value = "${profile.address}"/>	
		</div>		
	</div>
</div>
<div id="educationTotal" class="wrap-container">
	<div id="educationHeader">
		<div id="headerText">
			<h3>학력</h3>		
		</div>
		<div id="headerInput">
			<input type="checkbox" name="nonHigh" id="nonHigh" value="nonHigh"
			${education.nonHigh[0] == "nonHigh"?'checked':''}/>
			<label for="nonHigh">고등학교 미만 졸업</label>
		</div>
	</div>
	<div id="educationWrap">
		<div id="formEducation">
			<div id="deleteBox">
				<button type="button" id="deleteEdu" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formEducation1" class="input-group-prepend">
				<ul>
					<li>
						<select id="graduaction0" name = "graduaction" class="custom-select">
							<option value="" disabled selected>학교구분</option>
							<option value="high">고등학교</option>
							<option value="shortUniver">대학(2,3년)</option>
							<option value="longUniver">대학교(4년)</option>			
							<option value="graduate">대학원</option>			
						</select>
					</li>
					<li>
						<input type="text" name="schoolName" id="schoolName0" class="form-control" placeholder="학교명" value="${education.schoolName}"/>						
					</li>
				</ul>
				<div name="searchHidden" id="searchHidden0"></div>
			</div>
			<div id="formEducation3" class="input-group-prepend">
				<ul>
					<li><input type="text" name="admissionDate" id="admissionDate0" class="form-control" placeholder="입학년월"/></li>
					<li><input type="text" name="graduationDate" id="graduationDate0" class="form-control" placeholder="졸업년월"/></li>
					<li>
						<select name="graducationstate" id="graducationstate0" class="custom-select">
							<option value="" disabled selected>졸업상태</option>
							<option value="graduated">졸업</option>
							<option value="completion">수료</option>
							<option value="ungraduated">졸업예정</option>
							<option value="restschool">휴학</option>
							<option value="leaveschool">중퇴</option>
						</select> 
					</li>
					<li>
						<input type="checkbox" name="transfer" id="transfer0" aria-label="Checkbox for following text input" 
						value="transfer" ${education.transfer[0] == "transfer"?'checked':''}/>&nbsp;편입
					</li>
				</ul>
			</div>
			<div id="formEducation4" class="input-group-prepend">
				<ul>
					<li><input type="text" class="form-control" name="major" id="major0" placeholder="전공명"/></li>
					<li><input type="text" class="form-control" name="score" id="score0" placeholder="학점"/></li>
					<li>
						<select name="totalscore" id="totalscore0" class="custom-select">
							<option value="" disabled selected>총점</option>
							<option value="4.5">4.5</option>
							<option value="4.3">4.3</option>
							<option value="4.0">4.0</option>
							<option value="100">100</option>
						</select>
					</li>
					<li>
						<select name="degree"id="degree0" class="custom-select eduDegree">
							<option value="" disabled selected>학위</option>
							<option value="master">석사</option>
							<option value="doctor">박사</option>
							<option value="boss">석박사</option>
						</select> 
					</li>
				</ul>
			</div>
			<div id="formEducation5">
				<button type ="button" name="otherDepartment" id="otherDepartment0">다른전공</button>
				<button type ="button" name="senierProject"id="senierProject0">졸업 논문/작품</button>
				<ul>
					<li>
						<select name="otherDepartSel" id="otherDepartSel0" class="custom-select">
							<option value="" disabled selected>전공선택</option>
							<option value="submajor">부전공</option>
							<option value="multimajor">복수전공</option>
							<option value="doublemajor">이중전공</option>
						</select>
					</li>
					<li>
						<input type="text" name="secmajor" id="secmajor0" class="form-control" placeholder="전공명"/>
					</li>
				</ul>
				<ul>
					<li>
						<textarea name="otherDepartText" id="otherDepartText0" class="form-control" aria-label="With textarea" placeholder="졸업/논문작품"></textarea>
					</li>
				</ul>
			</div>
			<div id="formEducation2" class="input-group-prepend">
				<ul>
					<li><input type="text" name="highgraduationDate" id="highgraduationDate0" class="form-control" placeholder="졸업년도"/></li>
					<li>
						<select name="highgraduationState" id="highgraduationState0" class="custom-select">
							<option value="" disabled selected>졸업상태</option>
							<option value="graduated">졸업</option>
							<option value="ungraduated">졸업예정</option>
						</select> 
					</li>
					<li>
						<input type="checkbox" name="ged" id="ged0" aria-label="Checkbox for following text input" value="ged"/>&nbsp;대입검정고시
					</li>
				</ul>	
			</div>
		</div>
	</div>
	<div id="buttonEducation" class="input-group-prepend">
		<button type="button" id="addEducation" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<div id="hopeworkTotal" class="wrap-container">
	<h3>희망근무조건</h3>
	<div id="hopeworkWrap">
		<div id="formHopework1" class="input-group-prepend input-group-text">
			<ul>
				<li>
					<input type="text" name="jobType" id="jobType" class="form-control" placeholder="고용형태" value="${hopework.jobType}"/>
				</li>
				<li>
					<input type="text" name="wantPay" id="wantPay" class="form-control" onkeydown="validateText(event)" placeholder="희망연봉(단위 :만원)" value="${hopework.wantPay}"/>
				</li>
				<li>
					<input type="checkbox" name="visitDetermine" id="visitDetermine" 
						   value="visitDetermine" aria-label="Checkbox for following text input"
						   ${hopework.visitDetermine[0] == "visitDetermine"?'checked':''}/>&nbsp;면접 후 결정				
				</li>
			</ul>
		</div>
		<div id="formHopework2" class="input-group-prepend">
			<ul>
				<li>희망근무지 :</li>
				<li>
					<textarea name="hopePlace" id="hopePlace" class="form-control" aria-label="With textarea">${hopework.hopePlace}</textarea>
				</li>
			</ul>
		</div>
		<div id="formHopework3" class="input-group-prepend">
			<ul>
				<li>직무,산업,키워드 :</li>
				<li>
					<textarea name="hopeDuty" id="hopeDuty" class="form-control" aria-label="With textarea">${hopework.hopeDuty}</textarea>		
				</li>
			</ul>
		</div>
	</div>
</div>
<div id="internTotal" class="wrap-container" style="display:none;">
	<h3>인턴,대외활동</h3>
	<div id="internWrap">
		<div id="formIntern">
			<div id="deleteBox">
				<button type="button" id="deleteIT" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formIntern1" class="input-group-prepend">
				<select name="internDivision" id="internDivision0" class="custom-select">
					<option value="" disabled selected>활동구분</option>
					<option value="intern">인턴</option>
					<option value="alba">아르바이트</option>
					<option value="circles">동아리</option>
					<option value="volunteer">자원봉사</option>
					<option value="socialActivity">사회활동</option>
					<option value="schoolActivity">교내활동</option>
				</select>
				<input type="text" name="socialInst" id="socialInst0" class="form-control" placeholder="회사/기관/단체명"/>
				<input type="text" name="internstartDate" id="internstartDate0" class="form-control" placeholder="시작년월(예.1991.01)"/>
				<input type="text" name="internendDate" id="internendDate0" class="form-control" placeholder="종료년월(예.2019.01)"/>
			</div>
			<div id="formIntern2" class="input-group-prepend">
				<ul>
					<li>활동내용 :</li>
					<li><textarea name="internTextarea" class="form-control" aria-label="With textarea" id="internContent0" placeholder="직무와 관련된 경험에 대해 (상황-노력-결과)순으로 작성하는것이 좋습니다."></textarea></li>
				</ul>		
			</div>
		</div>
	</div>
	<div id="buttonIntern" class="input-group-prepend">
		<button type="button" id="addIntern" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<div id="learnTotal" class="wrap-container" style="display:none;">
	<h3>교육</h3>
	<div id="learnWrap">
		<div id="formLearn">
			<div id="deleteBox">
				<button type="button" id="deleteLearn" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formLearn1" class="input-group-prepend">
				<input type="text" name="learnTitle" id="learnTitle0" class="form-control" placeholder="교육명"/>
				<input type="text" name="learnAgency" id="learnAgency0" class="form-control" placeholder="교육기관"/>
				<input type="text" name="learnstartDate" id="learnstartDate0" class="form-control" placeholder="시작년월(예.1991.01)"/>
				<input type="text" name="learnendDate"id="learnendDate0" class="form-control" placeholder="종료년월(예.2019.01)"/>
				<br />
			</div>
			<div id="formLearn2" class="input-group-prepend">
				<ul>
					<li>내용 :</li>
					<li><textarea name="learnTextarea" class="form-control" aria-label="With textarea" id="learnContent0" placeholder="이수하신 교육과정에 대해 적어주세요."></textarea></li>
				</ul>	
			</div>
		</div>
	</div>
	<div id="buttonLearn" class="input-group-prepend">
		<button type="button" id="addLearn" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<div id="certificateTotal" class="wrap-container" style="display:none;">
<h3>자격증</h3>
	<div id="certificateWrap">
		<div id="formCertificate">
			<div id="deleteBox">
				<button type="button" id="deleteCertificate" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formCertificate1" class="input-group-prepend">
				<input type="text" name="certName" id="certName0" class="form-control" placeholder="자격증 명"/>
				<input type="text" name="certPublisher" id="certPublisher0" class="form-control" placeholder="발행처"/>
				<input type="text" name="certDate" id="certDate0" class="form-control"placeholder="취득년월(예.2019.01)"/>
			</div>
			<div name="showCertificate"></div>
		</div>
	</div>
	<div id="buttonCert" class="input-group-prepend">
		<button type="button" id="addCert" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<div id="awardTotal" class="wrap-container" style="display:none;">
	<h3>수상</h3>
	<div id="awardWrap">
		<div id="formAward">
			<div id="deleteBox">
				<button type="button" id="deleteAward" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formAward1" class="input-group-prepend">
				<input type="text" name="awardName" id="awardName0" class="form-control" placeholder="수상명"/>
				<input type="text" name="awardAgency" id="awardAgency0" class="form-control" placeholder="수여기관"/>
				<input type="text" name="awardDate" id="awardDate0" class="form-control" placeholder="수상연도(예.2019)"/>
			</div>
			<div id="formAward2" class="input-group-prepend">
				<ul>
					<li>수여내용 :</li>
					<li><textarea name="awardTextarea" class="form-control" aria-label="With textarea" id="awardContent0" placeholder="수여 내용 및 결과를 자세히 입력해주세요."></textarea></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="buttonAward" class="input-group-prepend">
		<button type="button" id="addAward" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<div id="overseasTotal" class="wrap-container" style="display:none;">
	<h3>해외경험</h3>
	<div id="overseasWrap">
		<div id="formOverseas">
			<div id="deleteBox">
				<button type="button" id="deleteOverseas" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formOverseas1" class="input-group-prepend">
				<input type="text" name="country" id="country0" class="form-control" placeholder="국가명"/>
				<input type="text" name="overseasstartDate" id="overseasstartDate0" class="form-control" placeholder="시작년월(예.1991.01)" />
				<input type="text" name="overseasendDate" id="overseasendDate0" class="form-control" placeholder="종료년월(예.2019.01)" />
			</div>
			<div id="formOverseas2" class="input-group-prepend">
				<ul>
					<li>내용 :</li>
					<li><textarea name="overseasTextarea" class="form-control" aria-label="With textarea" id="overseasContent0" placeholder="해외에서 어떤 경험을 했는지 적어주세요.(ex.어학연수,교환학생,워킹홀리데이,해외근무)"></textarea></li>
				</ul>					
			</div>
		</div>
	</div>
	<div id="buttonOverseas" class="input-group-prepend">
		<button type="button" id="addOverseas" class="btn btn-outline-info">해외경험 추가</button>	
	</div>
</div>
<div id="languageTotal" class="wrap-container" style="display:none;">
	<h3>어학</h3>
	<div id="languageWrap">
		<div id="formLanguage" class="input-group-prepend">
			<div id="deleteBox">
				<button type="button" id="deleteLanguage" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formLanguage1" class="input-group-prepend">
				<select name="languageDivision" id="languageDivision0" class="custom-select">
					<option value="" disabled selected>구분</option>
					<option value="speakingAbility">회화능력</option>
					<option value="standardExam">공인시험</option>
				</select>
				<select name="languageName" id="languageName0" class="custom-select language-select">
					<option value="" disabled selected>외국어명</option>
					<option value="english">영어</option>
					<option value="japanese">일본어</option>
					<option value="chinese">중국어</option>
					<option value="selfSelect">직접입력</option>
				</select>
				<input type="text" name="selfText" id="selfText0" class="form-control"/>
				<select name="speakingDivision" id="speakingDivision0" class="custom-select">
					<option value="" disabled selected>회화능력</option>
					<option value="good">일상회화 가능</option>
					<option value="better">비즈니스 회화가능</option>
					<option value="best">원어민 수준</option>
				</select>
			</div>
			<div id="formLanguage2" class="input-group-prepend">
				<select name="examName" id="examName0" class="custom-select">
					<option value="" disabled selected>공인시험</option>
					<option value="etc">기타</option>
					<option value="selfExam">직접입력</option>
				</select>
				<input type="text" name="selfExam" id="selfExam0" class="form-control"/>
				<input type="text" name="examscore" id="examscore0" class="form-control" placeholder="급수/점수"/>
				<input type="text" name="examDate" id="examDate0" class="form-control" placeholder="취득년월(예.1991.01)"/>
			</div>
		</div>
	</div>
	<div id="buttonLanguage" class="input-group-prepend">
		<button type="button" id="addLanguage" class="btn btn-outline-info">어학 추가</button>	
	</div>
</div>
<div id="potfolioTotal" class="wrap-container" style="display:none;">
	<h3>포트폴리오</h3>
	<div id="potfolioWrap">
		<div id="deleteBox">
			<button type="button" id="deletePotfolio" class="deleteWrap">
				<span aria-hidden="true">X</span>
			</button>
		</div>
		<div id="formpotfolio" class="input-group-prepend">
			<span>
				<button type="button" id="addUrl" class="btn btn-outline-info">URL추가</button>
			</span>
			<span>
				<button type="button" id="addFile" class="btn btn-outline-info">파일추가</button>
			</span>
		</div>
		<div id="potfolioList" class="input-group-prepend"></div>
	</div>
</div>
<div id="preferenceTotal" class="wrap-container" style="display:none;">
	<h3>취업우대</h3>
	<div id="preferenceWrap">
		<div id="deleteBox">
			<button type="button" id="deletePreference" class="deleteWrap">
				<span aria-hidden="true">X</span>
			</button>
		</div>
		<div id="formPreference" class="input-group-prepend">
			<div id="divCheckbox">
				<ul>
					<li>
						<input type="checkbox" name="preferCheck" id="veteran" aria-label="Checkbox for following text input" value="veteran"/>
						<label for="veteran">보훈대상</label>
					</li>
					<li>
						<input type="checkbox" name="preferCheck" id="protected" aria-label="Checkbox for following text input" value="protected"/>
						<label for="protected">취업보호 대상</label>
					</li>
					<li>
						<input type="checkbox" name="preferCheck" id="subsidy" aria-label="Checkbox for following text input" value="subsidy"/>
						<label for="subsidy">고용지원금 대상</label>	
					</li>
					<li>
						<input type="checkbox" name="preferCheck" id="disorder" aria-label="Checkbox for following text input" value="disorder"/>
						<label for="disorder">장애</label>
					</li>
					<li>
						<input type="checkbox" name="preferCheck" id="military" aria-label="Checkbox for following text input" value="military"/>
						<label for="military">병역</label>
					</li>
				</ul>
			</div>
		</div>
		<div id="preferselect">
			<div id="preferdisorder" class="input-group-prepend">
				장애 :
				<select name="disoderselect" id="disoderselect" class="custom-select">
					<option value="" disabled selected>장애 등급</option>
					<option value="grade1">1급</option>
					<option value="grade2">2급</option>
					<option value="grade3">3급</option>
					<option value="grade4">4급</option>
					<option value="grade5">5급</option>
					<option value="grade6">6급</option>						
				</select>
			</div>
			<div id="prefermilitary" class="input-group-prepend">
				병역 : 
				<select name="militaryselect" id="militaryselect" class="custom-select">
					<option value="" disabled selected>병역</option>
					<option value="armygo">군필</option>
					<option value="armyyet">미필</option>
					<option value="armyfree">면제</option>
					<option value="armynot">해당없음</option>
				</select>
			</div>
		</div>
	</div>
</div>
<div id="letterTotal" class="wrap-container" style="display:none;">
	<h3>자기소개서</h3>
	<div id="letterWrap">
		<div id="formLetter">
			<div id="buttonLetter" class="input-group-prepend">
				<button type="button" id="addLetter" class="btn btn-outline-info">추가</button>	
			</div>
		</div>
	</div>
</div>
<div id="careerTotal" class="wrap-container" style="display:none;">
	<h3>경력</h3>
	<div id="careerWrap">
		<div id="formCareer">
			<div id="deleteBox">
				<button type="button" id="deleteCareer" class="deleteWrap">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formCareer1" class="input-group-prepend input-group-text">
				<ul>
					<li>
						<input type="text" name= "corpName" id="corpName0" class="form-control" placeholder="회사명"/>
					</li>
					<li>
						<input type="text" name="department" id="department0" class="form-control" placeholder="부서명"/>
					</li>
					<li>
						<input type="text" name="hiredDate" id="hiredDate0" class="form-control" placeholder="입사년월(예.1991.01)"/>
					</li>
					<li>
						<input type="text" name="retiredDate" id="retiredDate0" class="form-control" placeholder="퇴사년월(예.2019.01)"/>
					</li>
					<li>
						<input type="checkbox" name="buttonWorking" id="buttonWorking0" value="working" aria-label="Checkbox for following text input"/>&nbsp;재직중
					</li>
				</ul>
			</div>
			<div id="formCareer2" class="input-group-prepend  input-group-text">
				<ul>
					<li>
						<input type="text" name="jobposition" id="jobposition0" class="form-control" placeholder="직급/직책"/>
					</li>
					<li>
						<input type="text" name="job" id="job0" class="form-control" placeholder="직무"/>
					</li>
					<li>
						<input type="text" name="income" id="income0" class="form-control" onkeydown="validateText(event)" placeholder="연봉(단위 :만원)"/>
					</li>
				</ul>
			</div>
			<div id="formCareer3" class="input-group-prepend">
				<ul>
					<li>담당업무 :</li>
					<li><textarea name="description" class="form-control" aria-label="With textarea" id="description0" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."/></textarea></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="buttonCareer" class="input-group-prepend">
			<button type="button" id="addCareer" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<div id="finishButtonWrap" class="input-group-prepend">
	<button type="button" id="homeButton" onclick="location='${pageContext.request.contextPath}'" class="btn btn-light">뒤로가기</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" id="saveButton" class="btn btn-primary">수정하기</button>
</div>
</form>
</div>
<script>
var langFrmcount = 1;
var OverseasFrmcount = 1;
var AwardFrmcount = 1;
var certFrmcount = 1;
var learnFrmcount = 1;
var internFrmcount= 1;
var eduFrmcount = 1;
var careerFrmcount = 1;
var fotFrmcount = 0;
var fotFilecount = 0;
var otherDepartcnt = 0;
var otherDeparttextcnt = 0;
/* 영어 막기*/
function validateText(event) {
	var code = event.keyCode;
	if (code > 96 && code < 123) {
		event.preventDefault();		
	}
	else {
	   return;
	}
}
/* 항목지우기 */
$(".deleteWrap").on("click",function() {
	$(this).parents(".wrap-container").hide();
});
/* 학력 */
$("#nonHigh").change(function(){
	if($(this).prop('checked')) {
		$('#educationWrap').hide();
		$('#educationWrap input').val('');
		$('#educationWrap select').val('');
		$('#educationWrap textarea').val('');
	}
	else {
		$('#educationWrap').show();
	}
});
/* 자동완성창 */
$(document).on("keypress","input[name=schoolName]",function() {
	var selectval = $(this).parent().parent().find("select[name=graduaction]").val();
	var divsearch = $(this).parent().parent().parent().find("div[name=searchHidden]");
	var searchKeyword = $(this).parent().parent().find("input[name=schoolName]").val();
	if (event.keyCode === 13) {
        event.preventDefault();
    }
	if(selectval == 'high') {
		divsearch.show();
		$.ajax({
			url : "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=1511a833705c3185adf10f04ecfff3e3&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&searchSchulNm="+searchKeyword,
			success : function(data) {
				var showul = $("<ul></ul>");
				for(var i in data.dataSearch.content) {
					var html = "<a><li>"+data.dataSearch.content[i].schoolName+"</li></a>";
					
					showul.append(html);
				}
				
				divsearch.html(showul);
			},
			error : function() {
				console.log("실패");
			}
		});
	}
	else if(selectval == 'shortUniver' || selectval == 'longUniver' || selectval == 'graduate'){
		divsearch.show();
		$.ajax({
			url : "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=1511a833705c3185adf10f04ecfff3e3&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&searchSchulNm="+searchKeyword,
			success : function(data) {
				var showul = $("<ul></ul>");
				for(var i in data.dataSearch.content) {
					var html = "<a><li>"+data.dataSearch.content[i].schoolName+"</li></a>";
					showul.append(html);
				}
				
				divsearch.html(showul);
			},
			error : function() {
				console.log("실패");
			}
		});
	}
	else {
		divsearch.hide();
	}
});
$(document).on("click","div[name=searchHidden] a",function() {
	var output = $(this).children().text();
	var input = $(this).parent().parent().parent().find("input[name=schoolName]");
	input.val(output);
	$(this).parent().parent().hide();
});
$(document).on("change","select[name=graduaction]",function() {
	var state = $(this).val();
	var searchKeyword = $("input[name=schoolName]").val();
	if(state =='high') {
		$(this).parent().parent().parent().parent().children("#formEducation2").show();
		$(this).parent().parent().parent().parent().children("#formEducation3").hide();
		$(this).parent().parent().parent().parent().children("#formEducation3 input").val('');
		$(this).parent().parent().parent().parent().children("#formEducation3 select").val('');
		$(this).parent().parent().parent().parent().children("#formEducation4").hide();
		$(this).parent().parent().parent().parent().children("#formEducation4 input").val('');
		$(this).parent().parent().parent().parent().children("#formEducation4 select").val('');
		$(this).parent().parent().parent().parent().find("select[name=degree]").hide();
		$(this).parent().parent().parent().parent().find("select[name=degree]").val('');
		$(this).parent().parent().parent().parent().children("#formEducation5").hide();
		$(this).parent().parent().parent().parent().children("#formEducation5 select").val('');
		$(this).parent().parent().parent().parent().children("#formEducation5 textarea").val('');
	}
	else if(state == 'shortUniver' || state == 'longUniver') {
		$(this).parent().parent().parent().parent().children("#formEducation2").hide();
		$(this).parent().parent().parent().parent().children("#formEducation2 input").val('');
		$(this).parent().parent().parent().parent().children("#formEducation2 select").val('');
		$(this).parent().parent().parent().parent().children("#formEducation3").show();
		$(this).parent().parent().parent().parent().children("#formEducation4").show();
		$(this).parent().parent().parent().parent().find("select[name=degree]").hide();
		$(this).parent().parent().parent().parent().find("select[name=degree]").val('');
		$(this).parent().parent().parent().parent().children("#formEducation5").show();
	}
	else {
		$(this).parent().parent().parent().parent().children("#formEducation2").hide();
		$(this).parent().parent().parent().parent().children("#formEducation2 input").val('');
		$(this).parent().parent().parent().parent().children("#formEducation2 select").val('');
		$(this).parent().parent().parent().parent().children("#formEducation3").show();
		$(this).parent().parent().parent().parent().children("#formEducation4").show();
		$(this).parent().parent().parent().parent().find("select[name=degree]").show();
		$(this).parent().parent().parent().parent().children("#formEducation5").show();
	}
});
$(document).on("change","input[name=ged]",function() {
	if($(this).prop('checked')) {
		$(this).parent().parent().find("select").hide(); /* 졸업상태 */
		$(this).parent().parent().find("select").val(''); /* 졸업상태 */
		$(this).parent().parent().find("input:text").attr("placeholder","합격년도")/* 졸업년도 */
		$(this).parent().parent().parent().parent().find("div#formEducation1").find("input:text").attr("placeholder",""); /* 학교명 */
		$(this).parent().parent().parent().parent().find("div#formEducation1").find("input:text").val("대입자격검정고시"); /* 학교명 */
	}
	else {
		$(this).parent().parent().find("select").show(); /* 졸업상태 */
		$(this).parent().parent().find("input:text").attr("placeholder","졸업년도")/* 졸업년도 */
		$(this).parent().parent().parent().parent().find("div#formEducation1").find("input:text").attr("placeholder","학교명"); /* 학교명 */
		$(this).parent().parent().parent().parent().find("div#formEducation1").find("input:text").val(""); /* 학교명 */
	}
});
/* 값들어온만큼 append시키기 */
var eduStr = "${education.graduaction}";
var eduArr = eduStr.split(',');
for(var eduFrmcount=1;eduFrmcount<=eduArr.length-1;eduFrmcount++) {
	var html = '<div id="formEducation"><div id="deleteBox"><button type="button" id="deleteEdu" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formEducation1" class="input-group-prepend"><ul><li><select id="graduaction'+eduFrmcount+'" name = "graduaction" class="custom-select"><option value="" disabled selected>학교구분</option>';
	html += '<option value="high">고등학교</option><option value="shortUniver">대학(2,3년)</option><option value="longUniver">대학교(4년)</option><option value="graduate">대학원</option></select></li>';
	html += '<li><input type="text" name="schoolName" id="schoolName'+eduFrmcount+'" class="form-control" placeholder="학교명"/></li><div name="searchHidden" id="searchHidden'+eduFrmcount+'"></div></ul></div>';
	html += '<div id="formEducation3" class="input-group-prepend"><ul><li><input type="text" name="admissionDate" id="admissionDate'+eduFrmcount+'" class="form-control" placeholder="입학년월"/></li>';
	html += '<li><input type="text" name="graduationDate" id="graduationDate'+eduFrmcount+'" class="form-control" placeholder="졸업년월"/></li>';
	html += '<li><select name="graducationstate" id="graducationstate'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option>	<option value="graduated">졸업</option>';
	html += '<option value="completion">수료</option>	<option value="ungraduated">졸업예정</option><option value="restschool">휴학</option><option value="leaveschool">중퇴</option></select></li>';
	html += '<li><input type="checkbox" name="transfer" id="transfer'+eduFrmcount+'" aria-label="Checkbox for following text input" value="transferuni"/>&nbsp;편입</li></ul></div>';
	html += '<div id="formEducation4" class="input-group-prepend"><ul><li><input type="text" class="form-control" name="major" id="major'+eduFrmcount+'" placeholder="전공명"/></li>';
	html += '<li><input type="text" class="form-control" name="score" id="score'+eduFrmcount+'" placeholder="학점"/></li>	<li><select name="totalscore" id="totalscore'+eduFrmcount+'" class="custom-select">';
	html += '<option value="" disabled selected>총점</option><option value="fourdotfive">4.5</option><option value="fourdotthree">4.3</option><option value="fourdotzero">4.0</option>';
	html += '<option value="hundred">100</option></select></li><li><select name="degree"id="degree'+eduFrmcount+'" class="custom-select eduDegree">';
	html += '<option value="" disabled selected>학위</option><option value="master">석사</option><option value="doctor">박사</option><option value="boss">석박사</option></select></li></ul></div>';
	html += '<div id="formEducation5"><button type ="button" name="otherDepartment" id="otherDepartment'+eduFrmcount+'">다른전공</button><button type ="button" name="senierProject" id="senierProject'+eduFrmcount+'">졸업 논문/작품</button>';
	html += '<ul><li><select name="otherDepartSel" id="otherDepartSel'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>전공선택</option><option value="submajor">부전공</option><option value="multimajor">복수전공</option>';
	html += '<option value="doublemajor">이중전공</option></select></li><li><input type="text" name="secmajor" id="secmajor'+eduFrmcount+'" class="form-control" placeholder="전공명"/></li></ul>';
	html += '<ul><li><textarea name="otherDepartText" id="otherDepartText'+eduFrmcount+'" class="form-control" aria-label="With textarea" placeholder="졸업/논문작품"></textarea></li></ul></div>';
	html += '<div id="formEducation2" class="input-group-prepend"><ul><li><input type="text" name="highgraduationDate" id="highgraduationDate'+eduFrmcount+'" class="form-control" placeholder="졸업년도"/></li>';
	html += '<li><select name="highgraduationState" id="highgraduationState'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option><option value="graduated">졸업</option><option value="ungraduated">졸업예정</option></select></li>';
	html += '<li><input type="checkbox" name="ged" id="ged'+eduFrmcount+'" aria-label="Checkbox for following text input" value="ged"/>&nbsp;대입검정고시</li></ul></div></div>';
	$('#educationWrap').append(html);
};

$("#addEducation").on("click",function() {
	var eduFrmcount = eduArr.length;
	var html = '<div id="formEducation"><div id="deleteBox"><button type="button" id="deleteEdu" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formEducation1" class="input-group-prepend"><ul><li><select id="graduaction'+eduFrmcount+'" name = "graduaction" class="custom-select"><option value="" disabled selected>학교구분</option>';
	html += '<option value="high">고등학교</option><option value="shortUniver">대학(2,3년)</option><option value="longUniver">대학교(4년)</option><option value="graduate">대학원</option></select></li>';
	html += '<li><input type="text" name="schoolName" id="schoolName'+eduFrmcount+'" class="form-control" placeholder="학교명"/></li><div name="searchHidden" id="searchHidden'+eduFrmcount+'"></div></ul></div>';
	html += '<div id="formEducation3" class="input-group-prepend"><ul><li><input type="text" name="admissionDate" id="admissionDate'+eduFrmcount+'" class="form-control" placeholder="입학년월"/></li>';
	html += '<li><input type="text" name="graduationDate" id="graduationDate'+eduFrmcount+'" class="form-control" placeholder="졸업년월"/></li>';
	html += '<li><select name="graducationstate" id="graducationstate'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option>	<option value="graduated">졸업</option>';
	html += '<option value="completion">수료</option>	<option value="ungraduated">졸업예정</option><option value="restschool">휴학</option><option value="leaveschool">중퇴</option></select></li>';
	html += '<li><input type="checkbox" name="transfer" id="transfer'+eduFrmcount+'" aria-label="Checkbox for following text input" value="transferuni"/>&nbsp;편입</li></ul></div>';
	html += '<div id="formEducation4" class="input-group-prepend"><ul><li><input type="text" class="form-control" name="major" id="major'+eduFrmcount+'" placeholder="전공명"/></li>';
	html += '<li><input type="text" class="form-control" name="score" id="score'+eduFrmcount+'" placeholder="학점"/></li>	<li><select name="totalscore" id="totalscore'+eduFrmcount+'" class="custom-select">';
	html += '<option value="" disabled selected>총점</option><option value="4.5">4.5</option><option value="4.3">4.3</option><option value="4.0">4.0</option>';
	html += '<option value="100">100</option></select></li><li><select name="degree"id="degree'+eduFrmcount+'" class="custom-select eduDegree">';
	html += '<option value="" disabled selected>학위</option><option value="master">석사</option><option value="doctor">박사</option><option value="boss">석박사</option></select></li></ul></div>';
	html += '<div id="formEducation5"><button type ="button" name="otherDepartment" id="otherDepartment'+eduFrmcount+'">다른전공</button><button type ="button" name="senierProject" id="senierProject'+eduFrmcount+'">졸업 논문/작품</button>';
	html += '<ul><li><select name="otherDepartSel" id="otherDepartSel'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>전공선택</option><option value="submajor">부전공</option><option value="multimajor">복수전공</option>';
	html += '<option value="doublemajor">이중전공</option></select></li><li><input type="text" name="secmajor" id="secmajor'+eduFrmcount+'" class="form-control" placeholder="전공명"/></li></ul>';
	html += '<ul><li><textarea name="otherDepartText" id="otherDepartText'+eduFrmcount+'" class="form-control" aria-label="With textarea" placeholder="졸업/논문작품"></textarea></li></ul></div>';
	html += '<div id="formEducation2" class="input-group-prepend"><ul><li><input type="text" name="highgraduationDate" id="highgraduationDate'+eduFrmcount+'" class="form-control" placeholder="졸업년도"/></li>';
	html += '<li><select name="highgraduationState" id="highgraduationState'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option><option value="graduated">졸업</option><option value="ungraduated">졸업예정</option></select></li>';
	html += '<li><input type="checkbox" name="ged" id="ged'+eduFrmcount+'" aria-label="Checkbox for following text input" value="ged"/>&nbsp;대입검정고시</li></ul></div></div>';
	$('#educationWrap').append(html);
	eduFrmcount++;
});
$(document).on("click","button[name=otherDepartment]",function() {
	console.log("좀오지?");
	$(this).parent().children().eq(2).toggle();
});
$(document).on("click","button[name=senierProject]",function() {
	console.log("좀와주세요");
	$(this).parent().children().eq(3).toggle();
});
$(document).on("click", "textarea[name=otherDepartText]", function() {
	$(this).css("height","100px");
});
$(document).on("mouseout", "textarea[name=otherDepartText]", function() {
	$(this).css("height","75px");
});

/* 희망근무조건 */
$("#hopeDuty").on("click",function() {
	$(this).css("height","100px");
});
$("#hopeDuty").on("mouseout",function() {
	$(this).css("height","75px");
});
/* 경력 */
$(document).on("change","input[name=buttonWorking]",function() {
	$(this).parent().parent().children().eq(3).toggle();
});
$("#addCareer").on("click",function() {
	var html ='<div id="formCareer"><div id="deleteBox"><button type="button" id="deleteCareer" class="deleteWrap"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formCareer1" class="input-group-prepend input-group-text"><ul><li><input type="text" name="corpName" id="corpName'+careerFrmcount+'" class="form-control" placeholder="회사명"/></li>';
	html += '<li><input type="text" name="department" id="department'+careerFrmcount+'" class="form-control" placeholder="부서명"/></li>';
	html += '<li><input type="text" name="hiredDate" id="hiredDate'+careerFrmcount+'" class="form-control" placeholder="입사년월(예.1991.01)"/></li>';
	html += '<li><input type="text" name="retiredDate" id="retiredDate'+careerFrmcount+'" class="form-control" placeholder="퇴사년월(예.2019.01)"/></li>';
	html += '<li><input type="checkbox" name="buttonWorking" id="buttonWorking'+careerFrmcount+'" value="working" aria-label="Checkbox for following text input"/>&nbsp;재직중</li></ul></div>';
	html += '<div id="formCareer2" class="input-group-prepend  input-group-text"><ul><li><input type="text" name="jobposition" id="jobposition'+careerFrmcount+'" class="form-control" placeholder="직급/직책"/></li>';
	html += '<li><input type="text" name= "job" id="job'+careerFrmcount+'" class="form-control" placeholder="직무"/></li>';
	html += '<li><input type="text" name= "income" id="income'+careerFrmcount+'" class="form-control" onkeydown="validateText(event)" placeholder="연봉(단위 :만원)"/></li></ul></div>';
	html += '<div id="formCareer3" class="input-group-prepend"><ul><li>담당업무 :</li><li><textarea name="description" class="form-control" aria-label="With textarea" id="description'+careerFrmcount+'" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."/></textarea></li></ul></div></div>';
	$("#careerWrap").append(html);
	careerFrmcount++;
});
/* 인턴 */
$("#addIntern").on("click",function() {
	var html = '<div id="formIntern"><div id="deleteBox"><button type="button" id="deleteIT" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formIntern1" class="input-group-prepend"><select name="internDivision" id="internDivision'+internFrmcount+'" class="custom-select"><option value="" disabled selected>활동구분</option>';
	html += '<option value="intern">인턴</option>	<option value="alba">아르바이트</option><option value="circles">동아리</option><option value="volunteer">자원봉사</option>';
	html += '<option value="socialActivity">사회활동</option><option value="schoolActivity">교내활동</option></select>';
	html += '<input type="text" name="socialInst" id="socialInst'+internFrmcount+'" class="form-control" placeholder="회사/기관/단체명"/>';
	html += '<input type="text" name="internstartDate" id="internstartDate'+internFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)"/>';
	html += '<input type="text" name="internendDate" id="internendDate'+internFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)"/></div>';
	html += '<div id="formIntern2" class="input-group-prepend"><ul><li>활동내용 :</li><li><textarea name="internTextarea" class="form-control" aria-label="With textarea" id="internContent'+internFrmcount+'" placeholder="직무와 관련된 경험에 대해 (상황-노력-결과)순으로 작성하는것이 좋습니다."></textarea></li></ul></div></div>';
	$('#internWrap').append(html);
	internFrmcount++;
});
$(document).on("click", "textarea[name=internTextarea]", function() {
	$(this).css("height","150px");
});
$(document).on("mouseout", "textarea[name=internTextarea]", function() {
	$(this).css("height","75px");
});
/* 교육 */
$("#addLearn").on("click",function() {
	var html = '<div id="formLearn"><div id="deleteBox"><button type="button" id="deleteLearn" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formLearn1" class="input-group-prepend"><input type="text" name="learnTitle" id="learnTitle'+learnFrmcount+'" class="form-control" placeholder="교육명"/>';
	html += '<input type="text" name="learnAgency" id="learnAgency'+learnFrmcount+'" class="form-control" placeholder="교육기관"/>';
	html += '<input type="text" name="learnstartDate" id="learnstartDate'+learnFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)"/>';
	html += '<input type="text" name="learnendDate" id="learnendDate'+learnFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)"/></div>';
	html += '<div id="formLearn2" class="input-group-prepend"><ul><li>내용 :</li><li><textarea name="learnTextarea" class="form-control" aria-label="With textarea" id="learnContent'+learnFrmcount+'" placeholder="이수하신 교육과정에 대해 적어주세요."></textarea></li>	</ul></div></div>';
	$('#learnWrap').append(html);
	learnFrmcount++;
});
$(document).on("click", "textarea[name=learnTextarea]", function() {
	$(this).css("height","150px");
});
$(document).on("mouseout", "textarea[name=learnTextarea]", function() {
	$(this).css("height","75px");
});
/* 자격증 */
$("#addCert").on("click",function() {
	var html = '<div id="formCertificate"><div id="deleteBox"><button type="button" id="deleteCertificate" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formCertificate" class="input-group-prepend"><input type="text" name="certName" id="certName'+certFrmcount+'" class="form-control" placeholder="자격증 명"/>';
	html += '<input type="text" name="certPublisher" id="certPublisher'+certFrmcount+'" class="form-control" placeholder="발행처"/>';
	html += '<input type="text" name= "certDate" id="certDate'+certFrmcount+'" class="form-control"placeholder="취득년월(예.2019.01)"/></div><div name="showCertificate"></div></div>';
	$('#certificateWrap').append(html);
	certFrmcount++;
});
$(document).on("keypress","input[name=certName]",function() {
	var divsearch = $(this).parent().parent().find("div[name=showCertificate]");
	var certName = $(this).val();
	divsearch.show();
	if (event.keyCode === 13) {
        event.preventDefault();
    }
	$.ajax({
		url : "${pageContext.request.contextPath }/resume/certificateList.do",
		data : {"certName" : certName},
		success : function(data) {
			var showul = $("<ul></ul>");
			for(var i in data) {
				var html = "<a><li>"+data[i].CERT_NAME+"</li></a>";
				showul.append(html);
			}
			
			divsearch.html(showul);
		},
		error : function() {
			console.log("실패닷");
		}
	});
});
$(document).on("click","div[name=showCertificate] a",function() {
	var output = $(this).children().text();
	var input = $(this).parent().parent().parent().find("input[name=certName]");
	input.val(output);
	$(this).parent().parent().hide();
});
/* 수상 */
var awardStr = "${award.awardName}";
var awardexist = "${award}";
var awardArr = awardStr.split(',');
if(awardexist != '') {
	$("#awardTotal").show();
	for(var AwardFrmcount=1;AwardFrmcount<=awardArr.length-1;AwardFrmcount++) {
		var html = '<div id="formAward"><div id="deleteBox"><button type="button" id="deleteAward" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formAward1" class="input-group-prepend"><input type="text" name="awardName" id="awardName'+AwardFrmcount+'" class="form-control" placeholder="수상명"/>';
		html += '<input type="text" name="awardAgency" id="awardAgency'+AwardFrmcount+'" class="form-control" placeholder="수여기관"/>';
		html += '<input type="text" name="awardDate" id="awardDate'+AwardFrmcount+'" class="form-control" placeholder="수상연도(예.2019)"/></div>';
		html += '<div id="formAward2" class="input-group-prepend"><ul><li>수여내용 :</li><li><textarea name="awardTextarea" class="form-control" aria-label="With textarea" id="awardContent'+AwardFrmcount+'" placeholder="수여 내용 및 결과를 자세히 입력해주세요."></textarea></li></ul></div></div>';
		$('#awardWrap').append(html);
	}
}

$("#addAward").on("click",function() {
	var html = '<div id="formAward"><div id="deleteBox"><button type="button" id="deleteAward" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formAward1" class="input-group-prepend"><input type="text" name="awardName" id="awardName'+AwardFrmcount+'" class="form-control" placeholder="수상명"/>';
	html += '<input type="text" name="awardAgency" id="awardAgency'+AwardFrmcount+'" class="form-control" placeholder="수여기관"/>';
	html += '<input type="text" name="awardDate" id="awardDate'+AwardFrmcount+'" class="form-control" placeholder="수상연도(예.2019)"/></div>';
	html += '<div id="formAward2" class="input-group-prepend"><ul><li>수여내용 :</li><li><textarea name="awardTextarea" class="form-control" aria-label="With textarea" id="awardContent'+AwardFrmcount+'" placeholder="수여 내용 및 결과를 자세히 입력해주세요."></textarea></li></ul></div></div>';
	$('#awardWrap').append(html);
	AwardFrmcount++;
});
$(document).on("click", "textarea[name=awardTextarea]", function() {
	$(this).css("height","100px");
});
$(document).on("mouseout", "textarea[name=awardTextarea]", function() {
	$(this).css("height","75px");
});
/* 해외경험 */
$("#addOverseas").on("click",function() {
	var html ='<div id="formOverseas"><div id="deleteBox"><button type="button" id="deleteOverseas" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formOverseas1" class="input-group-prepend"><input type="text" name="country" id="country'+OverseasFrmcount+'" class="form-control" placeholder="국가명"/>';
	html += '<input type="text" name="overseasstartDate" id="overseasstartDate'+OverseasFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)"/>';
	html += '<input type="text" name="overseasendDate" id="overseasendDate'+OverseasFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)"/></div>';
	html += '<div id="formOverseas2" class="input-group-prepend"><ul><li>내용 :</li><li><textarea name="overseasTextarea"class="form-control" aria-label="With textarea" id="overseasContent'+OverseasFrmcount+'" placeholder="해외에서 어떤 경험을 했는지 적어주세요.(ex.어학연수,교환학생,워킹홀리데이,해외근무)"></textarea></li></ul></div></div>';
	$('#overseasWrap').append(html);
	OverseasFrmcount++;
});
$(document).on("click", "textarea[name=overseasTextarea]", function() {
	$(this).css("height","150px");
});
$(document).on("mouseout", "textarea[name=overseasTextarea]", function() {
	$(this).css("height","75px");
});
/* 어학 */
$("#addLanguage").on("click",function() {
	var html = '<div id="formLanguage" class="input-group-prepend"><div id="deleteBox"><button type="button" id="deleteLanguage" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formLanguage1" class="input-group-prepend"><select name="languageDivision" id="languageDivision'+langFrmcount+'" class="custom-select"><option value="" disabled selected>구분</option>';
	html += '<option value="speakingAbility">회화능력</option><option value="standardExam">공인시험</option></select>';
	html += '<select name="languageName" id="languageName'+langFrmcount+'" class="custom-select language-select"><option value="" disabled selected>외국어명</option>';
	html += '<option value="english">영어</option><option value="japanese">일본어</option><option value="chinese">중국어</option><option value="selfSelect">직접입력</option></select>';
	html += '<input type="text" name="selfText" id="selfText'+langFrmcount+'" class="form-control"/>';
	html += '<select name="speakingDivision" id="speakingDivision'+langFrmcount+'" class="custom-select"><option value="" disabled selected>회화능력</option><option value="good">일상회화 가능</option>';
	html += '<option value="better">비즈니스 회화가능</option><option value="best">원어민 수준</option></select></div>';
	html += '<div id="formLanguage2" class="input-group-prepend"><select name="examName" id="examName'+langFrmcount+'" class="custom-select"><option value="" disabled selected>공인시험</option>';
	html += '<option value="etc">기타</option><option value="selfExam">직접입력</option></select>';
	html += '<input type="text" name="selfExam" id="selfExam'+langFrmcount+'" class="form-control"/>';
	html += '<input type="text" name="examscore" id="examscore'+langFrmcount+'" class="form-control" placeholder="급수/점수"/>';
	html += '<input type="text" name="examDate" id="examDate'+langFrmcount+'" class="form-control" placeholder="취득년월(예.1991.01)"/></div></div>';
	$('#languageWrap').append(html);
	langFrmcount++;
});
$(document).on("change","select[name=languageDivision]",function(){
	var state = $(this).val();
	if(state == "standardExam") {
		$(this).parent().parent().find("select[name=examName]").show();
		$(this).parent().parent().find("input[name=examscore]").show();
		$(this).parent().parent().find("input[name=examDate]").show();
		$(this).parent().parent().find("select[name=speakingDivision]").hide();
		$(this).parent().parent().find("select[name=speakingDivision]").val('');
	}
	else {
		$(this).parent().parent().find("select[name=examName]").hide();
		$(this).parent().parent().find("select[name=examName]").val('');
		$(this).parent().parent().find("input[name=examscore]").hide();
		$(this).parent().parent().find("input[name=examscore]").val('');
		$(this).parent().parent().find("input[name=examDate]").hide();
		$(this).parent().parent().find("input[name=examDate]").val('');
		$(this).parent().parent().find("select[name=speakingDivision]").show();
		$(this).parent().parent().find("input[name=selfExam]").hide();
		$(this).parent().parent().find("input[name=selfExam]").val('');
	}
});
$(document).on("change","select[name=examName]",function() {
	var state = $(this).val();
	if(state == "selfExam") {
		$(this).parent().find("input[name=selfExam]").show();
	}
	else {
		$(this).parent().find("input[name=selfExam]").hide();
		$(this).parent().find("input[name=selfExam]").val('');
	}
});
$(document).on("change", ".language-select" , function(){
	var state = $(this).val();
	if(state == "selfSelect") {
		$(this).next().show();
	}
	else {
		$(this).next().hide();
		$(this).next().val('');
	}
});
/* 포트폴리오 */
$("#addUrl").on("click",function() {
	var html = '<ul><li><select id="potselect" class="custom-select"><option value="" disabled selected>구분</option>';
	html += '<option value="pot1">이력서</option><option value="pot2">포트폴리오</option><option value="pot3">증명서</option>';
	html += '<option value="pot4">자격증</option><option value="pot5">추천서</option><option value="pot6">기획서</option>';
	html += '</select></li><li><input type="text" name="url" id="url'+fotFrmcount+'" class="form-control" placeholder="http://example.com"/></li>';
	html += '<li><button type="button" id="deletefotinput" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></li></ul>';
	$("#potfolioList").append(html);
	fotFrmcount++;
});
$("#addFile").on("click",function() {
	var html = '<ul><li><select id="potselect" class="custom-select"><option value="" disabled selected>구분</option>';
	html += '<option value="pot1">이력서</option><option value="pot2">포트폴리오</option><option value="pot3">증명서</option>';
	html += '<option value="pot4">자격증</option><option value="pot5">추천서</option><option value="pot6">기획서</option>';
	html += '</select></li><li><input type="file" name="pOriginalFileName" id="pOriginalFileName'+fotFilecount+'" class="form-control" placeholder="http://example.com"/></li>';
	html += '<li><button type="button" id="deletefotinput" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></li></ul>';
	$("#potfolioList").append(html);
	fotFilecount++;
});
/* 취업우대 */
$("#disorder").change(function() {
	if($(this).prop('checked')) {
		$('#preferdisorder').show();
	}
	else {
		$('#preferdisorder').hide();		
		$('#preferdisorder select').val('');		
	}
});
$("#military").change(function() {
	if($(this).prop('checked')) {
		$('#prefermilitary').show();
	}
	else {
		$('#prefermilitary').hide();		
		$('#prefermilitary select').val('');	
	}
});
/* 자기소개서추가 */
$("#addLetter").on("click",function() {
	var count = 0;
	var html = '<div class="letterDiv"><input type="text" name="letterText" id="letterText'+count+'" placeholder="항목 제목을 입력하세요.">';
	html += '<button type="button" class="deleteLetter" onclick="deleteone(event);"><span aria-hidden="true">X</span></button><div>';
	html += '<textarea name="letterArea" id="letterArea'+count+'" placeholder="해당내용을 입력하세요."></textarea></div></div>';
	$('#formLetter').append(html);
	count++;
});
/* 항목삭제버튼바로 윗단계 */
function deleteone(event) {
	var clicked = event.currentTarget.parentElement;//button을 가리키게 함
	console.log(clicked);
	clicked.remove();
};
function deleteTwice(event) {
	var clicked = event.currentTarget.parentElement.parentElement;//button을 가리키게 함
	console.log(clicked);
	clicked.remove();
}
/* 필수사항체크 */
function checkNull() {
	if(resumeFrm.userResumeTitle.value == ""){
		alert("이력서제목을 입력해주세요")
		resumeFrm.userResumeTitle.focus();
		return false;
	}
	else if(resumeFrm.name.value == "") {
		alert("이름을 입력해주세요")
		resumeFrm.name.focus();
		return false;
	}
	else if(resumeFrm.birth.value == "") {
		alert("생년월일을 입력해주세요")
		resumeFrm.birth.focus();
		return false;
	}
	else if(resumeFrm.gender.value == "") {
		alert("성별을 설정해주세요")
		resumeFrm.gender.focus();
		return false;
	}
	else if(resumeFrm.email.value == "") {
		alert("이메일을 입력해주세요")
		resumeFrm.email.focus();
		return false;
	}
	else if(resumeFrm.phone.value == "") {
		alert("전화번호를 입력해주세요")
		resumeFrm.phone.focus();
		return false;
	}
	else if(resumeFrm.address.value == "") {
		alert("주소를 입력해주세요")
		resumeFrm.address.focus();
		return false;
	}
	else if(resumeFrm.jobType.value == "") {
		alert("고용형태를 입력해주세요")
		resumeFrm.jobType.focus();
		return false;
	}
	else if(resumeFrm.wantPay.value == "") {
		alert("희망연봉을 입력해주세요")
		resumeFrm.wantPay.focus();
		return false;
	}
	else if(resumeFrm.hopePlace.value == "") {
		alert("희망근무지를 입력해주세요")
		resumeFrm.hopePlace.focus();
		return false;
	}
	else if(resumeFrm.hopeDuty.value == "") {
		alert("직무,산업,키워드를 입력해주세요")
		resumeFrm.hopeDuty.focus();
		return false;
	}
	else {
		return true;
	}
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>