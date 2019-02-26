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
	private String graduaction;
	private String schoolName;
	private String admissionDate;
	private String graduationDate;
	private String graduationState;
	private String grade;
	private String transfer;
	private String major;
	private int score;
	private double totalscore;
	private String senierproject;
	private String degree;
	private String secmajor;	
}
