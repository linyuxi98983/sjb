package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "Lt_DnBudget", schema = "dbo")
public class LtDnBudget implements java.io.Serializable {

	private Integer id;
	private String name;
	private Integer closed;
	private Integer orderNo;
	private Integer minAmt;
	private Integer maxAmt;
	
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
	@Column(name = "MinAmt")
	public Integer getMinAmt() {
		return minAmt;
	}
	public void setMinAmt(Integer minAmt) {
		this.minAmt = minAmt;
	}
	@Column(name = "MaxAmt")
	public Integer getMaxAmt() {
		return maxAmt;
	}
	public void setMaxAmt(Integer maxAmt) {
		this.maxAmt = maxAmt;
	}
	
}
