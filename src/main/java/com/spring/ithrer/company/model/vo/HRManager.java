package com.spring.ithrer.company.model.vo;

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
public class HRManager implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String compId;
	private String name;
	private String department;
	private String position;
	private String phone;
	private String email;
	private String enrollDate;
	

}
