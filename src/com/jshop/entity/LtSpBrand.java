package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LtSpBrand entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpBrand", schema = "dbo")
public class LtSpBrand implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String lCode;
	private Integer closed;
	

	// Constructors

	/** default constructor */
	public LtSpBrand() {
	}

	
	public LtSpBrand(Integer id, String name, String lCode, Integer closed) {
		super();
		this.id = id;
		this.name = name;
		this.lCode = lCode;
		this.closed = closed;
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

	@Column(name = "Name", unique = true, nullable = false, length = 40)
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

	

	public String getlCode() {
		return lCode;
	}
	@Column(name = "LCode")
	public void setlCode(String lCode) {
		this.lCode = lCode;
	}



	
}