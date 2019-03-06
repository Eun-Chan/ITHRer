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
public class Learn implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String learntitle;
	private String[] learntitleArr;
	private String learnagency;
	private String[] learnagencyArr;
	private String learnstartdate;
	private String[] learnstartdateArr;
	private String learnenddate;
	private String[] learnenddateArr;
	private String learntextarea;
	private String[] learntextareaArr;

}
