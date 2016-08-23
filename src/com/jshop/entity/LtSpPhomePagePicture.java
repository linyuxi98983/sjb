package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * LtSpPhomePagePicture entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpPHomePagePicture", schema = "dbo")
public class LtSpPhomePagePicture implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer ltSpPhomepageId;
	private Integer otSpPictureId;
	private Integer orderNo;
	private String url;
	private String imagePath;// 图片路径

	// Constructors

	/** default constructor */
	public LtSpPhomePagePicture() {
	}

	/** minimal constructor */
	public LtSpPhomePagePicture(Integer id, Integer ltSpPhomepageId,
			Integer otSpPictureId) {
		this.id = id;
		this.ltSpPhomepageId = ltSpPhomepageId;
		this.otSpPictureId = otSpPictureId;
	}

	/** full constructor */
	public LtSpPhomePagePicture(Integer id, Integer ltSpPhomepageId,
			Integer otSpPictureId, Integer orderNo) {
		this.id = id;
		this.ltSpPhomepageId = ltSpPhomepageId;
		this.otSpPictureId = otSpPictureId;
		this.orderNo = orderNo;
	}

	// Property accessors
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "Lt_SpPHomepageID", nullable = false)
	public Integer getLtSpPhomepageId() {
		return this.ltSpPhomepageId;
	}

	public void setLtSpPhomepageId(Integer ltSpPhomepageId) {
		this.ltSpPhomepageId = ltSpPhomepageId;
	}

	@Column(name = "Ot_SpPictureID", nullable = false)
	public Integer getOtSpPictureId() {
		return this.otSpPictureId;
	}

	public void setOtSpPictureId(Integer otSpPictureId) {
		this.otSpPictureId = otSpPictureId;
	}

	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Column(name = "URL", length = 300)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Transient
	@JSON(serialize = false)
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}