package com.portfolio.jdh.domain;

import java.util.Date;

public class essayBoardVO {
	
	/*
	CREATE TABLE essayBoard(
	essayNo INT NOT NULL auto_increment,
	essayTitle VARCHAR(50) NOT NULL,
	essayShortTitle VARCHAR(50) NOT NULL,
	essayContent TEXT NOT NULL,
	essayWriter VARCHAR(30) NOT NULL,
	essayregDate DATETIME NOT NULL DEFAULT NOW(),
	essayViewCnt INT DEFAULT 0,
	PRIMARY KEY(essayNo)
)

	 */
	
	private int essayNo;
	private String essayTitle;
	private String essayShortTitle;
	private String essayContent;
	private String essayWriter;
	private Date essayregDate;
	private int essayViewCnt;
	
	public int getessayNo() {
		return essayNo;
	}
	public void setessayNo(int essayNo) {
		this.essayNo = essayNo;
	}
	public String getessayTitle() {
		return essayTitle;
	}
	public void setessayTitle(String essayTitle) {
		this.essayTitle = essayTitle;
	}
	public String getessayShortTitle() {
		return essayShortTitle;
	}
	public void setessayShortTitle(String essayShortTitle) {
		this.essayShortTitle = essayShortTitle;
	}
	public String getessayContent() {
		return essayContent;
	}
	public void setessayContent(String essayContent) {
		this.essayContent = essayContent;
	}
	public String getessayWriter() {
		return essayWriter;
	}
	public void setessayWriter(String essayWriter) {
		this.essayWriter = essayWriter;
	}
	public Date getessayregDate() {
		return essayregDate;
	}
	public void setessayregDate(Date essayregDate) {
		this.essayregDate = essayregDate;
	}
	public int getessayViewCnt() {
		return essayViewCnt;
	}
	public void setessayViewCnt(int essayViewCnt) {
		this.essayViewCnt = essayViewCnt;
	}
	
	
	
	
}
