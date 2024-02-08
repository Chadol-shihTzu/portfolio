package com.portfolio.jdh.domain;

import java.util.Date;

public class novelBoardVO {
	
	/*
	CREATE TABLE novelBoard(
	novelNo INT NOT NULL auto_increment,
	novelTitle VARCHAR(50) NOT NULL,
	novelShortTitle VARCHAR(50) NOT NULL,
	novelContent TEXT NOT NULL,
	novelWriter VARCHAR(30) NOT NULL,
	novelregDate DATETIME NOT NULL DEFAULT NOW(),
	novelViewCnt INT DEFAULT 0,
	PRIMARY KEY(novelNo)
)

	 */
	
	private int novelNo;
	private String novelTitle;
	private String novelShortTitle;
	private String novelContent;
	private String novelWriter;
	private Date novelregDate;
	private int novelViewCnt;
	
	public int getnovelNo() {
		return novelNo;
	}
	public void setnovelNo(int novelNo) {
		this.novelNo = novelNo;
	}
	public String getnovelTitle() {
		return novelTitle;
	}
	public void setnovelTitle(String novelTitle) {
		this.novelTitle = novelTitle;
	}
	public String getnovelShortTitle() {
		return novelShortTitle;
	}
	public void setnovelShortTitle(String novelShortTitle) {
		this.novelShortTitle = novelShortTitle;
	}
	public String getnovelContent() {
		return novelContent;
	}
	public void setnovelContent(String novelContent) {
		this.novelContent = novelContent;
	}
	public String getnovelWriter() {
		return novelWriter;
	}
	public void setnovelWriter(String novelWriter) {
		this.novelWriter = novelWriter;
	}
	public Date getnovelregDate() {
		return novelregDate;
	}
	public void setnovelregDate(Date novelregDate) {
		this.novelregDate = novelregDate;
	}
	public int getnovelViewCnt() {
		return novelViewCnt;
	}
	public void setnovelViewCnt(int novelViewCnt) {
		this.novelViewCnt = novelViewCnt;
	}
	
	
	
	
}
