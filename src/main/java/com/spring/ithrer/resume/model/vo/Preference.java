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
	private boolean veteran;
	private boolean protect;
	private boolean subsidy;
	private boolean disorder;
	private boolean military;
	private String disoderselect;
	private String militaryselect;
}
