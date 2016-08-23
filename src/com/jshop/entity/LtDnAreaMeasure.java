package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "Lt_DnAreaMeasure", schema = "dbo")
public class LtDnAreaMeasure implements java.io.Serializable {
	private Integer id;
	private String name;
	private Integer closed;
	private Integer orderNo;
	private Integer minSqm;
	private Integer maxSqm;
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "Name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "Closed")
	public Integer getClosed() {
		return closed;
	}
	public void setClosed(Integer closed) {
		this.closed = closed;
	}
	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
	@Column(name = "MinSqm")
	public Integer getMinSqm() {
		return minSqm;
	}
	public void setMinSqm(Integer minSqm) {
		this.minSqm = minSqm;
	}
	@Column(name = "MaxSqm")
	public Integer getMaxSqm() {
		return maxSqm;
	}
	public void setMaxSqm(Integer maxSqm) {
		this.maxSqm = maxSqm;
	}
	
}
