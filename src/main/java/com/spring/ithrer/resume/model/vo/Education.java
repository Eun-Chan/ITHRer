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
public class Education implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String[] nonHigh;
	private String graduaction;
	private String[] graduactionArr;
	private String schoolname;
	private String[] schoolnameArr;
	private String highgraduationdate;
	private String[] highgraduationdateArr;
	private String highgraduationstate;
	private String[] highgraduationstateArr;
	private String admissiondate;
	private String[] admissiondateArr;
	private String graduationdate;
	private String[] graduationdateArr;
	private String graducationstate;
	private String[] graducationstateArr;
	private String[] transfer;
	private String major;
	private String[] majorArr;
	private String score;
	private String[] scoreArr;
	private String totalscore;
	private String[] totalscoreArr;
	private String degree;
	private String[] degreeArr;
	private String otherdepartsel;
	private String[] otherdepartselArr;
	private String secmajor;
	private String[] secmajorArr;
	private String otherdeparttext;	
	private String[] otherdeparttextArr;		
}

