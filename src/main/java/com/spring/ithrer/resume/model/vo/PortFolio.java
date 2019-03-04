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
public class PortFolio implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String url;
//	private String pOriginalFileName;
	private String pOriginalFileNameTest;
	private String pRenamedFileName;
	private String memberId;
	private int pfNo;
}
