package com.spring.ithrer.resume.model.vo;

import java.io.Serializable;

public class Education implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String graduaction;
	private String schoolName;
	private String admissionDate;
	private String graduationDate;
	private String graduationState;
	private String grade;
	private String transfer;
	private String major;
	private String secmajor;
	
	public Education() {}

	public Education(String graduaction, String schoolName, String admissionDate, String graduationDate,
			String graduationState, String grade, String transfer, String major, String secmajor) {
		super();
		this.graduaction = graduaction;
		this.schoolName = schoolName;
		this.admissionDate = admissionDate;
		this.graduationDate = graduationDate;
		this.graduationState = graduationState;
		this.grade = grade;
		this.transfer = transfer;
		this.major = major;
		this.secmajor = secmajor;
	}

	public String getGraduaction() {
		return graduaction;
	}

	public void setGraduaction(String graduaction) {
		this.graduaction = graduaction;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getAdmissionDate() {
		return admissionDate;
	}

	public void setAdmissionDate(String admissionDate) {
		this.admissionDate = admissionDate;
	}

	public String getGraduationDate() {
		return graduationDate;
	}

	public void setGraduationDate(String graduationDate) {
		this.graduationDate = graduationDate;
	}

	public String getGraduationState() {
		return graduationState;
	}

	public void setGraduationState(String graduationState) {
		this.graduationState = graduationState;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSecmajor() {
		return secmajor;
	}

	public void setSecmajor(String secmajor) {
		this.secmajor = secmajor;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Education [graduaction=" + graduaction + ", schoolName=" + schoolName + ", admissionDate="
				+ admissionDate + ", graduationDate=" + graduationDate + ", graduationState=" + graduationState
				+ ", grade=" + grade + ", transfer=" + transfer + ", major=" + major + ", secmajor=" + secmajor + "]";
	}
	
	
}
