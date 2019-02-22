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
	
	// 지원한 회사 join용 필드
	private CompanyApplication ca;
	// 나이 저장용 필드
	private int age;
	// 기업이 회원 즐겨찾기용 필드(즐찾했으면 1 아니면 0)
	private int count;
}
