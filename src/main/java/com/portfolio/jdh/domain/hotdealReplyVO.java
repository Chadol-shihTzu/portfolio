package com.portfolio.jdh.domain;

import java.util.Date;

public class hotdealReplyVO {
	private int hotRno;
	private int hotNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int gethotRno() {
		return hotRno;
	}
	public void sethotRno(int hotRno) {
		this.hotRno = hotRno;
	}
	public int gethotNo() {
		return hotNo;
	}
	public void sethotNo(int hotNo) {
		this.hotNo = hotNo;
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
