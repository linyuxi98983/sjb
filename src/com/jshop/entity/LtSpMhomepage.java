package com.jshop.entity;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * LtSpMhomepage entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpMHomepage", schema = "dbo")
public class LtSpMhomepage implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer closed;
	private Integer orderNo;
	private Integer moduleType;
	private String title;
	private String html;
	
	private Integer showGoodsCount;
	private Timestamp showStartTime;
	private Timestamp showEndTime;
	private Integer ltSpGoodsId;// null时跳转到商品列表，非空时跳转商品详情
	private File[] imageFiles;// 上传图片文件
	private String[] imageFilesFileName;// 上传图片名称
	private String orderNos;// 图片排序号
	private String deleteImageIds;// 被删除的图片ID
	private String urls;// 图片链接
	private List<LtSpMhomePagePicture> picList;// 图片列表	
	private Long start;// 开始时间戳
	private Long end;// 结束时间戳
	private Long now;// 当前系统时间戳

	// Constructors

	/** default constructor */
	public LtSpMhomepage() {
	}

	/** minimal constructor */
	public LtSpMhomepage(Integer id, Integer closed, Integer moduleType) {
		this.id = id;
		this.closed = closed;
		this.moduleType = moduleType;
	}

	/** full constructor */
	public LtSpMhomepage(Integer id, Integer closed, Integer orderNo,
			Integer moduleType, String title, String html, String url,
			Integer ltSpPromotionId) {
		this.id = id;
		this.closed = closed;
		this.orderNo = orderNo;
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

	
	@Column(name = "ShowGoodsCount", nullable = false)
	public Integer getShowGoodsCount() {
		return showGoodsCount;
	}

	public void setShowGoodsCount(Integer showGoodsCount) {
		this.showGoodsCount = showGoodsCount;
	}

	@Column(name = "ShowStartTime", nullable = false, length = 23)
	public Timestamp getShowStartTime() {
		return this.showStartTime;
	}

	public void setShowStartTime(Timestamp showStartTime) {
		this.showStartTime = showStartTime;
	}

	@Column(name = "ShowEndTime", nullable = false, length = 23)
	public Timestamp getShowEndTime() {
		return showEndTime;
	}

	public void setShowEndTime(Timestamp showEndTime) {
		this.showEndTime = showEndTime;
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
	public List<LtSpMhomePagePicture> getPicList() {
		return picList;
	}

	public void setPicList(List<LtSpMhomePagePicture> picList) {
		this.picList = picList;
	}

	/*@Transient
	@JSON(serialize = false)
	public List<LtSpGoodsType> getGoodsTypeList() {
		return goodsTypeList;
	}

	public void setGoodsTypeList(List<LtSpGoodsType> goodsTypeList) {
		this.goodsTypeList = goodsTypeList;
	}*/

	
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
	public Long getStart() {
		return start;
	}

	public void setStart(Long start) {
		this.start = start;
	}

	@Transient
	@JSON(serialize = false)
	public Long getEnd() {
		return end;
	}

	public void setEnd(Long end) {
		this.end = end;
	}

	@Transient
	@JSON(serialize = false)
	public Long getNow() {
		return now;
	}

	public void setNow(Long now) {
		this.now = now;
	}
}