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
	<input type="text" name="userresumetitle" id="userresumetitle" 
		   class="form-control" aria-label="Sizing example input" 
		   aria-describedby="inputGroup-sizing-lg" placeholder="기업에게 나에 대해 알려줍시다.강점,목표,관심분야도 좋아요."
		   value="${profile.userresumetitle}" readonly/>
	<input type="hidden" name="memberIdHide" value="${member.memberId}" />
</div>
<div id="profileTotal" class="wrap-container">
	<h3>인적사항</h3>
	<div id="profileWrap">
		<div id="formProfile1" class="input-group-prepend">
			<input type="text" id="name" name="name" class="form-control" placeholder="이름" value = "${profile.name}" readonly/>
			<input type="text" id="birth" name="birth" class="form-control" placeholder="생년월일(예.1991.01.01)" value = "${profile.birth}" readonly/>
			<select id="gender" name="gender" class="custom-select">
				<option value="" disabled selected>성별</option>
			 	<option value="남" ${profile.gender == '남  '?'selected="selected"':"" } disabled>남</option>								
		 		<option value="여" ${profile.gender == '여  '?'selected="selected"':"" } disabled>여</option>								
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
			<input type="checkbox" name="nonHigh" id="nonHigh" value="고졸"
			${education.nonHigh[0] == "고졸"?'checked':''}/>
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
							<option value="고등학교">고등학교</option>
							<option value="대학교2년제">대학(2,3년)</option>
							<option value="대학교4년제">대학교(4년)</option>			
							<option value="대학원">대학원</option>			
						</select>
					</li>
					<li>
						<input type="text" name="schoolname" id="schoolname0" class="form-control" placeholder="학교명" value="${education.schoolname}"/>						
					</li>
				</ul>
				<div name="searchHidden" id="searchHidden0"></div>
			</div>
			<div id="formEducation3" class="input-group-prepend">
				<ul>
					<li><input type="text" name="admissiondate" id="admissiondate0" class="form-control" placeholder="입학년월"/></li>
					<li><input type="text" name="graduationdate" id="graduationdate0" class="form-control" placeholder="졸업년월"/></li>
					<li>
						<select name="graducationstate" id="graducationstate0" class="custom-select">
							<option value="" disabled selected>졸업상태</option>
							<option value="졸업">졸업</option>
							<option value="수료">수료</option>
							<option value="졸업예정">졸업예정</option>
							<option value="휴학">휴학</option>
							<option value="중퇴">중퇴</option>
						</select> 
					</li>
					<li>
						<input type="checkbox" name="transfer" id="transfer0" aria-label="Checkbox for following text input" 
						value="편입" ${education.transfer[0] == "편입"?'checked':''}/>&nbsp;편입
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
							<option value="석사">석사</option>
							<option value="박사">박사</option>
							<option value="석박사">석박사</option>
						</select> 
					</li>
				</ul>
			</div>
			<div id="formEducation5">
				<button type ="button" name="otherDepartment" id="otherDepartment0">다른전공</button>
				<button type ="button" name="senierProject"id="senierProject0">졸업 논문/작품</button>
				<ul>
					<li>
						<select name="otherdepartsel" id="otherdepartsel0" class="custom-select">
							<option value="" disabled selected>전공선택</option>
							<option value="부전공">부전공</option>
							<option value="복수전공">복수전공</option>
							<option value="이중전공">이중전공</option>
						</select>
					</li>
					<li>
						<input type="text" name="secmajor" id="secmajor0" class="form-control" placeholder="전공명"/>
					</li>
				</ul>
				<ul>
					<li>
						<textarea name="otherdeparttext" id="otherdeparttext0" class="form-control" aria-label="With textarea" placeholder="졸업/논문작품"></textarea>
					</li>
				</ul>
			</div>
			<div id="formEducation2" class="input-group-prepend">
				<ul>
					<li><input type="text" name="highgraduationdate" id="highgraduationdate0" class="form-control" placeholder="졸업년도"/></li>
					<li>
						<select name="highgraduationstate" id="highgraduationstate0" class="custom-select">
							<option value="" disabled selected>졸업상태</option>
							<option value="졸업">졸업</option>
							<option value="졸업예정">졸업예정</option>
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
					<input type="text" name="jobtype" id="jobtype" class="form-control" placeholder="고용형태" value="${hopework.jobtype}"/>
				</li>
				<li>
					<input type="text" name="wantpay" id="wantpay" class="form-control" onkeydown="validateText(event)" placeholder="희망연봉(단위 :만원)" value="${hopework.wantpay}"/>
				</li>
				<li>
					<input type="checkbox" name="visitdetermine" id="visitdetermine" 
						   value="visitdetermine" aria-label="Checkbox for following text input"
						   ${hopework.visitdetermine[0] == "visitdetermine"?'checked':''}/>&nbsp;면접 후 결정				
				</li>
			</ul>
		</div>
		<div id="formHopework2" class="input-group-prepend">
			<ul>
				<li>희망근무지 :</li>
				<li>
					<textarea name="hopeplace" id="hopeplace" class="form-control" aria-label="With textarea">${hopework.hopeplace}</textarea>
				</li>
			</ul>
		</div>
		<div id="formHopework3" class="input-group-prepend">
			<ul>
				<li>직무,산업,키워드 :</li>
				<li>
					<textarea name="hopeduty" id="hopeduty" class="form-control" aria-label="With textarea">${hopework.hopeduty}</textarea>		
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
				<button type="button" name="deleteIT" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formIntern1" class="input-group-prepend">
				<select name="interndivision" id="interndivision0" class="custom-select">
					<option value="" disabled selected>활동구분</option>
					<option value="인턴">인턴</option>
					<option value="아르바이트">아르바이트</option>
					<option value="동아리">동아리</option>
					<option value="자원봉사">자원봉사</option>
					<option value="사회활동">사회활동</option>
					<option value="교내활동">교내활동</option>
				</select>
				<input type="text" name="socialinst" id="socialinst0" class="form-control" placeholder="회사/기관/단체명" value="${intern.socialinstArr[0]}"/>
				<input type="text" name="internstartdate" id="internstartdate0" class="form-control" placeholder="시작년월(예.1991.01)" value="${intern.internstartdateArr[0]}"/>
				<input type="text" name="internenddate" id="internenddate0" class="form-control" placeholder="종료년월(예.2019.01)" value="${intern.internenddateArr[0]}"/>
			</div>
			<div id="formIntern2" class="input-group-prepend">
				<ul>
					<li>활동내용 :</li>
					<li><textarea name="interntextarea" class="form-control" aria-label="With textarea" id="interntextarea0" placeholder="직무와 관련된 경험에 대해 (상황-노력-결과)순으로 작성하는것이 좋습니다.">${intern.interntextareaArr[0]}</textarea></li>
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
				<button type="button" name="deleteLearn" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formLearn1" class="input-group-prepend">
				<input type="text" name="learntitle" id="learntitle0" class="form-control" placeholder="교육명" value="${learn.learntitleArr[0]}"/>
				<input type="text" name="learnagency" id="learnagency0" class="form-control" placeholder="교육기관" value="${learn.learnagencyArr[0]}"/>
				<input type="text" name="learnstartdate" id="learnstartdate0" class="form-control" placeholder="시작년월(예.1991.01)" value="${learn.learnstartdateArr[0]}"/>
				<input type="text" name="learnenddate"id="learnenddate0" class="form-control" placeholder="종료년월(예.2019.01)" value="${learn.learnenddateArr[0]}"/>
				<br />
			</div>
			<div id="formLearn2" class="input-group-prepend">
				<ul>
					<li>내용 :</li>
					<li><textarea name="learntextarea" class="form-control" aria-label="With textarea" id="learntextarea0" placeholder="이수하신 교육과정에 대해 적어주세요.">${learn.learntextareaArr[0]}</textarea></li>
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
				<input type="text" name="certname" id="certname0" class="form-control" placeholder="자격증 명" value="${certification.certnameArr[0]}"/>
				<input type="text" name="certpublisher" id="certpublisher0" class="form-control" placeholder="발행처" value="${certification.certpublisherArr[0]}"/>
				<input type="text" name="certdate" id="certdate0" class="form-control"placeholder="취득년월(예.2019.01)" value="${certification.certdateArr[0]}"/>
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
				<button type="button" name="deleteAward" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formAward1" class="input-group-prepend">
				<input type="text" name="awardname" id="awardname0" class="form-control" placeholder="수상명" value="${award.awardnameArr[0]}"/>
				<input type="text" name="awardagency" id="awardagency0" class="form-control" placeholder="수여기관" value="${award.awardagencyArr[0]}"/>
				<input type="text" name="awarddate" id="awarddate0" class="form-control" placeholder="수상연도(예.2019)" value="${award.awarddateArr[0]}"/>
			</div>
			<div id="formAward2" class="input-group-prepend">
				<ul>
					<li>수여내용 :</li>
					<li>
						<textarea name="awardtextarea" class="form-control" 
								  aria-label="With textarea" id="awardtextarea0" 
								  placeholder="수여 내용 및 결과를 자세히 입력해주세요.">${award.awardtextareaArr[0]}</textarea>
					</li>
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
				<button type="button" name="deleteOverseas" onclick="deleteTwice(event);">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div id="formOverseas1" class="input-group-prepend">
				<input type="text" name="country" id="country0" class="form-control" placeholder="국가명" value="${overseas.countryArr[0]}"/>
				<input type="text" name="overseasstartdate" id="overseasstartdate0" class="form-control" placeholder="시작년월(예.1991.01)" value="${overseas.overseasstartdateArr[0]}"/>
				<input type="text" name="overseasenddate" id="overseasenddate0" class="form-control" placeholder="종료년월(예.2019.01)" value="${overseas.overseasenddateArr[0]}"/>
			</div>
			<div id="formOverseas2" class="input-group-prepend">
				<ul>
					<li>내용 :</li>
					<li><textarea name="overseastextarea" class="form-control" aria-label="With textarea" id="overseastextarea0" placeholder="해외에서 어떤 경험을 했는지 적어주세요.(ex.어학연수,교환학생,워킹홀리데이,해외근무)">${overseas.overseastextareaArr[0]}</textarea></li>
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
				<select name="languagedivision" id="languagedivision0" class="custom-select">
					<option value="" disabled selected>구분</option>
					<option value="회화능력">회화능력</option>
					<option value="공인시험">공인시험</option>
				</select>
				<select name="languagename" id="languagename0" class="custom-select language-select">
					<option value="" disabled selected>외국어명</option>
					<option value="영어">영어</option>
					<option value="일본어">일본어</option>
					<option value="중국어">중국어</option>
					<option value="직접입력">직접입력</option>
				</select>
				<input type="text" name="selftext" id="selftext0" class="form-control"/>
				<select name="speakingdivision" id="speakingdivision0" class="custom-select">
					<option value="" disabled selected>회화능력</option>
					<option value="일산회화가능">일상회화 가능</option>
					<option value="비즈니스회화가능">비즈니스 회화가능</option>
					<option value="원어민수준">원어민 수준</option>
				</select>
			</div>
			<div id="formLanguage2" class="input-group-prepend">
				<select name="examname" id="examname0" class="custom-select">
					<option value="" disabled selected>공인시험</option>
					<option value="기타">기타</option>
					<option value="직접입력">직접입력</option>
				</select>
				<input type="text" name="selfexam" id="selfexam0" class="form-control"/>
				<input type="text" name="examscore" id="examscore0" class="form-control" placeholder="급수/점수"/>
				<input type="text" name="examdate" id="examdate0" class="form-control" placeholder="취득년월(예.1991.01)"/>
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
						<input type="checkbox" name="prefercheck" id="veteran" aria-label="Checkbox for following text input" value="보훈대상"/>
						<label for="veteran">보훈대상</label>
					</li>
					<li>
						<input type="checkbox" name="prefercheck" id="protected" aria-label="Checkbox for following text input" value="취업보호대상"/>
						<label for="protected">취업보호 대상</label>
					</li>
					<li>
						<input type="checkbox" name="prefercheck" id="subsidy" aria-label="Checkbox for following text input" value="고용지원금대상"/>
						<label for="subsidy">고용지원금 대상</label>	
					</li>
					<li>
						<input type="checkbox" name="prefercheck" id="disorder" aria-label="Checkbox for following text input" value="장애"/>
						<label for="disorder">장애</label>
					</li>
					<li>
						<input type="checkbox" name="prefercheck" id="military" aria-label="Checkbox for following text input" value="병역"/>
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
					<option value="1급">1급</option>
					<option value="2급">2급</option>
					<option value="3급">3급</option>
					<option value="4급">4급</option>
					<option value="5급">5급</option>
					<option value="6급">6급</option>						
				</select>
			</div>
			<div id="prefermilitary" class="input-group-prepend">
				병역 : 
				<select name="militaryselect" id="militaryselect" class="custom-select">
					<option value="" disabled selected>병역</option>
					<option value="군필">군필</option>
					<option value="미필">미필</option>
					<option value="면제">면제</option>
					<option value="해당없음">해당없음</option>
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
						<input type="text" name= "corpname" id="corpname0" class="form-control" placeholder="회사명" value="${career.corpnameArr[0]}"/>
					</li>
					<li>
						<input type="text" name="department" id="department0" class="form-control" placeholder="부서명" value="${career.departmentArr[0]}"/>
					</li>
					<li>
						<input type="text" name="hireddate" id="hireddate0" class="form-control" placeholder="입사년월(예.1991.01)" value="${career.hireddateArr[0]}"/>
					</li>
					<li>
						<input type="text" name="retireddate" id="retireddate0" class="form-control" placeholder="퇴사년월(예.2019.01)" value="${career.retireddateArr[0]}"/>
					</li>
					<li>
						<input type="checkbox" name="buttonworking" 
							   id="buttonworking0" value="재직중" 
							   aria-label="Checkbox for following text input"
							   ${career.buttonworking[0] == "재직중"?'checked':''}/>&nbsp;재직중
					</li>
				</ul>
			</div>
			<div id="formCareer2" class="input-group-prepend  input-group-text">
				<ul>
					<li>
						<input type="text" name="jobposition" id="jobposition0" class="form-control" placeholder="직급/직책" value="${career.jobpositionArr[0]}"/>
					</li>
					<li>
						<input type="text" name="job" id="job0" class="form-control" placeholder="직무" value="${career.jobArr[0]}"/>
					</li>
					<li>
						<input type="text" name="income" id="income0" class="form-control" onkeydown="validateText(event)" placeholder="연봉(단위 :만원)" value="${career.incomeArr[0]}"/>
					</li>
				</ul>
			</div>
			<div id="formCareer3" class="input-group-prepend">
				<ul>
					<li>담당업무 :</li>
					<li><textarea name="description" class="form-control" 
								  aria-label="With textarea" id="description0" 
								  placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."/>${career.descriptionArr[0]}</textarea></li>
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
var lettercount = 0;

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
$(document).on("keypress","input[name=schoolname]",function() {
	var selectval = $(this).parent().parent().find("select[name=graduaction]").val();
	var divsearch = $(this).parent().parent().parent().find("div[name=searchHidden]");
	var searchKeyword = $(this).parent().parent().find("input[name=schoolname]").val();
	if (event.keyCode === 13) {
        event.preventDefault();
    }
	if(selectval == '고등학교') {
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
	else if(selectval == '대학교2년제' || selectval == '대학교4년제' || selectval == '대학원'){
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
	var input = $(this).parent().parent().parent().find("input[name=schoolname]");
	input.val(output);
	$(this).parent().parent().hide();
});
$(document).on("change","select[name=graduaction]",function() {
	var state = $(this).val();
	var searchKeyword = $("input[name=schoolname]").val();
	if(state =='고등학교') {
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
	else if(state == '대학교2년제' || state == '대학교4년제') {
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
	html += '<option value="고등학교">고등학교</option><option value="대학교2년제">대학(2,3년)</option><option value="대학교4년제">대학교(4년)</option><option value="대학원">대학원</option></select></li>';
	html += '<li><input type="text" name="schoolname" id="schoolname'+eduFrmcount+'" class="form-control" placeholder="학교명"/></li><div name="searchHidden" id="searchHidden'+eduFrmcount+'"></div></ul></div>';
	html += '<div id="formEducation3" class="input-group-prepend"><ul><li><input type="text" name="admissiondate" id="admissiondate'+eduFrmcount+'" class="form-control" placeholder="입학년월"/></li>';
	html += '<li><input type="text" name="graduationdate" id="graduationdate'+eduFrmcount+'" class="form-control" placeholder="졸업년월"/></li>';
	html += '<li><select name="graducationstate" id="graducationstate'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option><option value="졸업">졸업</option>';
	html += '<option value="수료">수료</option>	<option value="졸업예정">졸업예정</option><option value="휴학">휴학</option><option value="중퇴">중퇴</option></select></li>';
	html += '<li><input type="checkbox" name="transfer" id="transfer'+eduFrmcount+'" aria-label="Checkbox for following text input" value="편입"/>&nbsp;편입</li></ul></div>';
	html += '<div id="formEducation4" class="input-group-prepend"><ul><li><input type="text" class="form-control" name="major" id="major'+eduFrmcount+'" placeholder="전공명"/></li>';
	html += '<li><input type="text" class="form-control" name="score" id="score'+eduFrmcount+'" placeholder="학점"/></li>	<li><select name="totalscore" id="totalscore'+eduFrmcount+'" class="custom-select">';
	html += '<option value="" disabled selected>총점</option><option value="4.5">4.5</option><option value="4.3">4.3</option><option value="4.0">4.0</option>';
	html += '<option value="100">100</option></select></li><li><select name="degree"id="degree'+eduFrmcount+'" class="custom-select eduDegree">';
	html += '<option value="" disabled selected>학위</option><option value="석사">석사</option><option value="박사">박사</option><option value="석박사">석박사</option></select></li></ul></div>';
	html += '<div id="formEducation5"><button type ="button" name="otherDepartment" id="otherDepartment'+eduFrmcount+'">다른전공</button><button type ="button" name="senierProject" id="senierProject'+eduFrmcount+'">졸업 논문/작품</button>';
	html += '<ul><li><select name="otherdepartsel" id="otherdepartsel'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>전공선택</option><option value="부전공">부전공</option><option value="복수전공">복수전공</option>';
	html += '<option value="이중전공">이중전공</option></select></li><li><input type="text" name="secmajor" id="secmajor'+eduFrmcount+'" class="form-control" placeholder="전공명"/></li></ul>';
	html += '<ul><li><textarea name="otherdeparttext" id="otherdeparttext'+eduFrmcount+'" class="form-control" aria-label="With textarea" placeholder="졸업/논문작품"></textarea></li></ul></div>';
	html += '<div id="formEducation2" class="input-group-prepend"><ul><li><input type="text" name="highgraduationdate" id="highgraduationdate'+eduFrmcount+'" class="form-control" placeholder="졸업년도"/></li>';
	html += '<li><select name="highgraduationstate" id="highgraduationstate'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option><option value="졸업">졸업</option><option value="졸업예정">졸업예정</option></select></li>';
	html += '<li><input type="checkbox" name="ged" id="ged'+eduFrmcount+'" aria-label="Checkbox for following text input" value="ged"/>&nbsp;대입검정고시</li></ul></div></div>';
	$('#educationWrap').append(html);
};

$("#addEducation").on("click",function() {
	var eduFrmcount = eduArr.length;
	var html = '<div id="formEducation"><div id="deleteBox"><button type="button" id="deleteEdu" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formEducation1" class="input-group-prepend"><ul><li><select id="graduaction'+eduFrmcount+'" name = "graduaction" class="custom-select"><option value="" disabled selected>학교구분</option>';
	html += '<option value="고등학교">고등학교</option><option value="대학교2년제">대학(2,3년)</option><option value="대학교4년제">대학교(4년)</option><option value="대학원">대학원</option></select></li>';
	html += '<li><input type="text" name="schoolname" id="schoolname'+eduFrmcount+'" class="form-control" placeholder="학교명"/></li><div name="searchHidden" id="searchHidden'+eduFrmcount+'"></div></ul></div>';
	html += '<div id="formEducation3" class="input-group-prepend"><ul><li><input type="text" name="admissiondate" id="admissiondate'+eduFrmcount+'" class="form-control" placeholder="입학년월"/></li>';
	html += '<li><input type="text" name="graduationdate" id="graduationdate'+eduFrmcount+'" class="form-control" placeholder="졸업년월"/></li>';
	html += '<li><select name="graducationstate" id="graducationstate'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option><option value="졸업">졸업</option>';
	html += '<option value="수료">수료</option>	<option value="졸업예정">졸업예정</option><option value="휴학">휴학</option><option value="중퇴">중퇴</option></select></li>';
	html += '<li><input type="checkbox" name="transfer" id="transfer'+eduFrmcount+'" aria-label="Checkbox for following text input" value="편입"/>&nbsp;편입</li></ul></div>';
	html += '<div id="formEducation4" class="input-group-prepend"><ul><li><input type="text" class="form-control" name="major" id="major'+eduFrmcount+'" placeholder="전공명"/></li>';
	html += '<li><input type="text" class="form-control" name="score" id="score'+eduFrmcount+'" placeholder="학점"/></li>	<li><select name="totalscore" id="totalscore'+eduFrmcount+'" class="custom-select">';
	html += '<option value="" disabled selected>총점</option><option value="4.5">4.5</option><option value="4.3">4.3</option><option value="4.0">4.0</option>';
	html += '<option value="100">100</option></select></li><li><select name="degree"id="degree'+eduFrmcount+'" class="custom-select eduDegree">';
	html += '<option value="" disabled selected>학위</option><option value="석사">석사</option><option value="박사">박사</option><option value="석박사">석박사</option></select></li></ul></div>';
	html += '<div id="formEducation5"><button type ="button" name="otherDepartment" id="otherDepartment'+eduFrmcount+'">다른전공</button><button type ="button" name="senierProject" id="senierProject'+eduFrmcount+'">졸업 논문/작품</button>';
	html += '<ul><li><select name="otherdepartsel" id="otherdepartsel'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>전공선택</option><option value="부전공">부전공</option><option value="복수전공">복수전공</option>';
	html += '<option value="이중전공">이중전공</option></select></li><li><input type="text" name="secmajor" id="secmajor'+eduFrmcount+'" class="form-control" placeholder="전공명"/></li></ul>';
	html += '<ul><li><textarea name="otherdeparttext" id="otherdeparttext'+eduFrmcount+'" class="form-control" aria-label="With textarea" placeholder="졸업/논문작품"></textarea></li></ul></div>';
	html += '<div id="formEducation2" class="input-group-prepend"><ul><li><input type="text" name="highgraduationdate" id="highgraduationdate'+eduFrmcount+'" class="form-control" placeholder="졸업년도"/></li>';
	html += '<li><select name="highgraduationstate" id="highgraduationstate'+eduFrmcount+'" class="custom-select"><option value="" disabled selected>졸업상태</option><option value="졸업">졸업</option><option value="졸업예정">졸업예정</option></select></li>';
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
$(document).on("click", "textarea[name=otherdeparttext]", function() {
	$(this).css("height","100px");
});
$(document).on("mouseout", "textarea[name=otherdeparttext]", function() {
	$(this).css("height","75px");
});

/* 희망근무조건 */
$("#hopeduty").on("click",function() {
	$(this).css("height","100px");
});
$("#hopeduty").on("mouseout",function() {
	$(this).css("height","75px");
});
/* 경력 */
var careerexist = "${career}";
if(careerexist != '') {
	$("#careerTotal").show();
	var carrercnt = "${carrercnt}";
	var cnameArr = new Array();
	<c:forEach items="${career.corpnameArr}" var="cname" varStatus="cn">
		cnameArr['${cn.index}'] = '${cname}';
	</c:forEach>
	var departArr = new Array();
	<c:forEach items="${career.departmentArr}" var="dpart" varStatus="dp">
		departArr['${dp.index}'] = '${dpart}';
	</c:forEach>
	var hdateArr = new Array();
	<c:forEach items="${career.hireddateArr}" var="hdate" varStatus="hd">
		hdateArr['${hd.index}'] = '${hdate}';
	</c:forEach>
	var rdateArr = new Array();
	<c:forEach items="${career.retireddateArr}" var="rdate" varStatus="rd">
		rdateArr['${rd.index}'] = '${rdate}';
	</c:forEach>
	var bworkingArr = new Array();
	<c:forEach items="${career.buttonworking}" var="bworking" varStatus="bw">
		bworkingArr['${bw.index}'] = '${bworking}';
	</c:forEach>
	var jpositionArr = new Array();
	<c:forEach items="${career.jobpositionArr}" var="jposition" varStatus="jp">
		jpositionArr['${jp.index}'] = '${jposition}';
	</c:forEach>
	var jArr = new Array();
	<c:forEach items="${career.jobArr}" var="job" varStatus="ja">
		jArr['${ja.index}'] = '${job}';
	</c:forEach>
	var inArr = new Array();
	<c:forEach items="${career.incomeArr}" var="income" varStatus="in">
		inArr['${in.index}'] = '${income}';
	</c:forEach>
	var dscriArr = new Array();
	<c:forEach items="${career.descriptionArr}" var="descri" varStatus="da">
		dscriArr['${da.index}'] = '${descri}';
	</c:forEach>
	for(var careerFrmcount=1;careerFrmcount<carrercnt;careerFrmcount++){
		var html ='<div id="formCareer"><div id="deleteBox"><button type="button" name="deleteCareer" class="deleteWrap"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formCareer1" class="input-group-prepend input-group-text"><ul><li><input type="text" name="corpname" id="corpname'+careerFrmcount+'" class="form-control" placeholder="회사명" value="'+cnameArr[careerFrmcount]+'"/></li>';
		html += '<li><input type="text" name="department" id="department'+careerFrmcount+'" class="form-control" placeholder="부서명" value="'+departArr[careerFrmcount]+'"/></li>';
		html += '<li><input type="text" name="hireddate" id="hireddate'+careerFrmcount+'" class="form-control" placeholder="입사년월(예.1991.01)" value="'+hdateArr[careerFrmcount]+'"/></li>';
		html += '<li><input type="text" name="retireddate" id="retireddate'+careerFrmcount+'" class="form-control" placeholder="퇴사년월(예.2019.01)" value="'+rdateArr[careerFrmcount]+'"/></li>';
		html += '<li><input type="checkbox" name="buttonworking" id="buttonworking'+careerFrmcount+'" value="재직중" aria-label="Checkbox for following text input"}/>&nbsp;재직중</li></ul></div>';
		html += '<div id="formCareer2" class="input-group-prepend  input-group-text"><ul><li><input type="text" name="jobposition" id="jobposition'+careerFrmcount+'" class="form-control" placeholder="직급/직책" value="'+jpositionArr[careerFrmcount]+'"/></li>';
		html += '<li><input type="text" name= "job" id="job'+careerFrmcount+'" class="form-control" placeholder="직무" value="'+jArr[careerFrmcount]+'"/></li>';
		html += '<li><input type="text" name= "income" id="income'+careerFrmcount+'" class="form-control" onkeydown="validateText(event)" placeholder="연봉(단위 :만원)" value="'+inArr[careerFrmcount]+'"/></li></ul></div>';
		html += '<div id="formCareer3" class="input-group-prepend"><ul><li>담당업무 :</li><li><textarea name="description" class="form-control" aria-label="With textarea" id="description'+careerFrmcount+'" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요.">'+dscriArr[careerFrmcount]+'</textarea></li></ul></div></div>';
		$("#careerWrap").append(html);
	};
};
var careerFrmcount = carrercnt;
$(document).on("change","input[name=buttonworking]",function() {
	$(this).parent().parent().children().eq(3).toggle();
});
$("#addCareer").on("click",function() {
	var html ='<div id="formCareer"><div id="deleteBox"><button type="button" name="deleteCareer" class="deleteWrap"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formCareer1" class="input-group-prepend input-group-text"><ul><li><input type="text" name="corpname" id="corpname'+careerFrmcount+'" class="form-control" placeholder="회사명"/></li>';
	html += '<li><input type="text" name="department" id="department'+careerFrmcount+'" class="form-control" placeholder="부서명"/></li>';
	html += '<li><input type="text" name="hireddate" id="hireddate'+careerFrmcount+'" class="form-control" placeholder="입사년월(예.1991.01)"/></li>';
	html += '<li><input type="text" name="retireddate" id="retireddate'+careerFrmcount+'" class="form-control" placeholder="퇴사년월(예.2019.01)"/></li>';
	html += '<li><input type="checkbox" name="buttonworking" id="buttonworking'+careerFrmcount+'" value="재직중" aria-label="Checkbox for following text input"/>&nbsp;재직중</li></ul></div>';
	html += '<div id="formCareer2" class="input-group-prepend  input-group-text"><ul><li><input type="text" name="jobposition" id="jobposition'+careerFrmcount+'" class="form-control" placeholder="직급/직책"/></li>';
	html += '<li><input type="text" name= "job" id="job'+careerFrmcount+'" class="form-control" placeholder="직무"/></li>';
	html += '<li><input type="text" name= "income" id="income'+careerFrmcount+'" class="form-control" onkeydown="validateText(event)" placeholder="연봉(단위 :만원)"/></li></ul></div>';
	html += '<div id="formCareer3" class="input-group-prepend"><ul><li>담당업무 :</li><li><textarea name="description" class="form-control" aria-label="With textarea" id="description'+careerFrmcount+'" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."/></textarea></li></ul></div></div>';
	$("#careerWrap").append(html);
	careerFrmcount++;
});
/* 인턴 */
var internexist = "${intern}";
if(internexist != '') {
	$("#internTotal").show();
	var interncnt = "${interncnt}";
	var idivisionArr = new Array();
	<c:forEach items="${intern.interndivisionArr}" var="idivision" varStatus="id">
		idivisionArr['${id.index}'] = '${idivision}';
	</c:forEach>
	var isocialArr = new Array();
	<c:forEach items="${intern.socialinstArr}" var="isocial" varStatus="iso">
		isocialArr['${iso.index}'] = '${isocial}';
	</c:forEach>
	var isdateArr = new Array();
	<c:forEach items="${intern.internstartdateArr}" var="isdate" varStatus="isd">
		isdateArr['${isd.index}'] = '${isdate}';
	</c:forEach>
	var iedateArr = new Array();
	<c:forEach items="${intern.internenddateArr}" var="iedate" varStatus="ied">
		iedateArr['${ied.index}'] = '${iedate}';
	</c:forEach>
	var itextArr = new Array();
	<c:forEach items="${intern.interntextareaArr}" var="itext" varStatus="it">
		itextArr['${it.index}'] = '${itext}';
	</c:forEach>
	for(var internFrmcount=1;internFrmcount<interncnt;internFrmcount++){
		var html = '<div id="formIntern"><div id="deleteBox"><button type="button" name="deleteIT" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formIntern1" class="input-group-prepend"><select name="interndivision" id="interndivision'+internFrmcount+'" class="custom-select"><option value="" disabled selected>활동구분</option>';
		html += '<option value="인턴">인턴</option><option value="아르바이트">아르바이트</option><option value="동아리">동아리</option><option value="자원봉사">자원봉사</option>';
		html += '<option value="사회활동">사회활동</option><option value="교내활동">교내활동</option></select>';
		html += '<input type="text" name="socialinst" id="socialinst'+internFrmcount+'" class="form-control" placeholder="회사/기관/단체명" value="'+isocialArr[internFrmcount]+'"/>';
		html += '<input type="text" name="internstartdate" id="internstartdate'+internFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)" value="'+isdateArr[internFrmcount]+'"/>';
		html += '<input type="text" name="internenddate" id="internenddate'+internFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)" value="'+iedateArr[internFrmcount]+'"/></div>';
		html += '<div id="formIntern2" class="input-group-prepend"><ul><li>활동내용 :</li><li><textarea name="interntextarea" class="form-control" aria-label="With textarea" id="interntextarea'+internFrmcount+'" placeholder="직무와 관련된 경험에 대해 (상황-노력-결과)순으로 작성하는것이 좋습니다.">'+itextArr[internFrmcount]+'</textarea></li></ul></div></div>';
		$('#internWrap').append(html);
	}
}
var internFrmcount = interncnt;
$("#addIntern").on("click",function() {
	var html = '<div id="formIntern"><div id="deleteBox"><button type="button" name="deleteIT" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formIntern1" class="input-group-prepend"><select name="interndivision" id="interndivision'+internFrmcount+'" class="custom-select"><option value="" disabled selected>활동구분</option>';
	html += '<option value="인턴">인턴</option><option value="아르바이트">아르바이트</option><option value="동아리">동아리</option><option value="자원봉사">자원봉사</option>';
	html += '<option value="사회활동">사회활동</option><option value="교내활동">교내활동</option></select>';
	html += '<input type="text" name="socialinst" id="socialinst'+internFrmcount+'" class="form-control" placeholder="회사/기관/단체명"/>';
	html += '<input type="text" name="internstartdate" id="internstartdate'+internFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)"/>';
	html += '<input type="text" name="internenddate" id="internenddate'+internFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)"/></div>';
	html += '<div id="formIntern2" class="input-group-prepend"><ul><li>활동내용 :</li><li><textarea name="interntextarea" class="form-control" aria-label="With textarea" id="interntextarea'+internFrmcount+'" placeholder="직무와 관련된 경험에 대해 (상황-노력-결과)순으로 작성하는것이 좋습니다."></textarea></li></ul></div></div>';
	$('#internWrap').append(html);
	internFrmcount++;
});
$(document).on("click", "textarea[name=interntextarea]", function() {
	$(this).css("height","150px");
});
$(document).on("mouseout", "textarea[name=interntextarea]", function() {
	$(this).css("height","75px");
});
/* 교육 */
var learnexist = "${learn}";
if(learnexist != '') {
	$("#learnTotal").show();
	var learncnt = "${learncnt}";
	var ltitleArr = new Array();
	<c:forEach items="${learn.learntitleArr}" var="ltitle" varStatus="ltt">
		ltitleArr['${ltt.index}'] = '${ltitle}'
	</c:forEach>
	var lagencyArr = new Array();
	<c:forEach items="${learn.learnagencyArr}" var="lagency" varStatus="la">
		lagencyArr['${la.index}'] = '${lagency}'
	</c:forEach>
	var lsdateArr = new Array();
	<c:forEach items="${learn.learnstartdateArr}" var="lsdate" varStatus="lsd">
		lsdateArr['${lsd.index}'] = '${lsdate}'
	</c:forEach>
	var ledateArr = new Array();
	<c:forEach items="${learn.learnenddateArr}" var="ledate" varStatus="led">
		ledateArr['${led.index}'] = '${ledate}'
	</c:forEach>
	var ltextArr = new Array();
	<c:forEach items="${learn.learntextareaArr}" var="ltext" varStatus="ltx">
		ltextArr['${ltx.index}'] = '${ltext}'
	</c:forEach>
	for(var learnFrmcount=1;learnFrmcount<learncnt;learnFrmcount++){
		var html = '<div id="formLearn"><div id="deleteBox"><button type="button" name="deleteLearn" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formLearn1" class="input-group-prepend"><input type="text" name="learntitle" id="learntitle'+learnFrmcount+'" class="form-control" placeholder="교육명" value="'+ltitleArr[learnFrmcount]+'"/>';
		html += '<input type="text" name="learnagency" id="learnagency'+learnFrmcount+'" class="form-control" placeholder="교육기관" value="'+lagencyArr[learnFrmcount]+'"/>';
		html += '<input type="text" name="learnstartdate" id="learnstartdate'+learnFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)" value="'+lsdateArr[learnFrmcount]+'"/>';
		html += '<input type="text" name="learnenddate" id="learnenddate'+learnFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)" value="'+ledateArr[learnFrmcount]+'"/></div>';
		html += '<div id="formLearn2" class="input-group-prepend"><ul><li>내용 :</li><li><textarea name="learntextarea" class="form-control" aria-label="With textarea" id="learntextarea'+learnFrmcount+'" placeholder="이수하신 교육과정에 대해 적어주세요.">'+ltextArr[learnFrmcount]+'</textarea></li></ul></div></div>';
		$('#learnWrap').append(html);
	}
}
var learnFrmcount = learncnt;
$("#addLearn").on("click",function() {
	var html = '<div id="formLearn"><div id="deleteBox"><button type="button" name="deleteLearn" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formLearn1" class="input-group-prepend"><input type="text" name="learntitle" id="learntitle'+learnFrmcount+'" class="form-control" placeholder="교육명"/>';
	html += '<input type="text" name="learnagency" id="learnagency'+learnFrmcount+'" class="form-control" placeholder="교육기관"/>';
	html += '<input type="text" name="learnstartdate" id="learnstartdate'+learnFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)"/>';
	html += '<input type="text" name="learnenddate" id="learnenddate'+learnFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)"/></div>';
	html += '<div id="formLearn2" class="input-group-prepend"><ul><li>내용 :</li><li><textarea name="learntextarea" class="form-control" aria-label="With textarea" id="learntextarea'+learnFrmcount+'" placeholder="이수하신 교육과정에 대해 적어주세요."></textarea></li></ul></div></div>';
	$('#learnWrap').append(html);
	learnFrmcount++;
});
$(document).on("click", "textarea[name=learntextarea]", function() {
	$(this).css("height","150px");
});
$(document).on("mouseout", "textarea[name=learntextarea]", function() {
	$(this).css("height","75px");
});
/* 자격증 */
var certificationexist = "${certification}";
if(certificationexist != '') {
	$("#certificateTotal").show();
	var certificationcnt = "${certificationcnt}";
	var cnameArr = new Array();
	<c:forEach items="${certification.certnameArr}" var="cname" varStatus="cn">
		cnameArr['${cn.index}'] = '${cname}';
	</c:forEach>
	var cpArr = new Array();
	<c:forEach items="${certification.certpublisherArr}" var="cpublish" varStatus="cp">
		cpArr['${cp.index}'] = '${cpublish}';
	</c:forEach>
	var cdArr = new Array();
	<c:forEach items="${certification.certdateArr}" var="cdate" varStatus="cd">
		cdArr['${cd.index}'] = '${cdate}';
	</c:forEach>
	for(var certFrmcount=1;certFrmcount<certificationcnt;certFrmcount++){
		var html = '<div id="formCertificate"><div id="deleteBox"><button type="button" name="deleteCertificate" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formCertificate" class="input-group-prepend"><input type="text" name="certname" id="certname'+certFrmcount+'" class="form-control" placeholder="자격증 명" value="'+cnameArr[certFrmcount]+'"/>';
		html += '<input type="text" name="certpublisher" id="certpublisher'+certFrmcount+'" class="form-control" placeholder="발행처" value="'+cpArr[certFrmcount]+'"/>';
		html += '<input type="text" name= "certdate" id="certdate'+certFrmcount+'" class="form-control"placeholder="취득년월(예.2019.01)" value="'+cdArr[certFrmcount]+'"/></div><div name="showCertificate"></div></div>';
		$('#certificateWrap').append(html);
	}
}
var certFrmcount = certificationcnt;
$("#addCert").on("click",function() {
	var html = '<div id="formCertificate"><div id="deleteBox"><button type="button" name="deleteCertificate" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formCertificate" class="input-group-prepend"><input type="text" name="certname" id="certname'+certFrmcount+'" class="form-control" placeholder="자격증 명"/>';
	html += '<input type="text" name="certpublisher" id="certpublisher'+certFrmcount+'" class="form-control" placeholder="발행처"/>';
	html += '<input type="text" name= "certdate" id="certdate'+certFrmcount+'" class="form-control"placeholder="취득년월(예.2019.01)"/></div><div name="showCertificate"></div></div>';
	$('#certificateWrap').append(html);
	certFrmcount++;
});
$(document).on("keypress","input[name=certname]",function() {
	var divsearch = $(this).parent().parent().find("div[name=showCertificate]");
	var certName = $(this).val();
	divsearch.show();
	if (event.keyCode === 13) {
        event.preventDefault();
    }
	$.ajax({
		url : "${pageContext.request.contextPath }/resume/certificateList.ithrer",
		data : {"certname" : certname},
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
	var input = $(this).parent().parent().parent().find("input[name=certname]");
	input.val(output);
	$(this).parent().parent().hide();
});
/* 수상 */
var awardexist = "${award}";
if(awardexist != '') {
	$("#awardTotal").show();
	var awardcnt = "${awardcnt}";
	var anameArr = new Array();	
	<c:forEach items="${award.awardnameArr}" var="aname" varStatus="an">
		anameArr['${an.index}'] = '${aname}';
	</c:forEach>
	var aagencyArr = new Array();	
	<c:forEach items="${award.awardagencyArr}" var="agency" varStatus="ag">
		aagencyArr['${ag.index}'] = '${agency}';
	</c:forEach>
	var awarddateArr = new Array();	
	<c:forEach items="${award.awarddateArr}" var="adate" varStatus="ad">
		awarddateArr['${ad.index}'] = '${adate}';
	</c:forEach>
	var awardtextareaArr = new Array();	
	<c:forEach items="${award.awardtextareaArr}" var="atext" varStatus="at">
		awardtextareaArr['${at.index}'] = '${atext}';
	</c:forEach>
	for(var AwardFrmcount=1;AwardFrmcount<awardcnt;AwardFrmcount++) {
		var html = '<div id="formAward"><div id="deleteBox"><button type="button" name="deleteAward" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formAward1" class="input-group-prepend"><input type="text" name="awardname" id="awardname'+AwardFrmcount+'" class="form-control" placeholder="수상명" value="'+anameArr[AwardFrmcount]+'"/>';
		html += '<input type="text" name="awardagency" id="awardagency'+AwardFrmcount+'" class="form-control" placeholder="수여기관" value="'+aagencyArr[AwardFrmcount]+'"/>';
		html += '<input type="text" name="awarddate" id="awarddate'+AwardFrmcount+'" class="form-control" placeholder="수상연도(예.2019)" value="'+awarddateArr[AwardFrmcount]+'"/></div>';
		html += '<div id="formAward2" class="input-group-prepend"><ul><li>수여내용 :</li><li><textarea name="awardtextarea" class="form-control" aria-label="With textarea" id="awardtextarea'+AwardFrmcount+'" placeholder="수여 내용 및 결과를 자세히 입력해주세요.">'+awardtextareaArr[AwardFrmcount]+'</textarea></li></ul></div></div>';
		$('#awardWrap').append(html);
	};
};
var AwardFrmcount = awardcnt;
$("#addAward").on("click",function() {
	var html = '<div id="formAward"><div id="deleteBox"><button type="button" name="deleteAward" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formAward1" class="input-group-prepend"><input type="text" name="awardname" id="awardname'+AwardFrmcount+'" class="form-control" placeholder="수상명"/>';
	html += '<input type="text" name="awardagency" id="awardagency'+AwardFrmcount+'" class="form-control" placeholder="수여기관"/>';
	html += '<input type="text" name="awarddate" id="awarddate'+AwardFrmcount+'" class="form-control" placeholder="수상연도(예.2019)"/></div>';
	html += '<div id="formAward2" class="input-group-prepend"><ul><li>수여내용 :</li><li><textarea name="awardtextarea" class="form-control" aria-label="With textarea" id="awardtextarea'+AwardFrmcount+'" placeholder="수여 내용 및 결과를 자세히 입력해주세요."></textarea></li></ul></div></div>';
	$('#awardWrap').append(html);
	AwardFrmcount++;
	console.log(AwardFrmcount);
});
$(document).on("click", "textarea[name=awardtextarea]", function() {
	$(this).css("height","100px");
});
$(document).on("mouseout", "textarea[name=awardtextarea]", function() {
	$(this).css("height","75px");
});
/* 해외경험 */
var overseasexist = "${overseas}";
if(overseasexist != ''){
	$("#overseasTotal").show();
	var overseascnt = "${overseascnt}";
	var counArr = new Array();
	<c:forEach items="${overseas.countryArr}" var="coun" varStatus="cn">
		counArr['${cn.index}'] = '${coun}'
	</c:forEach>
	var osdArr = new Array();
	<c:forEach items="${overseas.overseasstartdateArr}" var="osdate" varStatus="osd">
	osdArr['${osd.index}'] = '${osdate}'
	</c:forEach>
	var oedArr = new Array();
	<c:forEach items="${overseas.overseasenddateArr}" var="oedate" varStatus="oed">
	oedArr['${oed.index}'] = '${oedate}'
	</c:forEach>
	var otxtArr = new Array();
	<c:forEach items="${overseas.overseastextareaArr}" var="otext" varStatus="otxt">
	otxtArr['${otxt.index}'] = '${otext}'
	</c:forEach>
	for(var OverseasFrmcount=1;OverseasFrmcount<overseascnt;OverseasFrmcount++){
		var html ='<div id="formOverseas"><div id="deleteBox"><button type="button" name="deleteOverseas" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
		html += '<div id="formOverseas1" class="input-group-prepend"><input type="text" name="country" id="country'+OverseasFrmcount+'" class="form-control" placeholder="국가명" value="'+counArr[OverseasFrmcount]+'"/>';
		html += '<input type="text" name="overseasstartdate" id="overseasstartdate'+OverseasFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)" value="'+osdArr[OverseasFrmcount]+'"/>';
		html += '<input type="text" name="overseasenddate" id="overseasenddate'+OverseasFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)" value="'+oedArr[OverseasFrmcount]+'"/></div>';
		html += '<div id="formOverseas2" class="input-group-prepend"><ul><li>내용 :</li><li><textarea name="overseastextarea"class="form-control" aria-label="With textarea" id="overseastextarea'+OverseasFrmcount+'" placeholder="해외에서 어떤 경험을 했는지 적어주세요.(ex.어학연수,교환학생,워킹홀리데이,해외근무)">'+otxtArr[OverseasFrmcount]+'</textarea></li></ul></div></div>';
		$('#overseasWrap').append(html);
	}
}
var OverseasFrmcount = overseascnt;
$("#addOverseas").on("click",function() {
	var html ='<div id="formOverseas"><div id="deleteBox"><button type="button" name="deleteOverseas" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formOverseas1" class="input-group-prepend"><input type="text" name="country" id="country'+OverseasFrmcount+'" class="form-control" placeholder="국가명"/>';
	html += '<input type="text" name="overseasstartdate" id="overseasstartdate'+OverseasFrmcount+'" class="form-control" placeholder="시작년월(예.1991.01)"/>';
	html += '<input type="text" name="overseasenddate" id="overseasenddate'+OverseasFrmcount+'" class="form-control" placeholder="종료년월(예.2019.01)"/></div>';
	html += '<div id="formOverseas2" class="input-group-prepend"><ul><li>내용 :</li><li><textarea name="overseastextarea"class="form-control" aria-label="With textarea" id="overseastextarea'+OverseasFrmcount+'" placeholder="해외에서 어떤 경험을 했는지 적어주세요.(ex.어학연수,교환학생,워킹홀리데이,해외근무)"></textarea></li></ul></div></div>';
	$('#overseasWrap').append(html);
	OverseasFrmcount++;
});
$(document).on("click", "textarea[name=overseastextarea]", function() {
	$(this).css("height","150px");
});
$(document).on("mouseout", "textarea[name=overseastextarea]", function() {
	$(this).css("height","75px");
});
/* 어학 */
$("#addLanguage").on("click",function() {
	var html = '<div id="formLanguage" class="input-group-prepend"><div id="deleteBox"><button type="button" id="deleteLanguage" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></div>';
	html += '<div id="formLanguage1" class="input-group-prepend"><select name="languagedivision" id="languagedivision'+langFrmcount+'" class="custom-select"><option value="" disabled selected>구분</option>';
	html += '<option value="회화능력">회화능력</option><option value="공인시험">공인시험</option></select>';
	html += '<select name="languagename" id="languagename'+langFrmcount+'" class="custom-select language-select"><option value="" disabled selected>외국어명</option>';
	html += '<option value="영어">영어</option><option value="일본어">일본어</option><option value="중국어">중국어</option><option value="직접입력">직접입력</option></select>';
	html += '<input type="text" name="selftext" id="selftext'+langFrmcount+'" class="form-control"/>';
	html += '<select name="speakingdivision" id="speakingdivision'+langFrmcount+'" class="custom-select"><option value="" disabled selected>회화능력</option><option value="일산회화가능">일상회화 가능</option>';
	html += '<option value="비즈니스회화가능">비즈니스 회화가능</option><option value="원어민수준">원어민 수준</option></select></div>';
	html += '<div id="formLanguage2" class="input-group-prepend"><select name="examname" id="examname'+langFrmcount+'" class="custom-select"><option value="" disabled selected>공인시험</option>';
	html += '<option value="기타">기타</option><option value="직접입력">직접입력</option></select>';
	html += '<input type="text" name="selfexam" id="selfexam'+langFrmcount+'" class="form-control"/>';
	html += '<input type="text" name="examscore" id="examscore'+langFrmcount+'" class="form-control" placeholder="급수/점수"/>';
	html += '<input type="text" name="examdate" id="examdate'+langFrmcount+'" class="form-control" placeholder="취득년월(예.1991.01)"/></div></div>';
	$('#languageWrap').append(html);
	langFrmcount++;
});
$(document).on("change","select[name=languagedivision]",function(){
	var state = $(this).val();
	if(state == "공인시험") {
		$(this).parent().parent().find("select[name=examname]").show();
		$(this).parent().parent().find("input[name=examscore]").show();
		$(this).parent().parent().find("input[name=examdate]").show();
		$(this).parent().parent().find("select[name=speakingdivision]").hide();
		$(this).parent().parent().find("select[name=speakingdivision]").val('');
	}
	else {
		$(this).parent().parent().find("select[name=examname]").hide();
		$(this).parent().parent().find("select[name=examname]").val('');
		$(this).parent().parent().find("input[name=examscore]").hide();
		$(this).parent().parent().find("input[name=examscore]").val('');
		$(this).parent().parent().find("input[name=examdate]").hide();
		$(this).parent().parent().find("input[name=examdate]").val('');
		$(this).parent().parent().find("select[name=speakingdivision]").show();
		$(this).parent().parent().find("input[name=selfexam]").hide();
		$(this).parent().parent().find("input[name=selfexam]").val('');
	}
});
$(document).on("change","select[name=examname]",function() {
	var state = $(this).val();
	if(state == "직접입력") {
		$(this).parent().find("input[name=selfexam]").show();
	}
	else {
		$(this).parent().find("input[name=selfexam]").hide();
		$(this).parent().find("input[name=selfexam]").val('');
	}
});
$(document).on("change", ".language-select" , function(){
	var state = $(this).val();
	if(state == "직접입력") {
		$(this).next().show();
	}
	else {
		$(this).next().hide();
		$(this).next().val('');
	}
});
/* 포트폴리오 */
var portexist = "${portFolio}";
var portexisturl = "${portFolio.url}";
var portexistrename = "${portFoliorename}";
console.log(portexist);
console.log(portexisturl);

