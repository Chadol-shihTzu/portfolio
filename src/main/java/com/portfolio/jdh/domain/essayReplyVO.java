package com.portfolio.jdh.domain;

import java.util.Date;

public class essayReplyVO {
	private int essayRno;
	private int essayNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getessayRno() {
		return essayRno;
	}
	public void setessayRno(int essayRno) {
		this.essayRno = essayRno;
	}
	public int getessayNo() {
		return essayNo;
	}
	public void setessayNo(int essayNo) {
		this.essayNo = essayNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
