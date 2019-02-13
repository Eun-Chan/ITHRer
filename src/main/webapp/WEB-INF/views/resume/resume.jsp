<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/resume.css" />
<br /><br />
<div class="container">
<br /><br />
<div id="resumeTitle" class="input-group input-group-lg">
	<input type="text" id="userResumeTitle" 
		   class="form-control" aria-label="Sizing example input" 
		   aria-describedby="inputGroup-sizing-lg" placeholder="기업에게 나에 대해 알려줍시다.강점,목표,관심분야도 좋아요."/>
</div>
<br />
<h3>인적사항</h3>
<div id="profileWrap">
	<div id="formProfile1" class="input-group-prepend">
		<input type="text" id="name" class="form-control" placeholder="이름"/>
		<input type="text" id="birth" class="form-control" placeholder="생년월일(예.1991.01.01)"/>
		<select id="gender" class="custom-select">
			<option value="" disabled selected>성별</option>
		  	<option value="M">남</option>
		 	<option value="F">여</option>
		</select>
		<input type="email" id="email" class="form-control" placeholder="이메일"/>
	</div>
	<div id="formProfile2" class="input-group-prepend">
		<input type="tel" id="tel" class="form-control" 
			   placeholder="전화번호(01012345678)" maxlength="11"
			   onkeydown="validateText(event)"/>
		<input type="text" id="address" class="form-control" placeholder="주소"/>	
	</div>		
</div>
<br />
<h3>학력</h3>
<div id="educationWrap">
	<!-- <div id="formEducation">
		<select id="school">
			<option value="" disabled selected>학교구분</option>
			<option value="high">고등학교</option>
			<option value="shortUniver">대학(2,3년)</option>
			<option value="longUniver">대학교(4년)</option>			
			<option value="graduate">대학원</option>			
		</select>
		<input type="text" id="schoolName" placeholder="학교명"/>
		<button id="searchSchool" onclick="">찾기</button>
		<input type="text" id="graduationDate" placeholder="졸업년도"/>
		<select id="graduationState">
			<option value="" disabled selected>졸업상태</option>
			<option value="graduated">졸업</option>
			<option value="ungraduated">졸업예정</option>
		</select> 
		<input type="checkbox" id="ged" value="ged"/>대입검정고시
	</div> -->
	<div id="buttonEducation">
		<button id="addEducation" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<br />
<h3>희망근무조건</h3>
<div id="hopeworkWrap">
	<div id="formHopework1" class="input-group-prepend">
		<input type="text" id="jobType" class="form-control" placeholder="고용형태"/>
		<input type="text" id="wantPay" class="form-control" onkeydown="validateText(event)" placeholder="희망연봉(단위 :만원)"/>
	<div id="formHopeworkCheckbox"class="input-group-text">
		<input type="checkbox" id="visitDetermine" value="visitDetermine" aria-label="Checkbox for following text input"/>&nbsp;면접 후 결정
	</div>
	</div>
	<div id="formHopework2" class="input-group mb-3">
		<div id="hopeworkList" class="input-group-prepend">
			<div id="hopeHeader">희망근무지</div>
			<button id="addHopework">
				<span>추가하기</span>
			</button>
		</div>
	</div>
	<div id="formHopework3" class="input-group mb-3">
		<div id="dutyList" class="input-group-prepend">
			<div id="dutyHeader">직무,산업,키워드</div>
			<button id="addDuty">
				<span>추가하기</span>
			</button>
		</div>
	</div>
</div>
<br />
<h3>인턴,대외활동</h3>
<div id="internWrap">
	<div id="formIntern1" class="input-group-prepend">
		<select id="internDivision" class="custom-select">
			<option value="" disabled selected>활동구분</option>
			<option value="intern">인턴</option>
			<option value="alba">아르바이트</option>
			<option value="circles">동아리</option>
			<option value="volunteer">자원봉사</option>
			<option value="socialActivity">사회활동</option>
			<option value="schoolActivity">교내활동</option>
		</select>
		<input type="text" id="socialInst" class="form-control" placeholder="회사/기관/단체명"/>
		<input type="text" id="acstartDate" class="form-control" placeholder="시작년월(예.1991.01)"/>
		<input type="text" id="acendDate" class="form-control" placeholder="종료년월(예.2019.01)"/>
	</div>
	<br />
	<div id="formIntern2" >
		<div id="acTextarea" class="input-group-prepend">
			<div id="dutyHeader">활동내용</div>
			<input type="text" id="acContent" class="form-control" placeholder="직무와 관련된 경험에 대해 (상황-노력-결과)순으로 작성하는것이 좋습니다."/>		
		</div>
	</div>
	<div id="buttonIntern" class="input-group-prepend">
		<button id="addIntern" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<br />
