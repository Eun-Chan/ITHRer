package com.spring.ithrer.common.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//즐겨찾기
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Favorites implements Serializable {

	private static final long serialVersionUID = 1L;
	private int favoritesNo;
	private String memberId;
	private int recruitmentNo;
	private String compId;
	//회원이 즐겨찾기하면 0 , 기업이 회원을 즐겨찾기하면 1
	private int selectNo;

}

