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
	private String corpName;
	private String department;
	private String hiredDate;
	private String retiredDate;
	private boolean buttonWorking;
	private String jobposition;
	private String job;
	private String income0;
	private String description;
}
