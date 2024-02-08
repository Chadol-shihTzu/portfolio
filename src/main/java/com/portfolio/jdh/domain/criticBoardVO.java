package com.portfolio.jdh.domain;

import java.util.Date;

public class criticBoardVO {
	
	/*
	CREATE TABLE criticBoard(
	criticNo INT NOT NULL auto_increment,
	criticTitle VARCHAR(50) NOT NULL,
	criticShortTitle VARCHAR(50) NOT NULL,
	criticContent TEXT NOT NULL,
	criticWriter VARCHAR(30) NOT NULL,
	criticregDate DATETIME NOT NULL DEFAULT NOW(),
	criticViewCnt INT DEFAULT 0,
	PRIMARY KEY(criticNo)
	)
	 */
	
	private int criticNo;
	private String criticTitle;
	private String criticShortTitle;
	private String criticContent;
	private String criticWriter;
	private Date criticregDate;
	private int criticViewCnt;
	
	public int getCriticNo() {
		return criticNo;
	}
	public void setcriticNo(int criticNo) {
		this.criticNo = criticNo;
	}
	public String getcriticTitle() {
		return criticTitle;
	}
	public void setcriticTitle(String criticTitle) {
		this.criticTitle = criticTitle;
	}
	public String getCriticShortTitle() {
		return criticShortTitle;
	}
	public void setCriticShortTitle(String criticShortTitle) {
		this.criticShortTitle = criticShortTitle;
	}
	public String getcriticContent() {
		return criticContent;
	}
	public void setcriticContent(String criticContent) {
		this.criticContent = criticContent;
	}
	public String getcriticWriter() {
		return criticWriter;
	}
	public void setcriticWriter(String criticWriter) {
		this.criticWriter = criticWriter;
	}
	public Date getcriticregDate() {
		return criticregDate;
	}
	public void setcriticregDate(Date criticregDate) {
		this.criticregDate = criticregDate;
	}
	public int getcriticViewCnt() {
		return criticViewCnt;
	}
	public void setcriticViewCnt(int criticViewCnt) {
		this.criticViewCnt = criticViewCnt;
	}
	
	
	
	
}
