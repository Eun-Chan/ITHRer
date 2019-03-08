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
public class Profile implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userresumetitle;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String memberId;
	// 나이 저장용 필드
	private int age;
	// 기업이 회원 즐겨찾기용 필드(즐찾했으면 1 아니면 0)
	private int count;
}