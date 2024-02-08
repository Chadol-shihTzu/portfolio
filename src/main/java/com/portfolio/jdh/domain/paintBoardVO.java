package com.portfolio.jdh.domain;

import java.util.Date;

public class paintBoardVO {
	/*CREATE TABLE paintBoard(
	paintNo INT NOT NULL auto_increment,
	paintCategory varchar(50) not null,
	paintTitle VARCHAR(50) NOT NULL,
	paintDes TEXT NOT NULL,
	paintImg VARCHAR(200) NULL,
	paintThumbImg VARCHAR(200) NULL,
	paintWriter VARCHAR(30) NOT NULL,
	paintregDate DATETIME NOT NULL DEFAULT NOW(),
	paintViewCnt INT DEFAULT 0,
	PRIMARY KEY(paintNo)
)*/
	
	private int paintNo;
	private String paintCategory;
	private String paintTitle;
	private String paintDes;
	private String paintImg;
	private String paintThumbImg;
	private String paintWriter;
	private Date paintregDate;
	private int paintViewCnt;
	
	public int getpaintNo() {
		return paintNo;
	}
	public void setpaintNo(int paintNo) {
		this.paintNo = paintNo;
	}
	public String getpaintCategory() {
		return paintCategory;
	}
	public void setpaintCategory(String paintCategory) {
		this.paintCategory = paintCategory;
	}
	public String getpaintTitle() {
		return paintTitle;
	}
	public void setpaintTitle(String paintTitle) {
		this.paintTitle = paintTitle;
	}
	public String getpaintDes() {
		return paintDes;
	}
	public void setpaintDes(String paintDes) {
		this.paintDes = paintDes;
	}
	public String getpaintImg() {
		return paintImg;
	}
	public void setpaintImg(String paintImg) {
		this.paintImg = paintImg;
	}
	public String getpaintThumbImg() {
		return paintThumbImg;
	}
	public void setpaintThumbImg(String paintThumbImg) {
		this.paintThumbImg = paintThumbImg;
	}
	public String getpaintWriter() {
		return paintWriter;
	}
	public void setpaintWriter(String paintWriter) {
		this.paintWriter = paintWriter;
	}
	public Date getpaintregDate() {
		return paintregDate;
	}
	public void setpaintregDate(Date paintregDate) {
		this.paintregDate = paintregDate;
	}
	public int getpaintViewCnt() {
		return paintViewCnt;
	}
	public void setpaintViewCnt(int paintViewCnt) {
		this.paintViewCnt = paintViewCnt;
	}

}
