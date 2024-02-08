package com.portfolio.jdh.domain;

import java.util.Date;

public class annoBoardVO {
	
	/*CREATE TABLE annoBoard(
			annoNo INT NOT NULL auto_increment,
			annoTitle VARCHAR(50) NOT NULL,
			annoContent TEXT NOT NULL,
			annoWriter VARCHAR(30) NOT NULL,
			annoregDate DATETIME NOT NULL DEFAULT NOW(),
			annoViewCnt INT DEFAULT 0,
			PRIMARY KEY(annoNo)
		)*/
	
	private int annoNo;
	private String annoTitle;
	private String annoContent;
	private String annoWriter;
	private Date annoregDate;
	private int annoViewCnt;
	
	public int getAnnoNo() {
		return annoNo;
	}
	public void setAnnoNo(int annoNo) {
		this.annoNo = annoNo;
	}
	public String getAnnoTitle() {
		return annoTitle;
	}
	public void setAnnoTitle(String annoTitle) {
		this.annoTitle = annoTitle;
	}
	public String getAnnoContent() {
		return annoContent;
	}
	public void setAnnoContent(String annoContent) {
		this.annoContent = annoContent;
	}
	public String getAnnoWriter() {
		return annoWriter;
	}
	public void setAnnoWriter(String annoWriter) {
		this.annoWriter = annoWriter;
	}
	public Date getAnnoregDate() {
		return annoregDate;
	}
	public void setAnnoregDate(Date annoregDate) {
		this.annoregDate = annoregDate;
	}
	public int getAnnoViewCnt() {
		return annoViewCnt;
	}
	public void setAnnoViewCnt(int annoViewCnt) {
		this.annoViewCnt = annoViewCnt;
	}
	
	
	
}
