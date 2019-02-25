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
public class Award implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String awardName;
	private String awardAgency;
	private String awardDate;
	private String awardTextarea;
}
