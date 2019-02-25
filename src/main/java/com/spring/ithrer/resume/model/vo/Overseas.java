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
public class Overseas implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String country;
	private String overseasstartDate;
	private String overseasendDate;
	private String overseasTextarea;
	
}