package com.portfolio.jdh.domain;

import java.util.Date;

public class recommendBoardVO {
	/*CREATE TABLE recommendBoard(
	recommendNo INT NOT NULL auto_increment,
	recommendCategory varchar(50) not null,
	recommendLocation varchar(50) not null,
	recommendTitle VARCHAR(50) NOT NULL,
	recommendContent TEXT NOT NULL,
	recommendImg VARCHAR(200) NULL,
	recommendWriter VARCHAR(30) NOT NULL,
	recommendregDate DATETIME NOT NULL DEFAULT NOW(),
	recommendViewCnt INT DEFAULT 0,
	recommendGood int default 0,
	recommendBad int default 0,
	PRIMARY KEY(recommendNo)
)*/
	
	private int recommendNo;
	private String recommendCategory;
	private String recommendLocation;
	private String recommendTitle;
	private String recommendContent;
	private String recommendImg;
	private String recommendWriter;
	private Date recommendregDate;
	private int recommendViewCnt;
	private int recommendGood;
	private int recommendBad;
	public int getRecommendNo() {
		return recommendNo;
	}
	public void setRecommendNo(int recommendNo) {
		this.recommendNo = recommendNo;
	}
	
	public String getRecommendCategory() {
		return recommendCategory;
	}
	public void setRecommendCategory(String recommendCategory) {
		this.recommendCategory = recommendCategory;
	}
	public String getRecommendLocation() {
		return recommendLocation;
	}
	public void setRecommendLocation(String recommendLocation) {
		this.recommendLocation = recommendLocation;
	}
	public String getRecommendTitle() {
		return recommendTitle;
	}
	public void setRecommendTitle(String recommendTitle) {
		this.recommendTitle = recommendTitle;
	}
	public String getRecommendContent() {
		return recommendContent;
	}
	public void setRecommendContent(String recommendContent) {
		this.recommendContent = recommendContent;
	}
	public String getRecommendImg() {
		return recommendImg;
	}
	public void setRecommendImg(String recommendImg) {
		this.recommendImg = recommendImg;
	}
	public String getRecommendWriter() {
		return recommendWriter;
	}
	public void setRecommendWriter(String recommendWriter) {
		this.recommendWriter = recommendWriter;
	}
	public Date getRecommendregDate() {
		return recommendregDate;
	}
	public void setRecommendregDate(Date recommendregDate) {
		this.recommendregDate = recommendregDate;
	}
	public int getRecommendViewCnt() {
		return recommendViewCnt;
	}
	public void setRecommendViewCnt(int recommendViewCnt) {
		this.recommendViewCnt = recommendViewCnt;
	}
	public int getRecommendGood() {
		return recommendGood;
	}
	public void setRecommendGood(int recommendGood) {
		this.recommendGood = recommendGood;
	}
	public int getRecommendBad() {
		return recommendBad;
	}
	public void setRecommendBad(int recommendBad) {
		this.recommendBad = recommendBad;
	}
	
	
}
