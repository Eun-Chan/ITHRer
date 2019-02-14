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
public class Company implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String compId;
	private String compName;
	private String representive;
	private String licenseNo;
	private String dateOfEstablishment;
	private String category;
	private String mainBusiness;
	private String classfication;
	private String capital;
	private String sales;
	private String listed;
	private String introduction;
	private String rightPeople;
	private int personnel;
	private String history;
	private String phone;
	private String fax;
	private String homepage;
	private String businessScale;
	private String location;
	private String payCondition;
	private String nearbyStation;
	private String welfare;
	private String enrollDate;
	private String delFlag;
	
}
