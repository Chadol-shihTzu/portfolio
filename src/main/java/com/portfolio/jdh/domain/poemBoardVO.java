package com.portfolio.jdh.domain;

import java.util.Date;

public class poemBoardVO {
	
	/*
	CREATE TABLE poemBoard(
	poemNo INT NOT NULL auto_increment,
	poemTitle VARCHAR(50) NOT NULL,
	poemShortTitle VARCHAR(50) NOT NULL,
	poemContent TEXT NOT NULL,
	poemWriter VARCHAR(30) NOT NULL,
	poemregDate DATETIME NOT NULL DEFAULT NOW(),
	poemViewCnt INT DEFAULT 0,
	PRIMARY KEY(poemNo)
	)
	 */
	
	private int poemNo;
	private String poemTitle;
	private String poemShortTitle;
	private String poemContent;
	private String poemWriter;
	private Date poemregDate;
	private int poemViewCnt;
	
	public int getpoemNo() {
		return poemNo;
	}
	public void setpoemNo(int poemNo) {
		this.poemNo = poemNo;
	}
	public String getpoemTitle() {
		return poemTitle;
	}
	public void setpoemTitle(String poemTitle) {
		this.poemTitle = poemTitle;
	}
	public String getpoemShortTitle() {
		return poemShortTitle;
	}
	public void setpoemShortTitle(String poemShortTitle) {
		this.poemShortTitle = poemShortTitle;
	}
	public String getpoemContent() {
		return poemContent;
	}
	public void setpoemContent(String poemContent) {
		this.poemContent = poemContent;
	}
	public String getpoemWriter() {
		return poemWriter;
	}
	public void setpoemWriter(String poemWriter) {
		this.poemWriter = poemWriter;
	}
	public Date getpoemregDate() {
		return poemregDate;
	}
	public void setpoemregDate(Date poemregDate) {
		this.poemregDate = poemregDate;
	}
	public int getpoemViewCnt() {
		return poemViewCnt;
	}
	public void setpoemViewCnt(int poemViewCnt) {
		this.poemViewCnt = poemViewCnt;
	}
	
	
	
	
}
