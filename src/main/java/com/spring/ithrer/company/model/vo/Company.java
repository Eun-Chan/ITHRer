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
	
	private String comp_id;
	private String comp_name;
	private String representive;
	private String license_no;
	private String date_of_establishment;
	private String category;
	private String main_business;
	private String classfication;
	private String capital;
	private String sales;
	private String listed;
	private String introduction;
	private String right_people;
	private int personnel;
	private String history;
	private String phone;
	private String fax;
	private String homepage;
	private String business_scale;
	private String location;
	private String pay_condition;
	private String nearby_station;
	private String welfare;
	private String enrollDate;
	private String del_flag;
	
}
