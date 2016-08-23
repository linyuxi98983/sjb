package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * SysSpArea entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Sys_SpArea", schema = "dbo")
public class SysSpArea implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String fullName;
	private String lcode;
	private Integer parentId;
	private Integer closed;
	private SysSpArea parent;// 父地区实体

	// Constructors

	/** default constructor */
	public SysSpArea() {
	}

	/** minimal constructor */
	public SysSpArea(Integer id, String name, String fullName) {
		this.id = id;
		this.name = name;
		this.fullName = fullName;
	}

	/** full constructor */
	public SysSpArea(Integer id, String name, String fullName, String lcode,
			Integer parentId) {
		this.id = id;
		this.name = name;
		this.fullName = fullName;
		this.lcode = lcode;
		this.parentId = parentId;
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

	@Column(name = "Name", nullable = false, length = 60)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "FullName", nullable = false, length = 120)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "LCode", length = 40)
	public String getLcode() {
		return this.lcode;
	}

	public void setLcode(String lcode) {
		this.lcode = lcode;
	}

	@Column(name = "ParentID")
	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	@Column(name = "Closed")
	public Integer getClosed() {
		return this.closed;
	}

	public void setClosed(Integer closed) {
		this.closed = closed;
	}

	@JSON(serialize = false)
	@Transient
	public SysSpArea getParent() {
		return parent;
	}

	public void setParent(SysSpArea parent) {
		this.parent = parent;
	}
}