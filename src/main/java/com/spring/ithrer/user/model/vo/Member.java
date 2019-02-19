package com.spring.ithrer.user.model.vo;

import java.io.Serializable;

import com.spring.ithrer.index.model.vo.CompanyApplication;

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
public class Member implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String memberName;
	private String password;
	private String phone;
	private String email;
	private String birth;
	private String gender;
	private String address;
	private String photo;
	private String delFlag;
	
	private CompanyApplication ca;
}
