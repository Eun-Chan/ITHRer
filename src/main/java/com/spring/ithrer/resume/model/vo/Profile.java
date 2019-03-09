package com.spring.ithrer.resume.model.vo;

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
	private String photo;
	private String memberId;
	
	// 지원한 회사 join용 필드
	private CompanyApplication ca;
	private Education education;
	private Overseas overseas;
	private Award award;
	private Career career;
	private Certification certification;
	private Hopework hopework;
	private Intern intern;
	private Language language;
	private Learn learn;
	private PortFolio portfolio;
	private Preference preference;
	
	// 나이 저장용 필드
	private int age;
	// 기업이 회원 즐겨찾기용 필드(즐찾했으면 1 아니면 0)
	private int count;
}