<h3>교육</h3>
<div id="learnWrap">
	<div id="formLearn1" class="input-group-prepend">
		<input type="text" id="learnTitle" class="form-control" placeholder="교육명"/>
		<input type="text" id="learnAgency" class="form-control" placeholder="교육기관"/>
		<input type="text" id="learnstartDate" class="form-control" placeholder="시작년월(예.1991.01)"/>
		<input type="text" id="learnendDate" class="form-control" placeholder="종료년월(예.2019.01)"/>
		<br />
	</div>
	<div id="formLearn2" class="input-group-prepend">
		<input type="text" class="form-control" placeholder="이수하신 교육과정에 대해 적어주세요."/>
	</div>
	<div id="buttonLearn" class="input-group-prepend">
		<button id="addLearn" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<br />
<h3>자격증</h3>
<div id="certificateWrap">
	<div id="formCertificate" class="input-group-prepend">
		<input type="text" id="certName" class="form-control" placeholder="자격증 명"/>
		<input type="text" id="certPublisher" class="form-control" placeholder="발행처"/>
		<input type="text" id="certDate" class="form-control"placeholder="취득년월(예.2019.01)"/>
	</div>
	<div id="buttonCert" class="input-group-prepend">
		<button id="addCert" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<br />
<h3>수상</h3>
<div id="awardWrap">
	<div id="formAward1" class="input-group-prepend">
		<input type="text" id="awardName" class="form-control" placeholder="수상명"/>
		<input type="text" id="awardAgency" class="form-control" placeholder="수여기관"/>
		<input type="text" id="awardDate" class="form-control" placeholder="수상연도(예.2019)"/>
	</div>
	<div id="formAward2" >
		<div id="awardTextarea" class="input-group-prepend">
			<div id="awardHeader">수여내용</div>
			<input type="text" id="awardContent" class="form-control" placeholder="수여 내용 및 결과를 자세히 입력해주세요."/>	
		</div>
	</div>
	<div id="buttonAward" class="input-group-prepend">
		<button id="addAward" class="btn btn-outline-info">추가</button>	
	</div>
</div>
<br />
<h3>해외경험</h3>
<div id="overseasWrap">
	<div id="formOverseas1" class="input-group-prepend">
		<input type="text" id="country" class="form-control" placeholder="국가명"/>
		<input type="text" id="overseasstartDate" class="form-control" placeholder="시작년월(예.1991.01)"/>
		<input type="text" id="overseasendDate" class="form-control" placeholder="종료년월(예.2019.01)"/>
	</div>
	<div id="formOverseas2" >
		<div id="overseasTextarea" class="input-group-prepend">
			<div id="awardHeader">내용</div>
			<input type="text" id="overseasContent"class="form-control" placeholder="해외에서 어떤 경험을 했는지 적어주세요.(ex.어학연수,교환학생,워킹홀리데이,해외근무)"/>	
		</div>
	</div>
	<div id="buttonOverseas" class="input-group-prepend">
		<button id="addOverseas" class="btn btn-outline-info">해외경험 추가</button>	
	</div>
