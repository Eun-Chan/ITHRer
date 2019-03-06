package com.spring.ithrer.user.model.vo;

import java.io.Serializable;

import com.spring.ithrer.index.model.vo.CompanyApplication;
import com.spring.ithrer.resume.model.vo.Award;
import com.spring.ithrer.resume.model.vo.Career;
import com.spring.ithrer.resume.model.vo.Certification;
import com.spring.ithrer.resume.model.vo.Education;
import com.spring.ithrer.resume.model.vo.Hopework;
import com.spring.ithrer.resume.model.vo.Intern;
import com.spring.ithrer.resume.model.vo.Language;
import com.spring.ithrer.resume.model.vo.Learn;
import com.spring.ithrer.resume.model.vo.Overseas;
import com.spring.ithrer.resume.model.vo.PortFolio;
import com.spring.ithrer.resume.model.vo.Preference;

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
