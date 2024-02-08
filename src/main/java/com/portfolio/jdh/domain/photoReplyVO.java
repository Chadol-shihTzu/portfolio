package com.portfolio.jdh.domain;

import java.util.Date;

public class photoReplyVO {
	private int photoRno;
	private int photoNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getphotoRno() {
		return photoRno;
	}
	public void setphotoRno(int photoRno) {
		this.photoRno = photoRno;
	}
	public int getphotoNo() {
		return photoNo;
	}
	public void setphotoNo(int photoNo) {
		this.photoNo = photoNo;
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
