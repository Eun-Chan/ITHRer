package com.spring.ithrer.board.model.vo;

import java.sql.Date;

public class AnonyBoard {
	private int anonyBoardNo;
	private String anonyBoardTitle;
	private String anonyBoardWriter;
	private String anonyBoardContent;
	private Date anonyBoardDate;
	private int anonyBoardReadCount;
	private String anonyBoardPassword;
	
	public AnonyBoard() {
		super();
	}
	public int getAnonyBoardNo() {
		return anonyBoardNo;
	}
	public void setAnonyBoardNo(int anonyBoardNo) {
		this.anonyBoardNo = anonyBoardNo;
	}
	public String getAnonyBoardTitle() {
		return anonyBoardTitle;
	}
	public void setAnonyBoardTitle(String anonyBoardTitle) {
		this.anonyBoardTitle = anonyBoardTitle;
	}
	public String getAnonyBoardWriter() {
		return anonyBoardWriter;
	}
	public void setAnonyBoardWriter(String anonyBoardWriter) {
		this.anonyBoardWriter = anonyBoardWriter;
	}
	public String getAnonyBoardContent() {
		return anonyBoardContent;
	}
	public void setAnonyBoardContent(String anonyBoardContent) {
		this.anonyBoardContent = anonyBoardContent;
	}
	public Date getAnonyBoardDate() {
		return anonyBoardDate;
	}
	public void setAnonyBoardDate(Date anonyBoardDate) {
		this.anonyBoardDate = anonyBoardDate;
	}

	public int getAnonyBoardReadCount() {
		return anonyBoardReadCount;
	}
	public void setAnonyBoardReadCount(int anonyBoardReadCount) {
		this.anonyBoardReadCount = anonyBoardReadCount;
	}
	public String getAnonyBoardPassword() {
		return anonyBoardPassword;
	}
	public void setAnonyBoardPassword(String anonyBoardPassword) {
		this.anonyBoardPassword = anonyBoardPassword;
	}
	@Override
	public String toString() {
		return "AnonyBoard [anonyBoardNo=" + anonyBoardNo + ", anonyBoardTitle=" + anonyBoardTitle
				+ ", anonyBoardWriter=" + anonyBoardWriter + ", anonyBoardContent=" + anonyBoardContent
				+ ", anonyBoardDate=" + anonyBoardDate + ", readCount=" + anonyBoardReadCount + ", anonyBoardPassword="
				+ anonyBoardPassword + "]";
	}
	
	
}
