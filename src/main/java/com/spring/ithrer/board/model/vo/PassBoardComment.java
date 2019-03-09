package com.spring.ithrer.board.model.vo;

import java.sql.Date;

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
public class PassBoardComment {
	private int pbCommentNo; //댓글번호
	private int pbCommentLevel; //댓글레벨
	private String pbCommentWriter; //댓글작성자
	private String pbCommentContent; //댓글내용
	private int pbBoardRef; //댓글이 달릴 원게시판번호
	private int pbCommentRef; //게시판 댓글 참조번호
	private Date pbCommentDate; //댓글 작성 날짜
	
}
