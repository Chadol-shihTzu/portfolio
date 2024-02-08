package com.portfolio.jdh.domain;

import java.util.Date;

public class qnaBoardVO {
	
	/*CREATE TABLE qnaBoard(
	qnaNo INT NOT NULL auto_increment,
	qnaTitle VARCHAR(50) NOT NULL,
	qnaContent TEXT NOT NULL,
	qnaWriter VARCHAR(30) NOT NULL,
	qnaregDate DATETIME NOT NULL DEFAULT NOW(),
	qnaViewCnt INT DEFAULT 0,
	PRIMARY KEY(qnaNo)
)
		)*/
	
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private Date qnaregDate;
	private int qnaViewCnt;
	
	public int getqnaNo() {
		return qnaNo;
	}
	public void setqnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getqnaTitle() {
		return qnaTitle;
	}
	public void setqnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getqnaContent() {
		return qnaContent;
	}
	public void setqnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getqnaWriter() {
		return qnaWriter;
	}
	public void setqnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public Date getqnaregDate() {
		return qnaregDate;
	}
	public void setqnaregDate(Date qnaregDate) {
		this.qnaregDate = qnaregDate;
	}
	public int getqnaViewCnt() {
		return qnaViewCnt;
	}
	public void setqnaViewCnt(int qnaViewCnt) {
		this.qnaViewCnt = qnaViewCnt;
	}
	
	
	
}