if(portexist != '') {
	$("#potfolioTotal").show();
	if(portexisturl !='') {
		var html = '<ul><li><select name="potselect" class="custom-select"><option value="" disabled selected>구분</option>';
		html += '<option value="이력서">이력서</option><option value="포트폴리오">포트폴리오</option><option value="증명서">증명서</option>';
		html += '<option value="자격증">자격증</option><option value="추천서">추천서</option><option value="기획서">기획서</option>';
		html += '</select></li><li><input type="text" name="url" id="url'+fotFrmcount+'" class="form-control" placeholder="http://example.com" value="'+portexisturl+'"/></li>';
		html += '<li><button type="button" name="deletefotinput" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></li></ul>';
		$("#potfolioList").append(html);
	}
	if(portexistrename != ''){
		var html = '<ul><li><select name="potselect" class="custom-select"><option value="" disabled selected>구분</option>';
		html += '<option value="이력서">이력서</option><option value="포트폴리오">포트폴리오</option><option value="증명서">증명서</option>';
		html += '<option value="자격증">자격증</option><option value="추천서">추천서</option><option value="기획서">기획서</option>';
		html += '</select></li><li><input type="text" class="form-control" value="'+portexistrename+'" readonly/></li>';
		html += '<li><button type="button" name="deletefotinput" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></li></ul>';
		$("#potfolioList").append(html);
	}
}

