package com.portfolio.jdh.domain;

import java.util.Date;

public class recommendReplyVO {
	private int recommendRno;
	private int recommendNo;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getrecommendRno() {
		return recommendRno;
	}
	public void setrecommendRno(int recommendRno) {
		this.recommendRno = recommendRno;
	}
	public int getrecommendNo() {
		return recommendNo;
	}
	public void setrecommendNo(int recommendNo) {
		this.recommendNo = recommendNo;
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
