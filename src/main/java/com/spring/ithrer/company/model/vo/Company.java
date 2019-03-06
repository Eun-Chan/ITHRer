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
	private String mainBussiness;
	private String classification;
	private String capital;
	private String sales;
	private String listed;
	private String introduction;
	private int personnel;
	private String phone;
	private String fax;
	private String homepage;
	private String bussinessScale;
	private String location;
	private String enrollDate;
	private String delFlag;
	private String password;
	private String compEmail;
	private String logoS3;
	
	// 추가적으로 필요한 정보 담을 필드 (쿼리에서 생성한 것)
	private String doe;
	
}