$("#addUrl").on("click",function() {
	var html = '<ul><li><select name="potselect" class="custom-select"><option value="" disabled selected>구분</option>';
	html += '<option value="이력서">이력서</option><option value="포트폴리오">포트폴리오</option><option value="증명서">증명서</option>';
	html += '<option value="자격증">자격증</option><option value="추천서">추천서</option><option value="기획서">기획서</option>';
	html += '</select></li><li><input type="text" name="url" id="url'+fotFrmcount+'" class="form-control" placeholder="http://example.com"/></li>';
	html += '<li><button type="button" name="deletefotinput" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></li></ul>';
	$("#potfolioList").append(html);
	fotFrmcount++;
});
$("#addFile").on("click",function() {
	var html = '<ul><li><select name="potselect" class="custom-select"><option value="" disabled selected>구분</option>';
	html += '<option value="이력서">이력서</option><option value="포트폴리오">포트폴리오</option><option value="증명서">증명서</option>';
	html += '<option value="자격증">자격증</option><option value="추천서">추천서</option><option value="기획서">기획서</option>';
	html += '</select></li><li><input type="file" name="pOriginalFileName" id="pOriginalFileName'+fotFilecount+'" class="form-control"/></li>';
	html += '<li><button type="button" name="deletefotinput" onclick="deleteTwice(event);"><span aria-hidden="true">X</span></button></li></ul>';
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
var letterexist = "${letter}";
if(letterexist !=''){
	$("#letterTotal").show();
	var lettercnt = "${lettercnt}";
	var ltextArr = new Array();
	<c:forEach items="${letter.lettertextArr}" var="ltext" varStatus="lxt">
		ltextArr['${lxt.index}'] = '${ltext}'
	</c:forEach>
	var lareaArr = new Array();
	<c:forEach items="${letter.letterareaArr}" var="larea" varStatus="lar">
		lareaArr['${lar.index}'] = '${larea}'
	</c:forEach>
	for(var lettercount = 0;lettercount<lettercnt;lettercount++){
		var html = '<div class="letterDiv"><input type="text" name="lettertext" id="lettertext'+lettercount+'" placeholder="항목 제목을 입력하세요." value="'+ltextArr[lettercount]+'" >';
		html += '<button type="button" class="deleteLetter" onclick="deleteone(event);"><span aria-hidden="true">X</span></button><div>';
		html += '<textarea name="letterarea" id="letterarea'+lettercount+'" placeholder="해당내용을 입력하세요.">'+lareaArr[lettercount]+'</textarea></div></div>';
		$('#formLetter').append(html);
	}
}
var lettercount = lettercnt;
$("#addLetter").on("click",function() {
	var html = '<div class="letterDiv"><input type="text" name="lettertext" id="lettertext'+lettercount+'" placeholder="항목 제목을 입력하세요.">';
	html += '<button type="button" class="deleteLetter" onclick="deleteone(event);"><span aria-hidden="true">X</span></button><div>';
	html += '<textarea name="letterarea" id="letterarea'+lettercount+'" placeholder="해당내용을 입력하세요."></textarea></div></div>';
	$('#formLetter').append(html);
	lettercount++;
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