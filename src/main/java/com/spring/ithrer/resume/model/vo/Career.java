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
	private String department;
	private String hireddate;
	private String retireddate;
	private String[] buttonworking;
	private String jobposition;
	private String job;
	private String income;
	private String description;
}
