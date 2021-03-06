package com.spring.ithrer.common.model.vo;

import java.io.Serializable;

import com.spring.ithrer.resume.model.vo.Career;
import com.spring.ithrer.resume.model.vo.Profile;

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
	
	//스크랩한 공고를 바탕으로 추천 공고을 뽑기 위하여 카테고리 가져오기
	private String category;
	
	//필요한 채용정보 데이터 가져오기
	private String recruitmentTitle;
	private String closingDate;
	
	// 조인용 필드
	private Career career;
	private Profile profile;

}

