package com.spring.ithrer.board.model.vo;

import java.sql.Date;

public class AnonyBoard {
	private int anonyBoardNo;
	private String anonyBoardTitle;
	private String anonyBoardWriter;
	private String anonyBoardContent;
	private Date anonyBoardDate;
	private int readCount;
	private String anonyBoardPassword;
//	private char del_flag;
//	private int fileCount;
	
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
//	public int getFileCount() {
//		return fileCount;
//	}
//	public void setFileCount(int fileCount) {
//		this.fileCount = fileCount;
//	}
//	public List<Attachment> getFiles() {
//		return files;
//	}
//	public void setFiles(List<Attachment> files) {
//		this.files = files;
//	}
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
				+ ", anonyBoardDate=" + anonyBoardDate + ", readCount=" + readCount + ", anonyBoardPassword="
				+ anonyBoardPassword + "]";
	}
	
	
}
