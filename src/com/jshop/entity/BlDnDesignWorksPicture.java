package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings("serial")
@Entity
@Table(name = "Bl_DnDesignWorksPicture", schema = "dbo")
public class BlDnDesignWorksPicture implements java.io.Serializable {
	private Integer id;
	private Integer blDnDesignWorksId;
	private Integer otSpPictureId;
	private Integer orderNo;
	private String imagePath;
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "Bl_DnDesignWorksID")
	public Integer getBlDnDesignWorksId() {
		return blDnDesignWorksId;
	}
	public void setBlDnDesignWorksId(Integer blDnDesignWorksId) {
		this.blDnDesignWorksId = blDnDesignWorksId;
	}
	@Column(name = "Ot_SpPictureID")
	public Integer getOtSpPictureId() {
		return otSpPictureId;
	}
	public void setOtSpPictureId(Integer otSpPictureId) {
		this.otSpPictureId = otSpPictureId;
	}
	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	@JSON(serialize = true)
	@Transient
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
}
