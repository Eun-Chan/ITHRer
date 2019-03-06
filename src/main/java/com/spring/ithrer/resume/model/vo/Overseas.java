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
	private String[] countryArr;
	private String overseasstartdate;
	private String[] overseasstartdateArr;
	private String overseasenddate;
	private String[] overseasenddateArr;
	private String overseastxtarea;
	private String[] overseastxtareaArr;
	
}
