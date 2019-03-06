package com.spring.ithrer.company.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Job {
	private static final long serialVersionUID = 1L;
	
	private int jobNo; //코드번호
	private String job1; //1차 카테고리
	private String job2; //2차 카테고리
}
