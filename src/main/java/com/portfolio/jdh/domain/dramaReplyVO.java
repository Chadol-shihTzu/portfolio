package com.portfolio.jdh.domain;

import java.util.Date;

public class dramaReplyVO {
	private int dramaRno;
	private int dramaNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getdramaRno() {
		return dramaRno;
	}
	public void setdramaRno(int dramaRno) {
		this.dramaRno = dramaRno;
	}
	public int getdramaNo() {
		return dramaNo;
	}
	public void setdramaNo(int dramaNo) {
		this.dramaNo = dramaNo;
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
