package com.portfolio.jdh.domain;

import java.util.Date;

public class qnaReplyVO {
	private int qnaRno;
	private int qnaNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getqnaRno() {
		return qnaRno;
	}
	public void setqnaRno(int qnaRno) {
		this.qnaRno = qnaRno;
	}
	public int getqnaNo() {
		return qnaNo;
	}
	public void setqnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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