</div>
<br />
<h3>어학</h3>
<div id="languageWrap">
	<div id="formLanguage" class="input-group-prepend">
		<select id="languageDivision" class="custom-select">
			<option value="" disabled selected>구분</option>
			<option value="speakingAbility">회화능력</option>
			<option value="standardExam">공인시험</option>
		</select>
		<select id="languageName" class="custom-select">
			<option value="" disabled selected>외국어명</option>
			<option value="english">영어</option>
			<option value="japanese">일본어</option>
			<option value="chinese">중국어</option>
			<option value="selfSelect">직접입력</option>
		</select>
		<select id="speakingDivision" class="custom-select">
			<option value="" disabled selected>회화능력</option>
			<option value="good">일상회화 가능</option>
			<option value="better">비즈니스 회화가능</option>
			<option value="best">원어민 수준</option>
		</select>
	</div>
	<div id="buttonLanguage" class="input-group-prepend">
		<button id="addLanguage" class="btn btn-outline-info">어학 추가</button>	
	</div>
</div>
<br />
<h3>포트폴리오</h3>
<div id="potfolioWrap">
	<div id="formpotfolio" class="input-group-prepend">
		<span>
			<button id="addUrl" class="btn btn-outline-info">URL추가</button>
		</span>
		<span>
			<button id="addFile" class="btn btn-outline-info">파일추가</button>
		</span>
	</div>
</div>
<br />
<h3>취업우대</h3>
<div id="preferenceWrap">
	<div id="formPreference" class="input-group-prepend">
		<div id="divCheckbox" class="input-group-text">
			<input type="checkbox" id="veteran" aria-label="Checkbox for following text input" value="veteran"/>
			<label for="veteran">보훈대상</label>		
		</div>
		<div id="divProtected" class="input-group-text">
			<input type="checkbox" id="protected" aria-label="Checkbox for following text input" value="protected"/>
			<label for="protected">취업보호 대상</label>		
		</div>
		<div id="divSubsidy" class="input-group-text">
			<input type="checkbox" id="subsidy" aria-label="Checkbox for following text input" value="subsidy"/>
			<label for="subsidy">고용지원금 대상</label>		
		</div>
		<div id="divDisorder" class="input-group-text">
			<input type="checkbox" id="disorder" aria-label="Checkbox for following text input" value="disorder"/>
			<label for="disorder">장애</label>		
		</div>
		<div id="divMilitary" class="input-group-text">
			<input type="checkbox" id="military" aria-label="Checkbox for following text input" value="military"/>
			<label for="military">병역</label>		
		</div>
	</div>
</div>
<br />
<h3>자기소개서</h3>
<div id="letterWrap">
	<div id="formLetter">
		<div id="buttonLetter" class="input-group-prepend">
			<button id="addLetter" class="btn btn-outline-info">추가</button>	
		</div>
	</div>
</div>
<br />
<h3>경력</h3>
<div id="careerWrap">
	<div id="formCareer1" class="input-group-prepend">
		<input type="text" id="corpName" class="form-control" placeholder="회사명"/>
		<input type="text" id="department" class="form-control" placeholder="부서명"/>
		<input type="text" id="hiredDate" class="form-control" placeholder="입사년월(예.1991.01)"/>
		<input type="text" id="retiredDate" class="form-control" placeholder="퇴사년월(예.2019.01)"/>
		<div id="formWorkingCheckbox" class="input-group-text">
			<input type="checkbox" id="buttonWorking" value="working" aria-label="Checkbox for following text input"/>&nbsp;재직중
		</div>
	</div>
	<div id="formCareer2" class="input-group-prepend">
		<input type="text" id="job" class="form-control" placeholder="직무"/>
		<input type="text" id="income" class="form-control" onkeydown="validateText(event)" placeholder="연봉(단위 :만원)"/>
	</div>
	<div id="formCareer3" class="input-group-prepend">
		<input type="text" id="description" class="form-control" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요."/>
	</div>
	<div id="buttonCareer" class="input-group-prepend">
			<button id="addCareer" class="btn btn-outline-info">추가</button>	
	</div>
</div>
</div>
<br />
<div id="finishButtonWrap" class="input-group-prepend">
	<button id="saveButton" class="btn btn-primary">작성완료</button>
</div>
<script>
function validateText(event) {
	var code = event.keyCode;
	if (code > 47 && code < 58) {
	   return;
	}
	else if (code == 8) {
		return;
	}
	else if (code == 46){
		return;
	}
	else {
		event.preventDefault();		
	}
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>