package com.spring.ithrer.user.model.vo;

import java.io.Serializable;

import com.spring.ithrer.index.model.vo.CompanyApplication;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 지원자용으로 아예 그냥 vo만들어버림
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Applicant implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String temp;

}
