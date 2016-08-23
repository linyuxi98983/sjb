package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "Lt_DnInfo", schema = "dbo")
public class LtDnInfo implements java.io.Serializable{

	private Integer id;
	private String title;
	private String preview;
	private String html;
	private Integer orderNo;
	
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "Title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "Preview")
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	
	@Column(name = "HTML")
	public String getHtml() {
		return html;
	}
	public void setHtml(String html) {
		this.html = html;
	}
	
	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
}
