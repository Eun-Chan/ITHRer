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
	private String interndivision;
	private String socialinst;
	private String internstartdate;
	private String internenddate;
	private String interntextarea;

}
