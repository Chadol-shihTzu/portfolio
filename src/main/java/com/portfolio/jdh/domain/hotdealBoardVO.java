package com.portfolio.jdh.domain;

import java.util.Date;

public class hotdealBoardVO {
	
	/*
	CREATE TABLE hotdealBoard(
	hotNo INT NOT NULL auto_increment,
	hotTitle VARCHAR(50) NOT NULL,
	hotCategory VARCHAR(50)) NOT NULL,
	hotUrl VARCHAR(50) NOT NULL,
	hotShop VARCHAR(50) NOT NULL,
	hotPrice INT NOT NULL,
	hotDelivery VARCHAR(50) NOT NULL,
	hotImg VARCHAR(200) NULL,
	hotContent TEXT NOT NULL,
	hotWriter VARCHAR(30) NOT NULL,
	hotregDate DATETIME NOT NULL DEFAULT NOW(),
	hotViewCnt INT DEFAULT 0,
	hotGood INT DEFAULT 0,
	hotBad INT DEFAULT 0
	PRIMARY KEY(hotNo)
	)
	 */
	
	private int hotNo;
	private String hotTitle;
	private String hotCategory;
	private String hotUrl;
	private String hotShop;
	private int hotPrice;
	private String hotDelivery;
	private String hotContent;
	private String hotImg;
	private String hotWriter;
	private Date hotregDate;
	private int hotViewCnt;
	private int hotGood;
	private int hotBad;
	
	public int getHotNo() {
		return hotNo;
	}
	public void setHotNo(int hotNo) {
		this.hotNo = hotNo;
	}
	public String getHotTitle() {
		return hotTitle;
	}
	public void setHotTitle(String hotTitle) {
		this.hotTitle = hotTitle;
	}
	public String getHotCategory() {
		return hotCategory;
	}
	public void setHotCategory(String hotCategory) {
		this.hotCategory = hotCategory;
	}
	public String getHotUrl() {
		return hotUrl;
	}
	public void setHotUrl(String hotUrl) {
		this.hotUrl = hotUrl;
	}
	public String getHotShop() {
		return hotShop;
	}
	public void setHotShop(String hotShop) {
		this.hotShop = hotShop;
	}
	public int getHotPrice() {
		return hotPrice;
	}
	public void setHotPrice(int hotPrice) {
		this.hotPrice = hotPrice;
	}
	public String getHotDelivery() {
		return hotDelivery;
	}
	public void setHotDelivery(String hotDelivery) {
		this.hotDelivery = hotDelivery;
	}
	public String getHotContent() {
		return hotContent;
	}
	public void setHotContent(String hotContent) {
		this.hotContent = hotContent;
	}
	public String getHotImg() {
		return hotImg;
	}
	public void setHotImg(String hotImg) {
		this.hotImg = hotImg;
	}
	public String getHotWriter() {
		return hotWriter;
	}
	public void setHotWriter(String hotWriter) {
		this.hotWriter = hotWriter;
	}
	public Date getHotregDate() {
		return hotregDate;
	}
	public void setHotregDate(Date hotregDate) {
		this.hotregDate = hotregDate;
	}
	public int getHotViewCnt() {
		return hotViewCnt;
	}
	public void setHotViewCnt(int hotViewCnt) {
		this.hotViewCnt = hotViewCnt;
	}
	public int getHotGood() {
		return hotGood;
	}
	public void setHotGood(int hotGood) {
		this.hotGood = hotGood;
	}
	public int getHotBad() {
		return hotBad;
	}
	public void setHotBad(int hotBad) {
		this.hotBad = hotBad;
	}
	
	
	
	
}
