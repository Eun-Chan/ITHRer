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
public class Intern implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String internDivision;
	private String socialInst;
	private String internstartDate;
	private String internendDate;
	private String internTextarea;

}