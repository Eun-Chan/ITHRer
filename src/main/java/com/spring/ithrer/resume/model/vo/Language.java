package com.spring.ithrer.resume.model.vo;

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
public class Language implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String languageDivision;
	private String languageName;
	private String selfText;
	private String speakingDivision;
	private String examName;
	private String selfExam;
	private String examscore;
	private String examDate;

}
