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
public class Preference implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String[] prefercheck;
	private String disoderselect;
	private String[] disoderselectArr;
	private String militaryselect;
	private String[] militaryselectArr;
}
