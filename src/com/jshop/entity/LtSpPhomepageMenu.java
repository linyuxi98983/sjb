package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LtSpPhomepageMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpPHomepageMenu", schema = "dbo")
public class LtSpPhomepageMenu implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer closed;
	private Integer orderNo;
	private String url;

	// Constructors

	/** default constructor */
	public LtSpPhomepageMenu() {
	}

	/** minimal constructor */
	public LtSpPhomepageMenu(Integer id, String name, Integer closed) {
		this.id = id;
		this.name = name;
		this.closed = closed;
	}

	/** full constructor */
	public LtSpPhomepageMenu(Integer id, String name, Integer closed,
			Integer orderNo, String url) {
		this.id = id;
		this.name = name;
		this.closed = closed;
		this.orderNo = orderNo;
		this.url = url;
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

	@Column(name = "Name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Column(name = "URL", length = 300)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}