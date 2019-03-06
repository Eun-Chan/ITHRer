package com.spring.ithrer.board.model.vo;

import java.sql.Date;

public class PassBoard {
	private int passBoardNo;
	private String passBoardTitle;
	private String passBoardWriter;
	private String passBoardContent;
	private Date passBoardDate;
	private int passBoardReadCount;

	public PassBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PassBoard(int passBoardNo, String passBoardTitle, String passBoardWriter, String passBoardContent,
			Date passBoardDate, int passBoardReadCount) {
		super();
		this.passBoardNo = passBoardNo;
		this.passBoardTitle = passBoardTitle;
		this.passBoardWriter = passBoardWriter;
		this.passBoardContent = passBoardContent;
		this.passBoardDate = passBoardDate;
		this.passBoardReadCount = passBoardReadCount;
	}
	public int getPassBoardNo() {
		return passBoardNo;
	}
	public void setPassBoardNo(int passBoardNo) {
		this.passBoardNo = passBoardNo;
	}
	public String getPassBoardTitle() {
		return passBoardTitle;
	}
	public void setPassBoardTitle(String passBoardTitle) {
		this.passBoardTitle = passBoardTitle;
	}
	public String getPassBoardWriter() {
		return passBoardWriter;
	}
	public void setPassBoardWriter(String passBoardWriter) {
		this.passBoardWriter = passBoardWriter;
	}
	public String getPassBoardContent() {
		return passBoardContent;
	}
	public void setPassBoardContent(String passBoardContent) {
		this.passBoardContent = passBoardContent;
	}
	public Date getPassBoardDate() {
		return passBoardDate;
	}
	public void setPassBoardDate(Date passBoardDate) {
		this.passBoardDate = passBoardDate;
	}
	public int getPassBoardReadCount() {
		return passBoardReadCount;
	}
	public void setPassBoardReadCount(int passBoardReadCount) {
		this.passBoardReadCount = passBoardReadCount;
	}
	@Override
	public String toString() {
		return "PassBoard [passBoardNo=" + passBoardNo + ", passBoardTitle=" + passBoardTitle + ", passBoardWriter="
			+ passBoardWriter + ", passBoardContent=" + passBoardContent + ", passBoardDate=" + passBoardDate
			+ ", passBoardReadCount=" + passBoardReadCount + "]";
	}
	
		
}
