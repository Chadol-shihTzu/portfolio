package com.portfolio.jdh.domain;

import java.util.Date;

public class dramaBoardVO {
	
	/*
	CREATE TABLE dramaBoard(
	dramaNo INT NOT NULL auto_increment,
	dramaTitle VARCHAR(50) NOT NULL,
	dramaShortTitle VARCHAR(50) NOT NULL,
	dramaContent TEXT NOT NULL,
	dramaWriter VARCHAR(30) NOT NULL,
	dramaregDate DATETIME NOT NULL DEFAULT NOW(),
	dramaViewCnt INT DEFAULT 0,
	PRIMARY KEY(dramaNo)
)
	 */
	
	private int dramaNo;
	private String dramaTitle;
	private String dramaShortTitle;
	private String dramaContent;
	private String dramaWriter;
	private Date dramaregDate;
	private int dramaViewCnt;
	
	public int getdramaNo() {
		return dramaNo;
	}
	public void setdramaNo(int dramaNo) {
		this.dramaNo = dramaNo;
	}
	public String getdramaTitle() {
		return dramaTitle;
	}
	public void setdramaTitle(String dramaTitle) {
		this.dramaTitle = dramaTitle;
	}
	public String getdramaShortTitle() {
		return dramaShortTitle;
	}
	public void setdramaShortTitle(String dramaShortTitle) {
		this.dramaShortTitle = dramaShortTitle;
	}
	public String getdramaContent() {
		return dramaContent;
	}
	public void setdramaContent(String dramaContent) {
		this.dramaContent = dramaContent;
	}
	public String getdramaWriter() {
		return dramaWriter;
	}
	public void setdramaWriter(String dramaWriter) {
		this.dramaWriter = dramaWriter;
	}
	public Date getdramaregDate() {
		return dramaregDate;
	}
	public void setdramaregDate(Date dramaregDate) {
		this.dramaregDate = dramaregDate;
	}
	public int getdramaViewCnt() {
		return dramaViewCnt;
	}
	public void setdramaViewCnt(int dramaViewCnt) {
		this.dramaViewCnt = dramaViewCnt;
	}
	
	
	
	
}
