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
	private String languagedivision;
	private String[] languagedivisionArr;
	private String languagename;
	private String[] languagenameArr;
	private String selftext;
	private String[] selftextArr;
	private String speakingdivision;
	private String[] speakingdivisionArr;
	private String examname;
	private String[] examnameArr;
	private String selfexam;
	private String[] selfexamArr;
	private String examscore;
	private String[] examscoreArr;
	private String examdate;
	private String[] examdateArr;

}
