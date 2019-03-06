package com.spring.ithrer.company.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Position {
	private static final long serialVersionUID = 1L;
	
	private String positionCategory;
	private String positionName;
}
