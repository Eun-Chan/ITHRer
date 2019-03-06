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
	private String schoolname;
	private String highgraduationdate;
	private String highgraduationstate;
	private String admissiondate;
	private String graduationdate;
	private String graducationstate;
	private String[] transfer;
	private String major;
	private String score;
	private String totalscore;
	private String degree;
	private String otherdepartSel;
	private String secmajor;
	private String otherdepartText;	
}
