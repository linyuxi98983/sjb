package com.jshop.entity;

import java.io.File;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * LtSpPhomepage entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpPHomepage", schema = "dbo")
public class LtSpPhomepage implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer closed;
	private Integer orderNo;
	private Integer positionType;
	private Integer height;
	private Integer moduleType;
	private String title;
	private String html;
	
	private Integer ltSpGoodsId;// null时跳转到商品列表，非空时跳转商品详情
	private File[] imageFiles;// 上传图片文件
	private String[] imageFilesFileName;// 上传图片名称
	private String orderNos;// 图片排序号
	private String deleteImageIds;// 被删除的图片ID
	private String urls;// 图片链接
	private List<LtSpPhomePagePicture> picList;// 图片列表

	private List<LtSpMember> memberList;

	// Constructors

	/** default constructor */
	public LtSpPhomepage() {
	}

	/** minimal constructor */
	public LtSpPhomepage(Integer id, Integer closed, Integer positionType,
			Integer height, Integer moduleType) {
		this.id = id;
		this.closed = closed;
		this.positionType = positionType;
		this.height = height;
		this.moduleType = moduleType;
	}

	/** full constructor */
	public LtSpPhomepage(Integer id, Integer closed, Integer orderNo,
			Integer positionType, Integer height, Integer moduleType,
			String title, String html, String url, Integer ltSpPromotionId) {
		this.id = id;
		this.closed = closed;
		this.orderNo = orderNo;
		this.positionType = positionType;
		this.height = height;
		this.moduleType = moduleType;
		this.title = title;
		this.html = html;
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

	@Column(name = "Closed", nullable = false)
	public Integer getClosed() {
		return this.closed;
	}

	public void setClosed(Integer closed) {
		this.closed = closed;
	}

	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Column(name = "PositionType", nullable = false)
	public Integer getPositionType() {
		return this.positionType;
	}

	public void setPositionType(Integer positionType) {
		this.positionType = positionType;
	}

	@Column(name = "Height", nullable = false)
	public Integer getHeight() {
		return this.height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	@Column(name = "ModuleType", nullable = false)
	public Integer getModuleType() {
		return this.moduleType;
	}

	public void setModuleType(Integer moduleType) {
		this.moduleType = moduleType;
	}

	@Column(name = "Title", length = 200)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "Html")
	public String getHtml() {
		return this.html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	

	@Transient
	@JSON(serialize = false)
	public File[] getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(File[] imageFiles) {
		this.imageFiles = imageFiles;
	}

	@Transient
	@JSON(serialize = false)
	public String[] getImageFilesFileName() {
		return imageFilesFileName;
	}

	public void setImageFilesFileName(String[] imageFilesFileName) {
		this.imageFilesFileName = imageFilesFileName;
	}

	@Transient
	@JSON(serialize = false)
	public String getOrderNos() {
		return orderNos;
	}

	public void setOrderNos(String orderNos) {
		this.orderNos = orderNos;
	}

	@Transient
	@JSON(serialize = false)
	public String getDeleteImageIds() {
		return deleteImageIds;
	}

	public void setDeleteImageIds(String deleteImageIds) {
		this.deleteImageIds = deleteImageIds;
	}

	@Transient
	@JSON(serialize = false)
	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}

	@Transient
	@JSON(serialize = false)
	public List<LtSpPhomePagePicture> getPicList() {
		return picList;
	}

	public void setPicList(List<LtSpPhomePagePicture> picList) {
		this.picList = picList;
	}

	@Transient
	@JSON(serialize = false)
	public Integer getLtSpGoodsId() {
		return ltSpGoodsId;
	}

	public void setLtSpGoodsId(Integer ltSpGoodsId) {
		this.ltSpGoodsId = ltSpGoodsId;
	}

	@Transient
	@JSON(serialize = false)
	public List<LtSpMember> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<LtSpMember> memberList) {
		this.memberList = memberList;
	}
	
	
	
}