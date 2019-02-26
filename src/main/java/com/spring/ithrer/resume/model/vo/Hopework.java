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
public class Hopework implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String jobType;
	private String wantPay;
	private String[] visitDetermine;
	private String hopePlace;
	private String hopeDuty;
}	
