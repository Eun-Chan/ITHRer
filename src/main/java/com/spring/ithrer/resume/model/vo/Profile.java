package com.spring.ithrer.resume.model.vo;

import java.io.Serializable;

public class Profile implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String tel;
	private String address;
	
	public Profile() {}

	public Profile(String name, String birth, String gender, String email, String tel, String address) {
		super();
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.tel = tel;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Profile [name=" + name + ", birth=" + birth + ", gender=" + gender + ", email=" + email + ", tel=" + tel
				+ ", address=" + address + "]";
	}
	
	
}
