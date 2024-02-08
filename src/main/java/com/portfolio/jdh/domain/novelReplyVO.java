package com.portfolio.jdh.domain;

import java.util.Date;

public class novelReplyVO {
	private int novelRno;
	private int novelNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getnovelRno() {
		return novelRno;
	}
	public void setnovelRno(int novelRno) {
		this.novelRno = novelRno;
	}
	public int getnovelNo() {
		return novelNo;
	}
	public void setnovelNo(int novelNo) {
		this.novelNo = novelNo;
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
