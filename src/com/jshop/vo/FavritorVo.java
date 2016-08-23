package com.jshop.vo;

import java.sql.Timestamp;

import javax.persistence.Transient;

public class FavritorVo {
	private Integer id;
	private Integer keepKind;
	private Integer objectId;
	private Timestamp keepTime;
	private String imgPath;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getKeepKind() {
		return keepKind;
	}
	public void setKeepKind(Integer keepKind) {
		this.keepKind = keepKind;
	}
	public Integer getObjectId() {
		return objectId;
	}
	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}
	public Timestamp getKeepTime() {
		return keepTime;
	}
	public void setKeepTime(Timestamp keepTime) {
		this.keepTime = keepTime;
	}
	
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
}
