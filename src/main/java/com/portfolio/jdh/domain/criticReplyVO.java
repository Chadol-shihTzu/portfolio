package com.portfolio.jdh.domain;

import java.util.Date;

public class criticReplyVO {
	private int criticRno;
	private int criticNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getCriticRno() {
		return criticRno;
	}
	public void setCriticRno(int criticRno) {
		this.criticRno = criticRno;
	}
	public int getCriticNo() {
		return criticNo;
	}
	public void setCriticNo(int criticNo) {
		this.criticNo = criticNo;
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
