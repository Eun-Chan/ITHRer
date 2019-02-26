package com.spring.ithrer.company.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Recruitment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int recruitmentNo; //모집번호
	private String recruitmentTitle; //모집제목
	private String employmentType; //고용형태
	private String typeOfOccupation; //모집직종
	private String recruitmentSection; //모집부문
	private String asignedTask; //담당업무
	private int recruitmentPersonnel; //모집인원
	private String position; //모집직급/직책
	private String department; //근무부서
	private String recruitmentReason; //모집배경
	private String compId; //기업아이디
	private String career; //경력
	private String education; //학력
	private String etcQualificationRequirement; //기타자격요건
	private String employmentPreference; //우대사항 
	private int applicantAge; //나이
	private String preliminaryQuestion; //자격요건
	private String questionForHrmanager; //질문사항
	private String openingDate; //접수시작날짜
	private String closingDate; //접수마감남짜
	private String applicationMethod; //접수방법
	private String applicationForm; //접수양식
	private String recruitmentStage; //전형단계
	private String docMethod; //제출서류 및 전형방법
	private String location; //근무지역
	private String payCondition; //급여조건
	private String nearbyStation; //인근전철역
	private String welfare; //복리후생
	
	private int noOfApplicant; // 해당 채용공고에 지원한 지원자수
	
	//서브쿼리용 copmName
	private String compName;
	
	//즐겨찾기 저장용 카운트
	private int favoritesCount;
	
	//데이터 저장용 D-day 타임
	private int endTime;
	
	//지원자 수 저장용
	private int count;
	
	//회사에 지원한적있는지 없는지 카운트 해당회원이 지원햇으면1 안햇으면0
	private int applyCount;

}
