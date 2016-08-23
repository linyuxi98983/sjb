package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * LtSpPhomepageGoods entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpPHomepageGoods", schema = "dbo")
public class LtSpPhomepageGoods implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer ltSpPhomepageId;
	private Integer ltSpGoodsId;
	private Integer orderNo;
	private Double showPrice;// 展示价格
	private String imagePath;// 图片路径
	private String goodsName;// 商品名称
	private Double memberShowPrice;// 当前会员查看到的最低价格，包括会员等级、促销活动等

	// Constructors

	/** default constructor */
	public LtSpPhomepageGoods() {
	}

	/** minimal constructor */
	public LtSpPhomepageGoods(Integer id, Integer ltSpPhomepageId,
			Integer ltSpGoodsId) {
		this.id = id;
		this.ltSpPhomepageId = ltSpPhomepageId;
		this.ltSpGoodsId = ltSpGoodsId;
	}

	/** full constructor */
	public LtSpPhomepageGoods(Integer id, Integer ltSpPhomepageId,
			Integer ltSpGoodsId, Integer orderNo) {
		this.id = id;
		this.ltSpPhomepageId = ltSpPhomepageId;
		this.ltSpGoodsId = ltSpGoodsId;
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

	@Column(name = "Lt_SpGoodsID", nullable = false)
	public Integer getLtSpGoodsId() {
		return this.ltSpGoodsId;
	}

	public void setLtSpGoodsId(Integer ltSpGoodsId) {
		this.ltSpGoodsId = ltSpGoodsId;
	}

	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Transient
	@JSON(serialize = false)
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Transient
	@JSON(serialize = false)
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	@Transient
	@JSON(serialize = false)
	public Double getShowPrice() {
		return showPrice;
	}

	public void setShowPrice(Double showPrice) {
		this.showPrice = showPrice;
	}

	@Transient
	@JSON(serialize = false)
	public Double getMemberShowPrice() {
		return memberShowPrice;
	}

	public void setMemberShowPrice(Double memberShowPrice) {
		this.memberShowPrice = memberShowPrice;
	}
}