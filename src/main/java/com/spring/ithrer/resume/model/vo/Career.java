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
public class Career implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String corpname;
	private String[] corpnameArr;
	private String department;
	private String[] departmentArr;
	private String hireddate;
	private String[] hireddateArr;
	private String retireddate;
	private String[] retireddateArr;
	private String[] buttonworking;
	private String jobposition;
	private String[] jobpositionArr;
	private String job;
	private String[] jobArr;
	private String income;
	private String[] incomeArr;
	private String description;
	private String[] descriptionArr;
}
