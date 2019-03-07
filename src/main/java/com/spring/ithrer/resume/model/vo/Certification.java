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
public class Certification implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String certName;
	private String[] certNameArr;
	private String certPublisher;
	private String[] certPublisherArr;
	private String certDate;
	private String[] certDateArr;

}
