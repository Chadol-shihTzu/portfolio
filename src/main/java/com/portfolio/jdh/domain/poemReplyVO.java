package com.portfolio.jdh.domain;

import java.util.Date;

public class poemReplyVO {
	private int poemRno;
	private int poemNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getpoemRno() {
		return poemRno;
	}
	public void setpoemRno(int poemRno) {
		this.poemRno = poemRno;
	}
	public int getpoemNo() {
		return poemNo;
	}
	public void setpoemNo(int poemNo) {
		this.poemNo = poemNo;
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
