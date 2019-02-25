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
	private String memberId;
	private String compId;
	private int recruitmentNo;
	private String cuResdate;
	private int resumeNo;
}
