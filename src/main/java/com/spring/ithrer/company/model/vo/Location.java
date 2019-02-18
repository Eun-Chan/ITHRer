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
public class Location implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String compId;
	private int no;
	private int name;
	private String address;
	private String etc;
	

}
