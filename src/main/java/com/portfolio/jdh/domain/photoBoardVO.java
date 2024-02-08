package com.portfolio.jdh.domain;

import java.util.Date;

public class photoBoardVO {
	/*CREATE TABLE photoBoard(
			photoNo INT NOT NULL auto_increment,
			photoCategory VARCHAR(50) not null,
			photoTitle VARCHAR(50) NOT NULL,
			photoDes TEXT NOT NULL,
			photoImg VARCHAR(200) NOT NULL,
			photoThumbImg VARCHAR(200) NOT NULL,
			photoWriter VARCHAR(30) NOT NULL,
			photoregDate DATETIME NOT NULL DEFAULT NOW(),
			photoViewCnt INT DEFAULT 0,
			PRIMARY KEY(photoNo)
		)*/
	
	private int photoNo;
	private String photoCategory;
	private String photoTitle;
	private String photoDes;
	private String photoImg;
	private String photoThumbImg;
	private String photoWriter;
	private Date photoregDate;
	private int photoViewCnt;
	
	public int getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	public String getPhotoCategory() {
		return photoCategory;
	}
	public void setPhotoCategory(String photoCategory) {
		this.photoCategory = photoCategory;
	}
	public String getPhotoTitle() {
		return photoTitle;
	}
	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}
	public String getPhotoDes() {
		return photoDes;
	}
	public void setPhotoDes(String photoDes) {
		this.photoDes = photoDes;
	}
	public String getPhotoImg() {
		return photoImg;
	}
	public void setPhotoImg(String photoImg) {
		this.photoImg = photoImg;
	}
	public String getPhotoThumbImg() {
		return photoThumbImg;
	}
	public void setPhotoThumbImg(String photoThumbImg) {
		this.photoThumbImg = photoThumbImg;
	}
	public String getPhotoWriter() {
		return photoWriter;
	}
	public void setPhotoWriter(String photoWriter) {
		this.photoWriter = photoWriter;
	}
	public Date getPhotoregDate() {
		return photoregDate;
	}
	public void setPhotoregDate(Date photoregDate) {
		this.photoregDate = photoregDate;
	}
	public int getPhotoViewCnt() {
		return photoViewCnt;
	}
	public void setPhotoViewCnt(int photoViewCnt) {
		this.photoViewCnt = photoViewCnt;
	}

}
