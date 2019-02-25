package com.spring.ithrer.index.model.vo;

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
public class CompanyApplication implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int caNo; // CompanyApplication 식별번호
	private String memberId;
	private String compId;
	private int recruitmentNo;
	private String cuResdate; // 지원한 날짜
	private String read; // 회사가 이 지원자 이력서를 읽었는지 안읽었는지 (읽음: Y, 읽지않음: N(기본값))
}
