package com.portfolio.jdh.domain;

import java.util.Date;

public class paintReplyVO {
	private int paintRno;
	private int paintNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getpaintRno() {
		return paintRno;
	}
	public void setpaintRno(int paintRno) {
		this.paintRno = paintRno;
	}
	public int getpaintNo() {
		return paintNo;
	}
	public void setpaintNo(int paintNo) {
		this.paintNo = paintNo;
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
