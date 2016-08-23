package com.jshop.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OtSpPicture entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Ot_SpPicture", schema = "dbo")
public class OtSpPicture implements java.io.Serializable {

	// Fields

	private Integer id;
	private String picFileName;
	private Timestamp uploadTime;

	// Constructors

	/** default constructor */
	public OtSpPicture() {
	}

	/** full constructor */
	public OtSpPicture(Integer id, String picFileName, Timestamp uploadTime) {
		this.id = id;
		this.picFileName = picFileName;
		this.uploadTime = uploadTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "PicFileName", nullable = false, length = 60)
	public String getPicFileName() {
		return this.picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	@Column(name = "UploadTime", nullable = false, length = 23)
	public Timestamp getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}

}