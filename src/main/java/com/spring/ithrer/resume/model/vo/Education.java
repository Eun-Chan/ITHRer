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
	private String[] nonhigh;
	private String graduaction;
	private String schoolName;
	private String highgraduationDate;
	private String highgraduationState;
	private String admissionDate;
	private String graduationDate;
	private String graducationstate;
	private String[] transfer;
	private String major;
	private String score;
	private double totalscore;
	private String degree;
	private String otherDepartSel;
	private String secmajor;
	private String otherDepartText;	
}
